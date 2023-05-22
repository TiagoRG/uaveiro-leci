import socket
from subprocess import Popen
from subprocess import PIPE
import pytest


# class for colors in terminal
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


def test_arguments():
    # start of testing lack of or too many sys.argv
    proc = Popen("python3 client.py", stdout=PIPE, shell=True)
    output = proc.stdout.read()

    assert output == f"{Tcolors.WARNING}Usage: python3 client.py client_id port DNS{Tcolors.ENDC}\n".encode("utf-8")

    proc = Popen("python3 client.py test", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")

    assert output == f"{Tcolors.WARNING}Usage: python3 client.py client_id port DNS{Tcolors.ENDC}\n"

    proc = Popen("python3 client.py test 2000 123.245.14.25 123", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")

    assert output == f"{Tcolors.WARNING}Usage: python3 client.py client_id port DNS{Tcolors.ENDC}\n"
    # end of testing lack of or too many sys.argv


def test_invalid_port():
    # start of testing invalid port
    proc = Popen("python3 client.py test 1000", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")

    assert output == f"{Tcolors.WARNING}Port number must be between 1024 and 65535{Tcolors.ENDC}\n"

    proc = Popen("python3 client.py test 1000000", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")

    assert output == f"{Tcolors.WARNING}Port number must be between 1024 and 65535{Tcolors.ENDC}\n"

    proc = Popen("python3 client.py test test", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")

    assert output == f"{Tcolors.WARNING}Port must be an integer{Tcolors.ENDC}\n"
    # end of testing invalid port


def test_invalid_ip():
    # start of testing invalid IP address
    proc = Popen("python3 client.py test 2000 2154", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")
    assert output == f"{Tcolors.WARNING}Invalid DNS address{Tcolors.ENDC}\n"

    proc = Popen("python3 client.py test 2000 256.256.256.256", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")
    assert output == f"{Tcolors.WARNING}Invalid DNS address{Tcolors.ENDC}\n"

    proc = Popen("python3 client.py test 2000 255.255.str.255", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")

    assert output == f"{Tcolors.WARNING}Invalid DNS address{Tcolors.ENDC}\n"
    # end of testing invalid IP address


def test_invalid_connection():
    # start of testing an invalid connection to server
    proc = Popen("python3 client.py test 2040", stdout=PIPE, shell=True)
    output = proc.stdout.read().decode("utf-8")
    hostname = socket.gethostbyname(socket.gethostname())
    port = proc.args.split(" ")[3]

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.FAIL}Error: connection to server failed{Tcolors.ENDC}\n"""
    # end of testing an invalid connection to server


def test_valid_connection():
    # start of testing a valid connection to server
    server = Popen("python3 server.py 2000", stdout=PIPE, shell=True)
    client_test = Popen("python3 client.py test 2000", stdout=PIPE, shell=True)
    output = client_test.stdout.read().decode("utf-8")
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}"""
    # end of testing a valid connection to server


def test_start_option():
    # start of testing the START option
    server = Popen("python3 server.py 3000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 3000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"start\ny")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the START option


def test_quit_option():
    # start of testing the QUIT option
    server = Popen("python3 server.py 4000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 4000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"quit")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}Quitting...
{Tcolors.OKGREEN}Client quit with success\n""".encode("utf-8")
    # end of testing the QUIT option


def test_number_option():
    # start of testing the NUMBER option
    server = Popen("python3 server.py 5000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 5000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"start\ny\nnumber\n200")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}{Tcolors.BOLD}Number > {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}Number added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the NUMBER option


def test_guess_without_stopping():
    # start of testing the GUESS option without a number
    server = Popen("python3 server.py 6000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 6000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"start\ny\nguess")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.WARNING}You can't guess before stopping the game\n{Tcolors.ENDC}
{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the GUESS option without a number


def test_stop_option():
    # start of testing the STOP option
    server = Popen("python3 server.py 7000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 7000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"start\ny\nnumber\n200\nstop")[0]

    data = 200

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}{Tcolors.BOLD}Number > {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}Number added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nChosen number: {Tcolors.UNDERLINE}{data}{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the STOP option


def test_guess_without_starting():
    # start of testing the GUESS option without starting the game
    server = Popen("python3 server.py 8000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 8000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"guess")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.WARNING}You must start the game first\n{Tcolors.ENDC}
{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the GUESS option without starting the game


def test_number_without_starting():
    # start of testing the NUMBER option without starting the game
    server = Popen("python3 server.py 9000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 9000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"number")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.WARNING}You must start the game first\n{Tcolors.ENDC}
{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the NUMBER option without starting the game


def test_stop_without_starting():
    # start of testing the STOP option without starting the game
    server = Popen("python3 server.py 10000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 10000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"stop")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.WARNING}You must start the game first\n{Tcolors.ENDC}
{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the STOP option without starting the game


def test_stop_without_numbers():
    # start of testing the STOP option after stopping the game
    server = Popen("python3 server.py 11000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 11000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"start\ny\nstop")[0]

    client_test.terminate()
    server.terminate()

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.FAIL}Error: Client has not yet sent any number{Tcolors.ENDC}
{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
    # end of testing the STOP option after stopping the game


def test_stop_after_stopping():
    # start of testing the STOP option after stopping the game
    server = Popen("python3 server.py 12000", stdout=PIPE, shell=True, close_fds=True)
    client_test = Popen("python3 client.py test 12000", stdout=PIPE, stdin=PIPE, shell=True)
    port = client_test.args.split(" ")[3]
    hostname = socket.gethostbyname(socket.gethostname())

    output = client_test.communicate(input=b"start\ny\nnumber\n123\nstop\nstop")[0]

    client_test.terminate()
    server.terminate()

    data = 123

    assert output == f"""{Tcolors.WARNING}Connecting to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.WARNING}...{Tcolors.ENDC}
{Tcolors.OKGREEN}Connected to {Tcolors.UNDERLINE}{hostname}:{port}{Tcolors.ENDC}{Tcolors.OKGREEN} as client {Tcolors.UNDERLINE}{client_test.args.split(" ")[2]}\n{Tcolors.ENDC}
{Tcolors.OKCYAN}{Tcolors.BOLD}{Tcolors.UNDERLINE}Number characteristics guesser game!{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}Do you wish to use a cipher? {Tcolors.BOLD}(Y/N)\n> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nClient added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}
{Tcolors.ENDC}{Tcolors.BOLD}Number > {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}Number added with success{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.OKGREEN}\nChosen number: {Tcolors.UNDERLINE}{data}{Tcolors.ENDC}

{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}{Tcolors.ENDC}{Tcolors.WARNING}You can't stop the game again\n{Tcolors.ENDC}
{Tcolors.ENDC}\nOperation? (START, QUIT, NUMBER, STOP, GUESS)\n{Tcolors.BOLD}> {Tcolors.UNDERLINE}""".encode("utf-8")
