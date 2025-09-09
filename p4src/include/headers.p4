/*******************************************************************************
 * Copyright 2025-present IFES-UFES - Concept Drift Team
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

#ifndef _HEADERS_
#define _HEADERS_

typedef bit<16>     ether_type_t;
typedef bit<8>      ip_protocol_t;


Checksum()ipv4_checksum;

header ethernet_h {
    mac_addr_t  dst_addr;
    mac_addr_t  src_addr;
    ethertype_t ether_type;
}

header vlan_tag_h {
    bit<3>      pcp;
    bit<1>      cfi;
    vlan_id_t   vid;
    ethertype_t ether_type;
}

header mpls_h {
    bit<20>     label;
    bit<3>      exp;
    bit<1>      bos;
    bit<8>      ttl;
}

header ipv4_h {
    bit<4>      version;
    bit<4>      ihl;
    bit<8>      diffserv;
    bit<16>     total_len;
    bit<16>     identification;
    bit<16>     flags;
    bit<8>      ttl;
    bit<8>      protocol;
    bit<16>     hdr_checksum;
    ipv4_addr_t src_addr;
    ipv4_addr_t dst_addr;
}

header ipv6_h {
    bit<4>      version;
    bit<8>      traffic_class;
    bit<20>     flow_label;
    bit<16>     payload_len;
    bit<8>      next_hdr;
    bit<8>      hop_limit;
    ipv6_addr_t src_addr;
    ipv6_addr_t dst_addr;
}

header tcp_h {
    bit<16>     src_port;
    bit<16>     dst_port;
    bit<32>     seq_no;
    bit<32>     ack_no;
    //bit<4>      data_offset;
    //bit<3>      res;
    //bit<3>      ecn;
    //bit<6>      ctrl;
    bit<7>      flags;
    bit<9>      ctrl;
    bit<16>     window;
    bit<16>     checksum;
    bit<16>     urgent_ptr;
}

header udp_h {
    bit<16>     src_port;
    bit<16>     dst_port;
    bit<16>     hdr_length;
    bit<16>     checksum;
}

header icmp_h {
    bit<8>      type_;
    bit<8>      code;
    bit<16>     hdr_checksum;
}

// Address Resolution Protocol -- RFC 6747
header arp_h {
    bit<16>     hw_type;
    bit<16>     proto_type;
    bit<8>      hw_addr_len;
    bit<8>      proto_addr_len;
    bit<16>     opcode;
    bit<48>     hwSrcAddr;
    bit<32>     protoSrcAddr;
    bit<48>     hwDstAddr;
    bit<32>     dest_ip;
}

// Segment Routing Extension (SRH) -- IETFv7
header ipv6_srh_h {
    bit<8>      next_hdr;
    bit<8>      hdr_ext_len;
    bit<8>      routing_type;
    bit<8>      seg_left;
    bit<8>      last_entry;
    bit<8>      flags;
    bit<16>     tag;
}

// VXLAN -- RFC 7348
header vxlan_h {
    bit<8>      flags;
    bit<24>     reserved;
    bit<24>     vni;
    bit<8>      reserved2;
}

// Generic Routing Encapsulation (GRE) -- RFC 1701
header gre_h {
    bit<1>      C;
    bit<1>      R;
    bit<1>      K;
    bit<1>      S;
    bit<1>      s;
    bit<3>      recurse;
    bit<5>      flags;
    bit<3>      version;
    bit<16>     proto;
}

header polka_h {
    bit<8>          version;
    bit<8>          ttl;
    ethertype_t     ether_type;
    polka_route_t   routeid;
}

header rec_h {
    bit<32> if_pass;
    bit<32> annomaly;
    bit<32> recirculate;
    bit<32> node_id;
    bit<32> next_node_id;
    bit<32> pass_cnt;
    bit<32> ewma_bit_shift;
    bit<32> ans;
    bit<32> state;
    bit<16> original_ether_type;
    bit<16> original_ether_type2;
}

struct header_t {
    ethernet_h  ethernet;
    rec_h       rec;
    vlan_tag_h  vlan_tag;
    polka_h	polka;
    ipv4_h      ipv4;
    ipv6_h      ipv6;
    tcp_h       tcp;
    udp_h       udp;
    // Add more headers here.
}

struct headers {
    ethernet_h  ethernet;
    rec_h       rec;
    vlan_tag_h  vlan_tag;
    polka_h	polka;
    arp_h       arp;
    ipv4_h      ipv4;
    ipv6_h      ipv6;
    tcp_h       tcp;
    udp_h       udp;
}

#endif /* _HEADERS_ */
