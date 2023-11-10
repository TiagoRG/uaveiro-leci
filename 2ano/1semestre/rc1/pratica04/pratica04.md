# Guião 4

# NAT/PAT mechanisms

## Ex2

Before establishing any connection, this is the output for `show ip nat statistics`:
```console
R1#show ip nat statistics 
Total active translations: 0 (0 static, 0 dynamic; 0 extended)
Peak translations: 0
Outside interfaces:
  FastEthernet1/1
Inside interfaces: 
  FastEthernet1/0
Hits: 0  Misses: 0
CEF Translated packets: 0, CEF Punted packets: 0
Expired translations: 0
Dynamic mappings:
-- Inside Source
[Id: 1] access-list 2 pool MYNATPOOL refcount 0
 pool MYNATPOOL: netmask 255.255.255.0
        start 192.1.1.21 end 192.1.1.21
        type generic, total addresses 1, allocated 0 (0%), misses 0

Total doors: 0
Appl doors: 0
Normal doors: 0
Queued Packets: 0
R1#
```

### PC1 → 192.1.1.45 (PCB)

There's an exchange in packets between these IP addresses. After running `show ip nat translations` we get the following output:
```console
R1#show ip nat translations 
Pro Inside global      Inside local       Outside local      Outside global
--- 192.1.1.21         192.168.1.1        ---                ---
R1#
```

And the output for `show ip nat statistics`:
```console
R1#show ip nat statistics   
Total active translations: 1 (0 static, 1 dynamic; 0 extended)
Peak translations: 6, occurred 00:07:42 ago
Outside interfaces:
  FastEthernet1/1
Inside interfaces: 
  FastEthernet1/0
Hits: 10  Misses: 0
CEF Translated packets: 10, CEF Punted packets: 0
Expired translations: 5
Dynamic mappings:
-- Inside Source
[Id: 1] access-list 2 pool MYNATPOOL refcount 1
 pool MYNATPOOL: netmask 255.255.255.0
        start 192.1.1.21 end 192.1.1.21
        type generic, total addresses 1, allocated 1 (100%), misses 0

Total doors: 0
Appl doors: 0
Normal doors: 0
Queued Packets: 0
R1#
```

### PC2 → 192.1.1.45 (PCB)

There's an exchange of packets between the devices even though the destination was unreachable:
```console
PC2> ping 192.1.1.45   

*192.168.1.254 icmp_seq=1 ttl=255 time=6.796 ms (ICMP type:3, code:1, Destination host unreachable)
*192.168.1.254 icmp_seq=2 ttl=255 time=12.338 ms (ICMP type:3, code:1, Destination host unreachable)
*192.168.1.254 icmp_seq=3 ttl=255 time=11.187 ms (ICMP type:3, code:1, Destination host unreachable)
*192.168.1.254 icmp_seq=4 ttl=255 time=12.594 ms (ICMP type:3, code:1, Destination host unreachable)
*192.168.1.254 icmp_seq=5 ttl=255 time=11.072 ms (ICMP type:3, code:1, Destination host unreachable)

PC2>
```

The output for `show ip nat translations` is still the same and the output for `show ip nat statistics` is the following:
```console
R1#show ip nat statistics   
Total active translations: 1 (0 static, 1 dynamic; 0 extended)
Peak translations: 6, occurred 00:23:37 ago
Outside interfaces:
  FastEthernet1/1
Inside interfaces: 
  FastEthernet1/0
Hits: 10  Misses: 0
CEF Translated packets: 10, CEF Punted packets: 15
Expired translations: 5
Dynamic mappings:
-- Inside Source
[Id: 1] access-list 2 pool MYNATPOOL refcount 1
 pool MYNATPOOL: netmask 255.255.255.0
        start 192.1.1.21 end 192.1.1.21
        type generic, total addresses 1, allocated 1 (100%), misses 15

Total doors: 0
Appl doors: 0
Normal doors: 0
Queued Packets: 0
R1#
```
The difference between this and the previous output is the existence of CEF Punted packets.


From these results and from the wireshark capture we can conclude the packets having their source IP addresses translated are the ones being sent from PC1.

This is because while configuring the router's nat pool, we only set the pool with a single public address. Since PC1 was the first to execute the ping command, it's the one who takes and keeps the only public address of that private network, therefore PC2 won't be able to communicate to the public network.

---

## Ex3

Now that we've cleared the router's nat pool, PC2 is able to ping outside the private network, now taking the only public address to itself.

```PC2> ping 192.1.1.45                

84 bytes from 192.1.1.45 icmp_seq=1 ttl=63 time=29.740 ms
84 bytes from 192.1.1.45 icmp_seq=2 ttl=63 time=19.308 ms
84 bytes from 192.1.1.45 icmp_seq=3 ttl=63 time=19.172 ms
84 bytes from 192.1.1.45 icmp_seq=4 ttl=63 time=21.246 ms
84 bytes from 192.1.1.45 icmp_seq=5 ttl=63 time=20.365 ms

PC2>
```

---

## Ex4

When setting the NAT timeout to 60 seconds, upon 60 seconds of inactivity from PC1, the timer starts and when reaching 0, PC2 can now take the public address.

When executing `ping 192.1.1.40` from PC2 right after pinging from PC1, we get the following output:

```console
(...)
*192.168.1.254 icmp_seq=84 ttl=255 time=7.848 ms (ICMP type:3, code:1, Destination host unreachable)
84 bytes from 192.1.1.40 icmp_seq=85 ttl=63 time=18.135 ms
84 bytes from 192.1.1.40 icmp_seq=86 ttl=63 time=18.628 ms
84 bytes from 192.1.1.40 icmp_seq=87 ttl=63 time=17.988 ms
```

---

## Ex5

The advantages are that many terminals in a private network are able to use the same public address, distinguishing each connection by their respective port, preserving security and privacy.

```
R1#show ip nat translations
Pro Inside global      Inside local       Outside local      Outside global
icmp 192.1.1.21:41850  192.168.1.1:41850  192.1.1.45:41850   192.1.1.45:41850
icmp 192.1.1.21:42106  192.168.1.1:42106  192.1.1.45:42106   192.1.1.45:42106
icmp 192.1.1.21:1024   192.168.1.1:42362  192.1.1.45:42362   192.1.1.45:1024
icmp 192.1.1.21:1025   192.168.1.1:42618  192.1.1.45:42618   192.1.1.45:1025
icmp 192.1.1.21:1026   192.168.1.1:42874  192.1.1.45:42874   192.1.1.45:1026
icmp 192.1.1.21:42362  192.168.1.2:42362  192.1.1.45:42362   192.1.1.45:42362
icmp 192.1.1.21:42618  192.168.1.2:42618  192.1.1.45:42618   192.1.1.45:42618
icmp 192.1.1.21:42874  192.168.1.2:42874  192.1.1.45:42874   192.1.1.45:42874
icmp 192.1.1.21:43130  192.168.1.2:43130  192.1.1.45:43130   192.1.1.45:43130
icmp 192.1.1.21:43386  192.168.1.2:43386  192.1.1.45:43386   192.1.1.45:43386
R1#
```

---

## Ex6

If we take a look at the command `ping 192.1.1.40 -2 -p 80`, the argument `-2` represents a UDP port, `-3` represents a TCP port and `-p ##` sets the port to `##`.

For UDP we have the following ping output:
```
84 bytes from 192.1.1.40 udp_seq=1 ttl=63 time=20.132 ms
```

For TCP we have:
```
Connect   80@192.1.1.40 seq=1 ttl=63 time=25.151 ms
SendData  80@192.1.1.40 seq=1 ttl=63 time=15.486 ms
Close     80@192.1.1.40 seq=1 ttl=63 time=16.103 ms
```

After pinging `192.1.1.40` using the specified ports and running `show ip nat translations` we get the following output:
```
R1#show ip nat translations
Pro Inside global      Inside local       Outside local      Outside global
tcp 192.1.1.21:20618   192.168.1.1:20618  192.1.1.40:80      192.1.1.40:80
udp 192.1.1.21:28795   192.168.1.1:28795  192.1.1.40:80      192.1.1.40:80
udp 192.1.1.21:30114   192.168.1.1:30114  192.1.1.40:22      192.1.1.40:22
tcp 192.1.1.21:50598   192.168.1.1:50598  192.1.1.40:22      192.1.1.40:22
udp 192.1.1.21:42352   192.168.1.2:42352  192.1.1.40:80      192.1.1.40:80
udp 192.1.1.21:64301   192.168.1.2:64301  192.1.1.40:22      192.1.1.40:22
R1#
```

From this we can conclude that all UDP connections are registered even if the port had already been used, but when connecting using TCP through an already used port, the previous connection is overwritten.

---

## Ex7

PCA is unable to ping any terminal in the private network.

---

## Ex8

Once setting up the static public address for PC1, PCA is now able to ping it.

The request packets use the PCA address and the reply packets use the PC1 private address.

NAT/PAT is often required in scenarios where a device inside a private network needs to be accessible from the public internet. For example, if a company hosts its own website on a server within its private network, it would use static NAT/PAT to allow internet users to access that website. It could also be useful for home networks, since it preserves a terminal's private address.

---

# DHCP

## Ex10

### ip dhcp
We initially have a DHCP Discovery packet, used to check if the IP address is available by requesting an ARP packet. After that we have another DHCP Discovery packet, this time to validate if the address is available. Then we have a DHCP Offer packet to tell the terminal that it can use that address. Afterwards, we have a DHCP Request packet from the terminal to the router telling it that it wants to use that address. Finally we have a DHCP ACK (acknowledge) packet that goes from the router to the terminal confirming that it will be using that address.

### ip dhcp -r
This time we only have one DCHP Discovery since it comes from a terminal that the DCHP service knows that it has an IP address linked to it. The other steps and packets are the same as the previous command. This command is used to renew its lease.

### ip dchp -x
The only packet exchanged is the DCHP Release packet that tells the router to release the IP address that was being used by it.

### ip dchp
The procedure is the same as the first execution of this command but now the IP address is increased by 1 (from 192.168.1.101 to 192.168.1.102).

---

# IPv6 Basic Mechanisms

## Ex1

There are two types of packets shown, ICMPv6(IPv6) and MDNS.

First, there is a solicitation from the VM to the Switch for a specific IPv6 address. Then, the Switch "flushes" that IPv6 address, shown through MDNS packets.

The Switch attempts to communicate with a Router (through Router Solicitation), but since there is no Router connected, nothing happens.

---

## Ex2

The captured packets are similar to the ones found in the previous exercise, but this time, since there is a router to communicate, we get Router Advertisements and CDP packets, that show where the Router is connected and that there is connection between the VM and the Router.

After verifying the IPv6 information on the Router by running `show ipv6 interface brief` and `show ipv6 route`, we can verify that the IPv6 address does correspond with the one captured in the packets.

---

## Ex3

With the command `ipv6 address 2001:A:1:1::100/64`, we are giving the VM the IPv6 address `2001:A:1:1::100/64`. This can be seen by checking the Router's information, as shown below.

```console
R1#show ipv6 interface brief
FastEthernet0/0            [up/up]
    FE80::C801:8BFF:FE87:0
    2001:A:1:1::100
FastEthernet1/0            [administratively down/down]
    unassigned
FastEthernet1/1            [administratively down/down]
    unassigned
FastEthernet2/0            [administratively down/down]
    unassigned
FastEthernet2/1            [administratively down/down]
    unassigned
```

On the VM:

```console
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 0c:e8:7d:bb:00:00 brd ff:ff:ff:ff:ff:ff
    inet6 2001:a:1:1:1dbc:639a:3c2b:69a4/64 scope global temporary dynamic
        valid_lft 604646sec preferred_lft 85768sec
    inet6 2001:a:1:1:ee8:7dff:febb:0/64 scope global dynamic mngtmpaddr noprefixroute
        valid_lft 2591846sec preferred_lft 604646sec
    inet6 fe80::ee8:7dff:febb:0/64 scope link noprefixroute
        valid_lft forever preferred_lft forever
```

The IPv6 address was obtained by the following steps:

1. The Router sends a message to the VM (remember that the IPv6 address was requested in the Router);
2. A solicitation from the Router to the VM for that specific IPv6 address;
3. Another message from the router indicating that the address is available and can be used;
4. An advertisement from the VM to the router to confirm that the IPv6 address will be used by the VM.

## Ex4

The process of completion of the last 64 bits is explained in the image below:

![An image explaining the EUI-64 process](https://cdn.discordapp.com/attachments/1031545540757966878/1170815832545304777/ipv6-eui-64.png?ex=655a6a37&is=6547f537&hm=bb6ef828c35959d543c760c464c1587364e3591f998111e821db34766e178840&)


One of the disadvantages of using EUI-64 is that if an attacker gains access inside a network, it can easily triangulate someone's IPv6 address, and then target that specific terminal. This can be avoided by simply randomizing the Interface ID, making our IPv6 address harder to track/find.

The process of obtaining a IPv6 address does not change if done by the same MAC address, since the process is the exact same, hence why it's not very secure to use.

---

## File created by:
* Rúben Gomes, 113435
* Tiago Garcia, 114184