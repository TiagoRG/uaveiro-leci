import sys
import hashlib
from Crypto.Cipher import ARC4


def generate_key(key):
    if len(key) < 5:
        # Gerar uma síntese de chave com SHA-256
        key = hashlib.sha256(key.encode('utf-8')).digest()
    elif len(key) > 256:
        # Usar apenas os primeiros 256 octetos
        key = key[:256].encode('utf-8')
    else:
        key = key.encode('utf-8')
    return key


def encrypt_file(file_path, key):
    with open(file_path, 'rb') as file:
        data = file.read()
    cipher = ARC4.new(generate_key(key))
    ciphertext = cipher.encrypt(data)
    sys.stdout.buffer.write(ciphertext)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python3 Ex4.py file key > file_to_send_encriptation', file=sys.stderr)
        sys.exit(1)
    file_path = sys.argv[1]
    key = sys.argv[2]
    encrypt_file(file_path, key)
