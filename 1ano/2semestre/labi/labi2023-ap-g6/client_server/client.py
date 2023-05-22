#!/usr/bin/python3
import os
import re
import sys
import socket
import json
import base64
from common_comm import send_dict, recv_dict, sendrecv_dict

from Crypto.Cipher import AES
from Crypto.Hash import SHA256


class Tcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


# Function to encript values for sending in json format
# return int data encrypted in a 16 bytes binary string coded in base64
def encrypt_intvalue(cipherkey, data):
    key = base64.b64decode(cipherkey)
    cipher = AES.new(key, AES.MODE_ECB)
    data = cipher.encrypt(bytes("%16d" % data, "utf8"))
    return str(base64.b64encode(data), "utf8")


# Function to decript values received in json format
# return int data decrypted from a 16 bytes binary strings coded in base64
def decrypt_intvalue(cipherkey, data_arg):
    cipher = AES.new(base64.b64decode(cipherkey), AES.MODE_ECB)
    data = base64.b64decode(data_arg)
    data = cipher.decrypt(data)
    return int(str(data, "utf8"))


# verify if response from server is valid or is an error message and act accordingly - já está implementada
def validate_response(client_sock, response):
    if not response["status"]:
        print(f"{Tcolors.FAIL}Error: {response['error']}{Tcolors.ENDC}")
        client_sock.close()
        sys.exit(3)


# process QUIT operation
def quit_action(client_sock, has_started):
    print(f"{Tcolors.ENDC}Quitting...")
    if has_started:
        senddata = {"op": "QUIT"}
        recvdata = sendrecv_dict(client_sock, senddata)

        try:
            # status = False
            if not recvdata["status"]:
                print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: {recvdata['error']}{Tcolors.ENDC}")
                return
        except TypeError:
            print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: an error occurred with the server.{Tcolors.ENDC}")
            print(f"{Tcolors.ENDC}{Tcolors.WARNING}Client not removed from server, quitting...{Tcolors.ENDC}")
            client_sock.close()
            exit(1)
            
    # status = True
    print(f"{Tcolors.OKGREEN}Client quit with success")
    client_sock.close()
    exit(0)


# Outcomming message structure:
# { op = "START", client_id, [cipher] }
# { op = "QUIT" }
# { op = "NUMBER", number }
# { op = "STOP", [shasum] }
# { op = "GUESS", choice }
#
# Incomming message structure:
# { op = "START", status }
# { op = "QUIT" , status }
# { op = "NUMBER", status }
# { op = "STOP", status, value }
# { op = "GUESS", status, result }

#
# Suport for executing the client pretended behaviour
#

# returns a valid number
def returnValidNum():
    while 1:
        try:
            num = int(input(f"\n{Tcolors.ENDC}{Tcolors.BOLD}Number > {Tcolors.UNDERLINE}"))
        except ValueError:
            print(f"{Tcolors.ENDC}{Tcolors.WARNING}Invalid input{Tcolors.ENDC}")
            continue
        break
    return num


# verify if port is valid
def verify_port(port):
    # verify if port is a number
    if not port.isdigit():
        return {"status": False, "error": "Port must be an integer"}
    # verify if port is between 1024 and 65535
    if not (1024 <= int(port) <= 65535):
        return {"status": False, "error": "Port number must be between 1024 and 65535"}
    return {"status": True, "port": int(port)}


# verify if hostname is valid
def verify_hostname(hostname):
    if hostname == "localhost":
        return {"status": True}
    if not (re.match(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$', hostname) and all(0 <= int(n) < 256 for n in hostname.split('.'))):
        return {"status": False, "error": "Invalid DNS address"}
    return {"status": True}


def run_client(client_sock, client_id):
    # Print the welcome message
    print(f"{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}\n")

    # client runtime global variables
    has_stopped = False
    has_started = False
    cipherkey = None
    numbers = []

    while 1:
        option = input(f"{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}")

        # start option
        if option.upper() == "START":
            if has_started:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}Client already started\n{Tcolors.ENDC}")
                continue

            while 1:
                # ask user if cipher is needed
                choice = input(f"\n{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}")
                if choice.upper() == "Y":
                    # create cipher key for server
                    cipherkey = base64.b64encode(os.urandom(16)).decode()
                    break
                elif choice.upper() == "N":
                    # do nothing since cipher will be None
                    break
                else:
                    # loop if invalid option
                    print(f"{Tcolors.ENDC}{Tcolors.WARNING}Invalid input{Tcolors.ENDC}")
                    continue

            # send dict and receive response
            senddata = {"op": "START", "client_id": client_id, "cipher": cipherkey}
            recvdata = sendrecv_dict(client_sock, senddata)

            try:
                # status = False
                if not recvdata["status"]:
                    print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: {recvdata['error']}{Tcolors.ENDC}")
                    print(f"{Tcolors.ENDC}{Tcolors.WARNING}Client not added, quitting...{Tcolors.ENDC}")
                    client_sock.close()
                    exit(1)
            except TypeError:
                print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: an error occurred with the server, try again later{Tcolors.ENDC}")
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}Client not added, quitting...{Tcolors.ENDC}")
                client_sock.close()
                exit(1)

            # status = True
            has_started = True
            print(f"{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}\n")

        elif option.upper() == "QUIT":
            quit_action(client_sock, has_started)
            continue

        elif option.upper() == "NUMBER":
            if not has_started:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}You must start the game first\n{Tcolors.ENDC}")
                continue

            if has_stopped:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}You can't add more numbers\n{Tcolors.ENDC}")
                continue
            # verify if number is int
            num = returnValidNum()

            # encrypt the number is a cipher is being used
            if cipherkey is not None:
                encrypted_num = encrypt_intvalue(cipherkey, num)
            else:
                encrypted_num = num

            # send dict and receive response
            senddata = {"op": "NUMBER", "number": encrypted_num}
            recvdata = sendrecv_dict(client_sock, senddata)

            try:
                # status = False
                if not recvdata["status"]:
                    print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: {recvdata['error']}{Tcolors.ENDC}")
                    client_sock.close()
                    continue
                # status = True
                numbers.append(num)
                print(f"{Tcolors.ENDC}{Tcolors.OKGREEN}Number added with success{Tcolors.ENDC}\n")
            except TypeError:
                print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: an error occurred with the server\nSocket has been closed, try to start again{Tcolors.ENDC}")
                client_sock.close()
                has_started = False
                cipherkey = None
                numbers = []
                continue

        elif option.upper() == "STOP":
            # check if client has started the game
            if not has_started:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}You must start the game first\n{Tcolors.ENDC}")
                continue
            # check if client has stopped adding numbers
            if has_stopped:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}You can't stop the game again\n{Tcolors.ENDC}")
                continue

            # creates the synthesis for the number list
            hasher = SHA256.new()
            for number in numbers:
                hasher.update(bytes(str(number), "utf8"))

            # send dict and receive response
            senddata = {"op": "STOP", "shasum": hasher.hexdigest()}
            recvdata = sendrecv_dict(client_sock, senddata)

            try:
                # status = False
                if not recvdata["status"]:
                    print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: {recvdata['error']}{Tcolors.ENDC}")
                    continue
            except TypeError:
                print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: an error occurred with the server\nSocket has been closed, try to start again{Tcolors.ENDC}")
                client_sock.close()
                has_started = False
                cipherkey = None
                numbers = []
                continue

            # decipher data if using encryption
            data = recvdata["value"]
            if cipherkey is not None:
                data = decrypt_intvalue(cipherkey, data)
            has_stopped = True
            # status = True
            print(f"{Tcolors.ENDC}{Tcolors.OKGREEN}\nChosen number: {Tcolors.UNDERLINE}{data}{Tcolors.ENDC}\n")

        elif option.upper() == "GUESS":
            # check if client has started the game
            if not has_started:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}You must start the game first\n{Tcolors.ENDC}")
                continue
            # check if client has stopped adding numbers
            if not has_stopped:
                print(f"{Tcolors.ENDC}{Tcolors.WARNING}You can't guess before stopping the game\n{Tcolors.ENDC}")
                continue

            # print the possible choices
            print(f"""
{Tcolors.ENDC}Choose one of the following options:
1 - first
2 - last
3 - min
4 - max
5 - median
6 - min, first
7 - max, first
8 - min, last
9 - max, last
10 - median, first
11 - median, last
""")
            while True:
                try:
                    choice_num = int(input(f"{Tcolors.BOLD}\n> {Tcolors.UNDERLINE}"))
                    if choice_num == 1:
                        choice = ["first"]
                    elif choice_num == 2:
                        choice = ["last"]
                    elif choice_num == 3:
                        choice = ["min"]
                    elif choice_num == 4:
                        choice = ["max"]
                    elif choice_num == 5:
                        choice = ["median"]
                    elif choice_num == 6:
                        choice = ["min", "first"]
                    elif choice_num == 7:
                        choice = ["max", "first"]
                    elif choice_num == 8:
                        choice = ["min", "last"]
                    elif choice_num == 9:
                        choice = ["max", "last"]
                    elif choice_num == 10:
                        choice = ["median", "first"]
                    elif choice_num == 11:
                        choice = ["median", "last"]
                    else:
                        print(f"{Tcolors.ENDC}{Tcolors.WARNING}Invalid input{Tcolors.ENDC}")
                        continue
                    break
                except ValueError:
                    print(f"{Tcolors.ENDC}{Tcolors.WARNING}Invalid input{Tcolors.ENDC}")
                    continue

            # send dict and receive response
            senddata = {"op": "GUESS", "choice": choice}
            recvdata = sendrecv_dict(client_sock, senddata)

            try:
                # status = False
                if not recvdata["status"]:
                    print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: {recvdata['error']}{Tcolors.ENDC}")
                    continue
            except TypeError:
                print(f"{Tcolors.ENDC}{Tcolors.FAIL}Error: an error occurred with the server\nSocket has been closed, try to start again{Tcolors.ENDC}")
                client_sock.close()
                has_started = False
                cipherkey = None
                numbers = []
                continue

            # status = True
            print(f"\n\n{Tcolors.ENDC}{Tcolors.BOLD}{Tcolors.OKBLUE}{'='*15}\n\n{Tcolors.UNDERLINE}{Tcolors.OKCYAN}"
                  + ("You are right!" if recvdata["result"] else "You are wrong!")
                  + f"{Tcolors.ENDC}{Tcolors.BOLD}{Tcolors.OKBLUE}\n\n{'='*15}{Tcolors.ENDC}\n\n")
            quit_action(client_sock, has_started)
        else:
            print(f"{Tcolors.ENDC}{Tcolors.WARNING}Invalid option!\n{Tcolors.ENDC}")

    return None


def main():
    # validate the number of arguments and eventually print error message and exit with error
    # verify type of arguments and eventually print error message and exit with error
    if len(sys.argv) not in [3, 4]:
        print(f"{Tcolors.WARNING}Usage: python3 client.py client_id port DNS{Tcolors.ENDC}")
        sys.exit(1)

    # check if indicated port is valid and get its value
    port = sys.argv[2]
    verified = verify_port(port)
    if not verified["status"]:
        print(f"{Tcolors.WARNING}{verified['error']}{Tcolors.ENDC}")
        sys.exit(1)
    port = verified["port"]

    # get the ip address of the DNS and get its value
    hostname = sys.argv[3] if len(sys.argv) == 4 else socket.gethostbyname(socket.gethostname())
    verified = verify_hostname(hostname)
    if not verified["status"]:
        print(f"{Tcolors.WARNING}{verified['error']}{Tcolors.ENDC}")
        sys.exit(1)

    # create the socket
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.bind(("0.0.0.0", 0))

    # catch error message if server does not exist in those specifications
    print(f"{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}")
    try:
        client_socket.connect((hostname, port))
    except OSError:
        print(f"{Tcolors.FAIL}Error: connection to server failed{Tcolors.ENDC}")
        sys.exit(1)

    # send confirmation about the connection
    print(f"{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{sys.argv[1]}\n{Tcolors.ENDC}")

    # run the client
    run_client(client_socket, sys.argv[1])

    client_socket.close()
    sys.exit(0)


if __name__ == "__main__":
    main()
