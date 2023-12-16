import socket
import signal
import sys

def signal_handler(sig, frame):
    print('\nDone!')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
print('Press Ctrl+C to exit...')

##

ip_addr = "0.0.0.0"
udp_port = 5005

sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
sock.bind((ip_addr, udp_port))

while True:
    message, sender_addr_port = sock.recvfrom(2048)
    print('Message from {}:{} -> {}'.format(sender_addr_port[0],sender_addr_port[1],message.decode()))
