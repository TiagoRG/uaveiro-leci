import socket
import signal
import sys
import datetime
import struct

def signal_handler(sig, frame):
    print('\nDone!')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
print('Press Ctrl+C to exit...')

##

ip_addr = "127.0.0.1"
tcp_port = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.connect((ip_addr, tcp_port))

order=0
while True:
    try: 
        message=input("Message to send [max 20 chars]? ")
        version=1
        order+=1
        size=len(message)
        if size<20:
            message+='-'*(20-size)
        pkt=struct.pack('!BLL20s',version,order,size,message[:20].encode())
        sock.send(pkt)
    except (socket.timeout, socket.error):
        print('Server error. Done!')
        sys.exit(0)

