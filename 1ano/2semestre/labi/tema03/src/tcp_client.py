import socket


def main(args=None):
    tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp_s.connect(('localhost', 1234))

    while True:
        str_data = input("$ ")
        if not str_data or str_data == "stop":
            break
        tcp_s.send(str_data.encode("utf-8"))

        b_data = tcp_s.recv(4096)
        print("-> " + b_data.decode("utf-8"))


if __name__ == '__main__':
    main()
