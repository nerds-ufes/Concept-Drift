#!/usr/bin/env python3
from scapy.all import *

# =====================================================
# Define custom RecHeader (your P4 header)
# =====================================================

class RecHeader(Packet):
    name = "RecHeader"
    fields_desc = [
        IntField("if_pass", 0),
        IntField("annomaly", 0),
        IntField("recirculate", 0),
        IntField("node_id", 0),
        IntField("next_node_id", 0),
        IntField("pass_cnt", 0),
        IntField("ewma_bit_shift", 0),
        IntField("ans", 0),
        IntField("state", 0),
        ShortField("original_ether_type", 0),  # 16 bits
        ShortField("original_ether_type2", 0)  # 16 bits

    ]

# =====================================================
# Bind RecHeader after Ethernet (your EtherType: 0x9966)
# =====================================================
bind_layers(Ether, RecHeader, type=0x9966)

# Optionally, if RecHeader is followed by IPv4:
bind_layers(RecHeader, IP, original_ether_type=0x0800)

# =====================================================
# Callback function to process each packet
# =====================================================
def handle_pkt2(pkt):
    if RecHeader in pkt:
        print("=== Received packet with RecHeader ===")
        pkt.show2()  # pretty print all fields
        print("-------------------------------------")
    else:
        print("Packet without RecHeader")
        pkt.show2()

def handle_pkt(pkt):
    if RecHeader in pkt:
        hdr_bytes = bytes(pkt[RecHeader])
        print(f"RecHeader raw length: {len(hdr_bytes)}")
        print(f"RecHeader raw hex   : {hdr_bytes.hex()}")
        pkt.show2()

# =====================================================
# Sniff packets on interface enp2s0f0np0
# =====================================================
if __name__ == "__main__":
    print("Listening on interface enp2s0f0np0 ... Press Ctrl+C to stop.")
    sniff(iface="enp2s0f0np0", prn=handle_pkt, store=0)
