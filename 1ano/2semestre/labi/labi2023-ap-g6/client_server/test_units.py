import random
import socket
import subprocess
import sys
from subprocess import Popen
from subprocess import PIPE
import pytest
import client
import server


def test_client_verify_port():
    assert client.verify_port("0") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert client.verify_port("1023") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert client.verify_port("1024") == {'status': True, "port": 1024}
    assert client.verify_port("65535") == {'status': True, "port": 65535}
    assert client.verify_port("65536") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert client.verify_port("100000") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert client.verify_port("example") == {'status': False, 'error': 'Port must be an integer'}
    assert client.verify_port("test") == {'status': False, 'error': 'Port must be an integer'}


def test_verify_hostname():
    assert client.verify_hostname("localhost") == {'status': True}
    assert client.verify_hostname("123.123.123.123") == {'status': True}
    assert client.verify_hostname("example.com") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("test") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("123.123.123") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("413.123.123.123") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("123.413.123.123") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("123.123.413.123") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("123.123.123.413") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("-1.-1.-1.-1") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("256.256.256.256") == {'status': False, 'error': 'Invalid DNS address'}
    assert client.verify_hostname("0.0.0.0") == {'status': True}
    assert client.verify_hostname("255.255.255.255") == {'status': True}


def test_server_verify_port():
    assert server.verify_port("0") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert server.verify_port("1023") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert server.verify_port("1024") == {'status': True, "port": 1024}
    assert server.verify_port("65535") == {'status': True, "port": 65535}
    assert server.verify_port("65536") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert server.verify_port("100000") == {'status': False, 'error': 'Port number must be between 1024 and 65535'}
    assert server.verify_port("example") == {'status': False, 'error': 'Port must be an integer'}
    assert server.verify_port("test") == {'status': False, 'error': 'Port must be an integer'}



