import socket


def main():
    udp_c = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_c.bind(("127.0.0.1", 1234))

    addr_list = []

    while True:
        b_data, addr = udp_c.recvfrom(4096)
        print(f"Received from {addr}: {b_data.decode('utf-8')}")

        if addr not in addr_list:
            addr_list.append(addr)

        if b_data.decode("utf-8") == "stop":
            print("Stopping server...")
            break

        for laddr in addr_list:
            if laddr == addr:
                continue
            print(f"Sending to {laddr}: {b_data}")
            udp_c.sendto(b_data, laddr)

    udp_c.close()


if __name__ == "__main__":
    main()
