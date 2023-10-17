# Part 3

## 1. Configuring the Router

After configuring both IP addresses(the PC's), and running the command `show ip route`, the following output is printed:

```
R1#show ip route   
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.20.20.0/24 is directly connected, FastEthernet0/1
C    192.1.1.0/24 is directly connected, FastEthernet0/0
```

With the result of the output above, it's clear that both PC's are connected to the Router. The IP's end with a `.0` due to the fact that it's representing the network, not the connected computer's IP.

---

## 2. Attempt to ping PC2

Immediately after running `ping 192.20.20.23`, the following output is printed:
```
PC1> ping 192.20.20.23

No gateway found

PC1>
```
With Wireshark capturing the packets between PC1 and the Router, none are presented. 

Both these phenomenons happen because there is no gateway configured for the other PC(PC2), so the router does not know where to send it.

---

## 3. Configure PC2, ping PC1

After configuring the Gateway on PC2 by running `ip 192.20.20.23/24 192.20.20.3` and attempting to ping PC1, the following output is provided:
```
PC2> ping 192.1.1.3                 

192.1.1.3 icmp_seq=1 timeout
192.1.1.3 icmp_seq=2 timeout
192.1.1.3 icmp_seq=3 timeout
192.1.1.3 icmp_seq=4 timeout
192.1.1.3 icmp_seq=5 timeout

PC2>
```
Running the command alongside Wireshark allows us to verify the following:

1. The router is receiving the ping request from PC2
2. The router tries to reach the PC1 IP (`192.1.1.3`), but it fails, returning to PC2 the timeout value. This is caused due to the fact that PC1 has no gateway(the router doesn't know where to send the packet).

---

## 4. Configure PC1, ping PC2

After running `ping 192.20.20.13`, we get the following output
```
PC1> ping 192.20.20.13

84 bytes from 192.20.20.13 icmp_seq=1 ttl=63 time=14.361 ms
84 bytes from 192.20.20.13 icmp_seq=2 ttl=63 time=20.072 ms
84 bytes from 192.20.20.13 icmp_seq=3 ttl=63 time=20.502 ms
84 bytes from 192.20.20.13 icmp_seq=4 ttl=63 time=20.625 ms
84 bytes from 192.20.20.13 icmp_seq=5 ttl=63 time=20.463 ms

PC1>
```
Since we already configured the PC1's gateway, the router now knows where it has to send the packets, therefore resulting in success.

With Wireshark reading the exchanging packets on a wire(i.e. the wire between PC1 and the Router), we're able to gather information on both PC's, like their IP addresses or MAC addresses. Below is a table with this information.

|                             |  ICMP Echo Request  |   ICMP Echo Reply   |
| :-------------------------: | :-----------------: | :-----------------: |
|   Source **MAC** Address    | `00:50:79:66:68:00` | `c2:01:09:83:00:00` |
| Destination **MAC** Address | `c2:01:09:83:00:00` | `00:50:79:66:68:00` |
|                             |                     |                     |
|                             |                     |                     |
|   Source **IP** Address     |     `192.1.1.3`     |    `192.20.20.13`   |
| Destination **IP** Address  |    `192.20.20.13`   |     `192.1.1.3`     |

---

## 5. Predict ICMP packets between PC2 and router

Based on the past information, we know that the IP address and MAC address of PC2 is, respectively, `192.20.20.13` and `c2:01:09:83:00:00`. Having this in mind, the ICMP Echo table would look like this:

|                             |  ICMP Echo Request  |   ICMP Echo Reply   |
| :-------------------------: | :-----------------: | :-----------------: |
|   Source **MAC** Address    | `c2:01:09:83:00:00` |         N/A         |
| Destination **MAC** Address |         N/A         |         N/A         |
|                             |                     |                     |
|                             |                     |                     |
|   Source **IP** Address     |     `192.1.1.13`    |    `192.20.20.13`   |
| Destination **IP** Address  |    `192.20.20.13`   |     `192.1.1.13`    |

---

## 6. Router ARP Tables

After running `show arp` on the Router terminal, we get the following output:
```
R1#show arp
Protocol  Address          Age (min)  Hardware Addr   Type   Interface
Internet  192.1.1.3              15   0050.7966.6800  ARPA   FastEthernet0/0
Internet  192.20.20.3             -   c201.0983.0001  ARPA   FastEthernet0/1
Internet  192.20.20.13           15   0050.7966.6801  ARPA   FastEthernet0/1
Internet  192.1.1.13              -   c201.0983.0000  ARPA   FastEthernet0/0
R1#
```

The entries with an Age value represent the connection from the PC to the Router(i.e. the first entry represents going from PC1 to the Router).

Those without an Age value represent the connection from the Router to the PC(i.e. the fourth entry represents going from the Router to PC1).

With these ARP entries, the router now knows where to send packets to allow communication between the two connected PC's.

---

## 7. Ping inexisting terminal

While running `ping 192.1.1.10`, the output below is shown:
```
PC2> ping 192.1.1.10               

192.1.1.10 icmp_seq=1 timeout
192.1.1.10 icmp_seq=2 timeout
192.1.1.10 icmp_seq=3 timeout
192.1.1.10 icmp_seq=4 timeout
192.1.1.10 icmp_seq=5 timeout

PC2>
```
This is similar to what happened in point 3. The major difference here is that on point 3, there was an actual terminal connected with that IP address, but the Router had yet to communicate with that IP address, so it had no idea where to send the packet(there was no entry of that IP on the Router's ARP table).

In this case, there is no terminal connected to the specified IP address, so it results in not being able to send packets to that IP address as well.

After thorough examination of the exchanged packets between the Router and PC2, we can notice the following:

* First, ARP packages are exchanged, it is asked who has the IP of PC2, and then it stores the MAC address.
* Upon storing said data, it attempts to communicate with `192.1.1.10`. Of course, since there is no entry for that IP address in the ARP table, it returns nothing, resulting in a timeout on PC2.

---

## 8. Pinging a non-local IP

Upon running `ping 194.100.1.1`, we get the following result:
```
PC2> ping 194.100.1.1

┌*192.20.20.3 icmp_seq=1 ttl=255 time=7.467 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                      ┘
┌*192.20.20.3 icmp_seq=2 ttl=255 time=10.578 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                       ┘
┌*192.20.20.3 icmp_seq=3 ttl=255 time=10.777 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                       ┘
┌*192.20.20.3 icmp_seq=4 ttl=255 time=10.425 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                       ┘
┌*192.20.20.3 icmp_seq=5 ttl=255 time=9.976 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                      ┘

PC2>
```
Before drawing any conclusions, it is important to point out that this is **NOT** a local address. With this said, it means it doesn't have to be directly connected to the router, so ARP entries don't apply for this IP.

As established beforehand, the Router has no ARP entry for this address, but yet we still get a time value. This time value is the time that the server takes to attempt to ping the specified external IP, until it realises it can't, returning "Destination host unreachable", since it is not connected to the internet.

---

## 10. Adding another router

After adding another router, properly making the needed changes and running `show ip route` on the existing router, we get the following output:
```
R1#show ip route
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.20.20.0/24 is directly connected, FastEthernet0/1
C    192.1.1.0/24 is directly connected, FastEthernet0/0
R1#
```
It's clear the the IP route table is identical to the previous R1 route table.

---

## 11. Ping another inexistent address(same network)

Upon pinging `192.20.20.150`, we get the following result:
```
PC1> ping 192.20.20.150

192.20.20.150 icmp_seq=1 timeout
192.20.20.150 icmp_seq=2 timeout
192.20.20.150 icmp_seq=3 timeout
192.20.20.150 icmp_seq=4 timeout
192.20.20.150 icmp_seq=5 timeout

PC1> 
```
While pinging the IP and running Wireshark on the ethernet cable, we can detect a similar case that happened in point 7.

Since the terminal doesn't exist, there is no reply to the PC in termos of ICMP packets, resulting in yet another timeout. It is also worth noting that before sending the ICMP packets, the server refreshes its ARP table by storing the PC1's current location.

During the ping execution, there was a "flood" in the network `192.20.20.0` to attempt to find the desired terminal, to no avail, since it does not exist.

---

## 12. Ping existing address(different network)

After running the command `ping 192.30.30.100`, we get the result below:
```
PC1> ping 192.30.30.100

┌*192.1.1.13 icmp_seq=1 ttl=255 time=9.946 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                     ┘
┌*192.1.1.13 icmp_seq=2 ttl=255 time=10.197 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                      ┘
┌*192.1.1.13 icmp_seq=3 ttl=255 time=9.046 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                     ┘
┌*192.1.1.13 icmp_seq=4 ttl=255 time=10.245 ms (ICMP type:3, code:1,┐ 
└Destination host unreachable)                                      ┘
┌*192.1.1.13 icmp_seq=5 ttl=255 time=9.706 ms (ICMP type:3, code:1,┐
└Destination host unreachable)                                     ┘

PC1>
```
This time, there is a time value(since the router is attempting to ping another network, as established in point 8). 

> But we do know this network exists, so why is it returning: "Destination host unreachable"?

This is because the Router(R1) does not have a routing protocol to that network configured yet, so R1 doesn't know how to communicate between the two networks.

In the local network `192.20.20.0`, there was an attempt to ping an external network, but since it doesn't know how to reach it, it returns to PC1 the "Destination host unreachable" message.

---

## 13. Configuring the routing tables

After configuring the routing tables on both Routers and running `show ip route`, we get the following output.
### For R1:
```
R1#show ip route     
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

S    192.30.30.0/24 [1/0] via 192.20.20.100
C    192.20.20.0/24 is directly connected, FastEthernet0/1
C    192.1.1.0/24 is directly connected, FastEthernet0/0
R1#
```

### For R2:
```
R2#show ip route
Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area 
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of last resort is not set

C    192.30.30.0/24 is directly connected, FastEthernet0/1
C    192.20.20.0/24 is directly connected, FastEthernet0/0
S    192.1.1.0/24 [1/0] via 192.20.20.3
R2#
```

Upon testing the connectivity between PC1 and the bridged network:
```
PC1> ping 192.30.30.150

84 bytes from 192.30.30.150 icmp_seq=1 ttl=62 time=21.239 ms
84 bytes from 192.30.30.150 icmp_seq=2 ttl=62 time=29.879 ms
84 bytes from 192.30.30.150 icmp_seq=3 ttl=62 time=30.574 ms
84 bytes from 192.30.30.150 icmp_seq=4 ttl=62 time=30.530 ms
84 bytes from 192.30.30.150 icmp_seq=5 ttl=62 time=30.605 ms

PC1>
```

---

## 14. Ping with TTL
After pinging with different TTL values, we get the following outputs:

### TTL = 1
```
PC1> ping 192.30.30.150 -T 1

┌*192.1.1.13 icmp_seq=1 ttl=255 time=9.828 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                            ┘
┌*192.1.1.13 icmp_seq=2 ttl=255 time=9.983 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                            ┘
┌*192.1.1.13 icmp_seq=3 ttl=255 time=8.423 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                            ┘
┌*192.1.1.13 icmp_seq=4 ttl=255 time=8.439 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                            ┘
┌*192.1.1.13 icmp_seq=5 ttl=255 time=10.012 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                             ┘

PC1>
```

### TTL = 2
```
PC1> ping 192.30.30.150 -T 2

┌*192.20.20.100 icmp_seq=1 ttl=254 time=18.226 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                                ┘
┌*192.20.20.100 icmp_seq=2 ttl=254 time=19.475 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                                ┘
┌*192.20.20.100 icmp_seq=3 ttl=254 time=20.568 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                                ┘
┌*192.20.20.100 icmp_seq=4 ttl=254 time=19.703 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                                ┘
┌*192.20.20.100 icmp_seq=5 ttl=254 time=20.757 ms (ICMP type:11, code:0,┐
└TTL expired in transit)                                                ┘

PC1>
```

### TTL = 3
```
PC1> ping 192.30.30.150 -T 3

84 bytes from 192.30.30.150 icmp_seq=1 ttl=62 time=33.213 ms
84 bytes from 192.30.30.150 icmp_seq=2 ttl=62 time=40.717 ms
84 bytes from 192.30.30.150 icmp_seq=3 ttl=62 time=40.330 ms
84 bytes from 192.30.30.150 icmp_seq=4 ttl=62 time=40.920 ms
84 bytes from 192.30.30.150 icmp_seq=5 ttl=62 time=39.612 ms

PC1>
```

Upon analysis of the exchanged packets using Wireshark, we can see that:
* With TTL = 1, the packet does 1 "hop" before it self-destructs(returning the expired in transit message). It was destroyed on the first router(R1).
* With TTL = 2, the packet does 2 "hops" before it self-destructs(returning the same message above). This time, it was destroyed on the second router(R2).
* With TTL = 3, the packet does 3 "hops" before it self-destructs. Since 3 hops is just about enough to reach PC2, it results in a success.

---

## 15. Running tracert

The `tracert/trace` command sends a UDP packet(as we know, UDP packets work on ports). It's of course worth noting the ports, being PC1's port 36881 and PC2's port 36882.

The output of the command `trace 192.30.30.150` is below
```
PC1> trace 192.30.30.150
trace to 192.30.30.150, 8 hops max, press Ctrl+C to stop
 1   192.1.1.13   20.394 ms  9.599 ms  10.019 ms
 2   192.20.20.100   29.482 ms  29.435 ms  30.212 ms
┌3   *192.30.30.150   50.641 ms (ICMP type:3, code:3,┐
└Destination port unreachable)                       ┘

PC1>
```

The routers are identified by their gateways, so:
* R1 is `192.1.1.13`
* R2 is `192.20.20.100`
* PC2 is `192.30.30.150`

We can also see 3 time values. This is because `trace` sends 3 packets to each "layer"(or each hop).

## 16. Differences between different IP addresses
### Output for `192.30.30.150`:
```
PC1> trace 192.30.30.150
trace to 192.30.30.150, 8 hops max, press Ctrl+C to stop
 1   192.1.1.13   13.328 ms  9.243 ms  9.319 ms
 2   192.20.20.100   29.735 ms  29.569 ms  29.566 ms
┌3   *192.30.30.150   40.140 ms (ICMP type:3, code:3,┐
└Destination port unreachable)                       ┘
 
PC1>
```
### Output for `192.30.30.100`:
```
PC1> trace 192.30.30.100
trace to 192.30.30.100, 8 hops max, press Ctrl+C to stop
 1   192.1.1.13   1.833 ms  9.795 ms  10.015 ms
┌2   *192.20.20.100   29.431 ms (ICMP type:3, code:3,┐
└Destination port unreachable)                       ┘

PC1>
```
First of all, it is worth noting the path the packets have to take in order to reach their destinations. The longest path available starting from PC1(without including output gateways) is listed below.
* `192.1.1.3 -> 192.1.1.13 -> 192.20.20.100 -> 192.30.30.150`

Now including output gateways:
* `192.1.1.3 -> 192.1.1.13 -> 192.20.20.3 -> 192.20.20.100 -> 192.30.30.100 -> 192.30.30.150`

With this in mind, we can tell the difference between the two IP's.
1. On the first IP, it ends up reaching PC2, making the longest path, and requring to go through 3 devices(R1, R2 and PC2).
2. On the second IP, it only reaches the output gateway of R2, so it goes through only 2 devices (R1 and R2).

Having this out of the way, we can justify why one command has 3 hops, while the other has 2 hops. This is easily jutified by the number of devices(or hops) the packets have to go through to reach their destination.


## FILE CREATED BY GROUP 3, BEING THE MEMBERS: 
* Rúben Gomes, 113435 
* Tiago Garcia, 114184