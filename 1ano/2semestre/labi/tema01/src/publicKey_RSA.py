from Crypto.PublicKey import RSA


def generate_key_pair(file_name, encryption_key, key_size):
    # Generate the RSA key pair
    key = RSA.generate(key_size)

    # Write the private key to a file
    private_key = key.exportKey("PEM", encryption_key )
    with open(file_name + '_private.pem', 'wb') as f:
        f.write(private_key)

    # Write the public key to a file
    public_key = key.publickey().exportKey()
    with open(file_name + '_public.pem', 'wb') as f:
        f.write(public_key)


if __name__ == '__main__':
    file_name = input('Enter file name to save the key pair: ')
    encryption_key = input('Enter encryption key for the private key (press enter for no encryption): ')
    key_size = int(input('Enter the key size (in bits): '))
    generate_key_pair(file_name, encryption_key, key_size)
