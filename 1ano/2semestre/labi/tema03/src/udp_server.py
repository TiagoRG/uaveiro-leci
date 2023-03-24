import socket


def main():
    udp_c = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_c.bind(("127.0.0.1", 1234))

    while True:
        b_data, addr = udp_c.recvfrom(4096)
        print(f"Received from {addr}: {b_data.decode('utf-8')}")

        if b_data.decode("utf-8") == "stop":
            print("Stopping server...")
            break

        print(f"Sending to {addr}: {b_data.upper()}")
        udp_c.sendto(b_data.upper(), addr)

    udp_c.close()


if __name__ == "__main__":
    main()
