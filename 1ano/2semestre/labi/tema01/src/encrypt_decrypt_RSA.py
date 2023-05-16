import os
import sys
import hashlib
from Crypto.Cipher import AES, PKCS1_OAEP
from Crypto.PublicKey import RSA

BLOCK_SIZE = 16


def generate_key(key):
    if len(key) < BLOCK_SIZE:
        # Gerar uma síntese de chave com SHA-256
        key = hashlib.sha256(key.encode('utf-8')).digest()
    else:
        # Usar apenas os primeiros 256 octetos
        key = key[:BLOCK_SIZE].encode('utf-8')
    return key


def pad_data(data):
    pad_len = BLOCK_SIZE - (len(data) % BLOCK_SIZE)
    padding = bytes([pad_len] * pad_len)
    return data + padding


def unpad_data(data):
    pad_len = data[-1]
    return data[:-pad_len]


def encrypt_file(file_path, key, output_path):
    with open(file_path, 'rb') as file:
        data = file.read()

    # Gerar chave simétrica aleatória
    symmetric_key = os.urandom(BLOCK_SIZE)

    # Cifrar dados do arquivo
    cipher = AES.new(symmetric_key, AES.MODE_EAX)
    ciphertext, tag = cipher.encrypt_and_digest(pad_data(data))

    # Cifrar chave simétrica com chave pública RSA
    with open(key, 'rb') as key_file:
        recipient_key = RSA.import_key(key_file.read())
    cipher_rsa = PKCS1_OAEP.new(recipient_key)
    encrypted_symmetric_key = cipher_rsa.encrypt(symmetric_key)

    # Concatenar nonce, tag, chave cifrada e dados cifrados em um único arquivo
    with open(output_path, 'wb') as output_file:
        output_file.write(cipher.nonce)
        output_file.write(tag)
        output_file.write(encrypted_symmetric_key)
        output_file.write(ciphertext)


def decrypt_file(file_path, key, output_path):
    with open(file_path, 'rb') as file:
        data = file.read()

    # Separar nonce, tag, chave cifrada e dados cifrados
    nonce = data[:16]
    tag = data[16:32]
    encrypted_symmetric_key = data[32:288]
    ciphertext = data[288:]

    # Decifrar chave simétrica com chave privada RSA
    with open(key, 'rb') as key_file:
        private_key = RSA.import_key(key_file.read(), passphrase=input("Enter passphrase for private key: "))
    cipher_rsa = PKCS1_OAEP.new(private_key)
    symmetric_key = cipher_rsa.decrypt(encrypted_symmetric_key)

    # Descriptografar arquivo
    cipher = AES.new(symmetric_key, AES.MODE_EAX, nonce=nonce)
    plaintext = cipher.decrypt_and_verify(ciphertext, tag)

    # Remover padding
    plaintext = unpad_data(plaintext)

    # Escrever arquivo decifrado
    with open(output_path, 'wb') as output_file:
        output_file.write(plaintext)


if __name__ == '__main__':
    if len(sys.argv) != 5:
        print('Usage: python3 encrypt_decrypt_file.py encrypt|decrypt file key output_file', file=sys.stderr)
        sys.exit(1)

    action = sys.argv[1]
    file_path = sys.argv[2]
    key = sys.argv[3]
    output_path = sys.argv[4]

    if action == 'encrypt':
        encrypt_file(file_path, key, output_path)
    elif action == 'decrypt':
        decrypt_file(file_path, key, output_path)
