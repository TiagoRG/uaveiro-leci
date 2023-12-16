import socket
import selectors
import signal
import sys

def signal_handler(sig, frame):
    print('\nDone!')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
print('Press Ctrl+C to exit...')

##

def handle_client_connection(server_socket):
    client_socket, address = server_socket.accept()
    print('Accepted connection from {}:{}'.format(address[0], address[1]))
    client_socket.setblocking(False)
    sel.register(client_socket, selectors.EVENT_READ, handle_data)

def handle_data(client_socket): 
    address=client_socket.getpeername()
    try:
        request = client_socket.recv(1024)
        if not request:
            sel.unregister(client_socket)
            client_socket.close()
        else:
            msg=request.decode()
            print('Received {}'.format(msg))
            msg=("ECHO: "+msg).encode()
            client_socket.send(msg)
    except (socket.timeout,socket.error):
        print('Client {} error. Done!'.format(address))

ip_addr = "0.0.0.0"
tcp_port = 5005

sel = selectors.DefaultSelector()
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((ip_addr, tcp_port))
server.listen(5)  # max backlog of connections

server.setblocking(False)  #Set to non-blocking
sel.register(server, selectors.EVENT_READ, handle_client_connection)

print('Listening on {}:{}'.format(ip_addr, tcp_port))

while True:
    events = sel.select()
    for key, mask in events:
        print(key)
        callback = key.data
        selsocket=key.fileobj
        callback(selsocket)
