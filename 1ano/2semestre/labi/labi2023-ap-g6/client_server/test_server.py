import socket
from subprocess import Popen
from subprocess import PIPE
import pytest


def test_lack_args():
    # no args
    proc = Popen("python3 server.py", stdout=PIPE, shell=True, close_fds=True)
    output = proc.communicate()[0]

    assert output == "Usage: python3 server.py <port>\n".encode("utf-8")


def test_too_many_args():
    # too many args
    proc = Popen("python3 server.py 1234 1234", stdout=PIPE, shell=True, close_fds=True)
    output = proc.communicate()[0]

    assert output == "Usage: python3 server.py <port>\n".encode("utf-8")


def test_str_port():
    proc = Popen("python3 server.py abc", stdout=PIPE, shell=True, close_fds=True)
    output = proc.communicate()[0]

    proc.terminate()
    assert output == "Port must be an integer\n".encode("utf-8")


def test_port_in_use():
    Popen("python3 server.py 50000", stdout=PIPE, shell=True, close_fds=True)
    proc2 = Popen("python3 server.py 50000", stdout=PIPE, shell=True, close_fds=True)
    output = proc2.communicate()[0]

    proc2.terminate()
    hostname = socket.gethostbyname(socket.gethostname())
    port = 50000
    assert output == f"Failed to create server socket, maybe the port is already in use?\n\n".encode("utf-8")