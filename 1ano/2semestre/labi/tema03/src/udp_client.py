import socket


def main():
    udp_s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_s.bind(("127.0.0.1", 0))
    server_addr = ("127.0.0.1", 1234)

    while True:
        msg = input(f"$ ")
        udp_s.sendto(msg.encode("utf-8"), server_addr)

        if msg == "stop":
            break

        b_data, addr = udp_s.recvfrom(4096)
        print(f"-> {b_data.decode('utf-8')}")

    udp_s.close()


if __name__ == '__main__':
    main()
