import csv
import time
import psutil
from lxml import etree


def main(args=None):
    xml = etree.parse('../datafiles/conf.xml')
    root = xml.getroot()

    delimiter = root.findall("./output/csv")[0].attrib["separator"]
    monitor_cpu = root.findall("./monitor/cpu")[0].attrib["active"]
    monitor_ram = root.findall("./monitor/ram")[0].attrib["active"]
    monitor_network = root.findall("./monitor/network")[0].attrib["active"]

    with open("../datafiles/monitor.csv", "w") as f:
        writer = csv.DictWriter(f, delimiter=delimiter, fieldnames=["time", "cpu", "ram", "network"])

        writer.writeheader()

        while True:
            cpu = psutil.cpu_percent() if monitor_cpu == "true" else ""
            ram = psutil.virtual_memory().percent if monitor_ram == "true" else ""
            network = psutil.net_io_counters().bytes_sent if monitor_network == "true" else ""
            writer.writerow({"time": time.time(), "cpu": cpu, "ram": ram, "network": network})
            time.sleep(1)


if __name__ == '__main__':
    main()
