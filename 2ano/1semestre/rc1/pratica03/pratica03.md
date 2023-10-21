# Guide 3

## Ex 1.5

|Ping from:|Ping to:|Connectivity|Packets (PC1-Switch1 link)|Packets (PC3-Switch1 link)|
|:-------:|:------------:|:---:|:----:|:---------:|
| PC2     | Switch1      | No  | ARP  | N/A       |
| PC2     | PC3          | No  | ARP  | N/A       |
| PC2     | 192.168.1.34 | No  | ARP  | N/A       |
| PC3     | Switch1      | Yes | N/A  | ARP, ICMP |
| PC3     | PC2          | No  | N/A  | ARP       |
| PC3     | 192.168.1.34 | No  | N/A  | ARP       |
| Switch1 | PC3          | Yes | N/A  | ICMP      |
| Switch1 | 192.168.1.34 | No  | N/A  | ARP       |

PCs from different vlans are unable to communicate since the switch is unable to make the connection between vlans. Neither PC1 nor PC2 can communicate with Switch1.

- **PC2 → Switch1**
	- There's no connectivity because PC2's vlan has no configured IP;
- **PC2 → PC3**
	- There's no connectivity because they are in different vlans;
- **PC2 → 192.168.1.34**
	- There's no connectivity because the IP doesn't exist;
- **PC3 → Switch1**
	- There's connectivity because they are in the same vlan;
- **PC3 → PC2**
	- There's no connectivity because they are in different vlans;
- **PC3 → 192.168.1.34**
	- There's no connectivity because the IP doesn't exist;
- **Switch1 → PC3**
	- There's connectivity because they are in the same vlan;
- **Switch1 → 192.168.1.34**
	- There's no connectivity because the IP doesn't exist;

ARP packets occur in every new communication in the same link. ICMP packets only occur when there is connectivity through the link.

---

## Ex 2.2

|Ping from:|Ping to: |Connectivity|Filtered Packets|
|:--------:|:-------:|:----------:|:--------------:|
| PC1      | Switch1 | Yes        | N/A            |
| PC1      | Switch2 | Yes        | ARP, ICMP      |
| PC1      | PC2     | No         | ARP            |
| PC1      | PC3     | No         | ARP            |
| PC2      | Switch1 | No         | ARP            |
| PC2      | Switch2 | No         | ARP            |
| PC2      | PC2     | Yes        | N/A            |
| PC2      | PC3     | Yes        | ARP, ICMP      |

- PC1 → Switch1
	- There's connectivity because they are in the same vlan;
- PC1 → Switch2
	- There's connectivity because they are in the same vlan;
- PC1 → PC2
	- There's no connectivity because they are in different vlans;
- PC1 → PC3
	- There's no connectivity because they are in different vlans;
- PC2 → Switch1
	- There's no connectivity because they are in different vlans;
- PC2 → Switch2
	- There's no connectivity because they are in different vlans;
- PC2 → PC2
	- There's connectivity because it's connecting with itself;
- PC2 → PC3
	- There's connectivity because they are in the same vlan;

The appearances of packets in this case is similar to the ones in Ex 1.5.

---

## Ex 3.5

|Ping from:|Ping to:     |Connectivity|Filtered Packets|
|:--------:|:-----------:|:----------:|:---------:|
| PC4      | Switch4     | No         | ARP       |
| PC4      | Router      | Yes        | ARP, ICMP |
| PC4      | PC5         | Yes        | ARP, ICMP |
| PC4      | 192.1.1.100 | No         | ICMP      |
| PC5      | Switch4     | No         | ARP, ICMP |
| PC5      | Router      | Yes        | IMCP      |
| PC5      | PC4         | Yes        | ICMP      |
| PC5      | 192.1.1.100 | No         | ICMP      |

- PC4 → Switch4
	- There's no connectivity because they are in different vlans and there are no valid routes between them;
- PC4 → Router
	- There's connectivity because there's a valid route between them;
- PC4 → PC5
	- There's connectivity because, even though they are in different vlans, there's a valid route through the router
- PC4 → 192.1.1.100
	- There's no connectivity because the destination doesn't exist;
- PC5 → Switch4
	- There's no connectivity because they are in different vlans and there are no valid paths between them;
- PC5 → Router
	- There's connectivity because there's a valid route between them;
- PC5 → PC4
	- There's connectivity because, even though they are in different vlans, there's a valid route through the router
- PC5 → 192.1.1.100
	- There's no connectivity because the destination doesn't exist;