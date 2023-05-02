# encoding=utf-8

import socket
import select

def main ():
    tcp_s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
    tcp_s.bind (("0.0.0.0", 8080))
    tcp_s.listen (10)
    connections = []

    connections.append (tcp_s)
    print ("Chat server started")

    while 1:
        # Get the list sockets which are ready to be read through select
        read_sockets = select.select (connections, [], [])[0]

        for sock in read_sockets:
            #New connection
            if sock == tcp_s:
                # Handle the case in which there is a new connection received through server_socket
                client_s, addr = tcp_s.accept ()
                connections.append (client_s)
                print ("Client connected: %s" % str (addr))
            else:
                #Some incoming message from a client, process it
                try:
                    # Incoming message
                    data = sock.recv (4096)
                    if len (data) != 0:
                        print ("From client: %s" % str (sock.getpeername()))
                        print ("Got Data: " + data.decode ('utf-8'))

                    else:
                        print ("Client disconnected: %s" % str (sock.getpeername()))
                        sock.close()
                        connections.remove (sock)
                        break

                    #Do not send the message to master socket
                    #Create the message identifying the client
                    message = ('<' + " Fom client: " + str(sock.getpeername()) + '> \n').encode('utf-8') +  data.upper()
                    for client in connections:
                        if client != tcp_s: # Eventually do not send the message to the source client !!!
                            client.send (message)

                except:
                    print ("Client socket error: %s" % str (addr))
                    sock.close()
                    connections.remove (sock)
                    continue

    tcp_s.close()

main ()	
