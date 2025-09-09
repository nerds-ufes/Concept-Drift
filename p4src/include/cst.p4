/*
 * Copyright 2025-present IFES-UFES - Concept Drift Team
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed On an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// source here:
// https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml

#ifndef _ETHERTYPE_P4_
#define _ETHERTYPE_P4_

const bit<16>       ETHERTYPE_IPV4              = 0x0800;
const bit<16>       ETHERTYPE_ARP               = 0x0806;
const bit<16>       ETHERTYPE_VLAN              = 0x8100;
const bit<16>       ETHERTYPE_IPV6              = 0x86dd;
const bit<16>       ETHERTYPE_NSH               = 0x894f;
const bit<16>       ETHERTYPE_POLKA             = 0x8842;
const bit<16>       ETHERTYPE_MPLS_UCAST        = 0x8847;
const bit<16>       ETHERTYPE_MPLS_MCAST        = 0x8848;
const bit<16>       ETHERTYPE_LACP              = 0x8809;
const bit<16>       ETHERTYPE_LLDP              = 0x88cc;
const bit<16>       ETHERTYPE_PPPOE_CTRL        = 0x8863;
const bit<16>       ETHERTYPE_PPPOE_DATA        = 0x8864;
const bit<16>       ETHERTYPE_ROUTEDMAC         = 0x6558;
const bit<16>       ETHERTYPE_ROUTEDMAC_INT     = 0x6559;
const bit<16>       ETHERTYPE_SGT               = 0x8909;
const bit<16>       ETHERTYPE_REC               = 0x9966;

const PortId_t rec_port = 160;//196;       // recirculation port
const PortId_t port_user = 68;       // recirculation port
#
#endif // _ETHERTYPE_P4_

#ifndef _IP_PROTOCOL_P4_
#define _IP_PROTOCOL_P4_

const bit<8>        IP_PROTOCOL_ICMP = 1;
const bit<8>        IP_PROTOCOL_HOPOPT = 0;
const bit<8>        IP_PROTOCOL_IGMP = 2;
const bit<8>        IP_PROTOCOL_IPV4 = 4;
const bit<8>        IP_PROTOCOL_ST = 5;
const bit<8>        IP_PROTOCOL_TCP = 6;
const bit<8>        IP_PROTOCOL_UDP = 17;
const bit<8>        IP_PROTOCOL_IPV6 = 41;
const bit<8>        IP_PROTOCOL_IPV6_ROUTE = 43;
const bit<8>        IP_PROTOCOL_IPV6_FRAG = 44;
const bit<8>        IP_PROTOCOL_RSVP = 46;
const bit<8>        IP_PROTOCOL_GRE = 47;
const bit<8>        IP_PROTOCOL_IPV6_ICMP = 58;
const bit<8>        IP_PROTOCOL_IPV6_NONXT = 59;
const bit<8>        IP_PROTOCOL_IPV6_OPTS = 60;
const bit<8>        IP_PROTOCOL_EIGRP = 88;
const bit<8>        IP_PROTOCOL_OSPFIGP = 89;
const bit<8>        IP_PROTOCOL_PIM = 103;
const bit<8>        IP_PROTOCOL_VRRP = 112;
const bit<8>        IP_PROTOCOL_L2TP = 115;
const bit<8>        IP_PROTOCOL_STP = 118;
const bit<8>        IP_PROTOCOL_RSVP_E2E_IGNORE = 134;
const bit<8>        IP_PROTOCOL_MOBILITY_HEADER = 135;
const bit<8>        IP_PROTOCOL_MPLS_IN_IP = 137;
#endif // _IP_PROTOCOL_P4_

#ifndef _BUNDLE_P4_
#define _BUNDLE_P4_

#define IPV4_IPV6_HASH   1

/*
   As per INTEL/BAREFOOT recommendation
   should be enable by default
   except for round robin hash algorithm selection
*/
#ifdef NO_SCRAMBLE
#define HAVE_SCRAMBLE 0
#else
#define HAVE_SCRAMBLE 1
#endif

#ifndef RESILIENT_SELECTION
#define RESILIENT_SELECTION 0
#endif

#ifndef MAX_PROFILE_MEMBERS
#define MAX_PROFILE_MEMBERS 2048
#endif

#ifndef MAX_GROUP_SIZE
#define MAX_GROUP_SIZE 120
#endif

#ifndef MAX_GROUPS
#define MAX_GROUPS 1024
#endif

/*
 * INTEL/BAREFOOT guidelines
 * check BA-102 notes & training lab
 */
#if RESILIENT_SELECTION == 0
const SelectorMode_t SELECTION_MODE = SelectorMode_t.FAIR;
#define BASE_HASH_WIDTH 14
#else
const SelectorMode_t SELECTION_MODE = SelectorMode_t.RESILIENT;
#define BASE_HASH_WIDTH 51
#endif /* RESILIENT_SELECTION */

#if MAX_GROUP_SIZE <= 120
#define SUBGROUP_BITS 0
#elif MAX_GROUP_SIZE <= 3840
#define SUBGROUP_BITS 10
#elif MAX_GROUP_SIZE <= 119040
#define SUBGROUP_BITS 15
#else
#error "Maximum Group Size cannot exceed 119040 members on Tofino"
#endif /* MAX_GROUP_SIZE */

/*
 * HASH_WIDTH final definition
 */
#define HASH_WIDTH (BASE_HASH_WIDTH + SUBGROUP_BITS)

const bit<32> BUNDLE_SIZE = 16384;

struct l4_lookup_t {
    bit<16>  word_1;
    bit<16>  word_2;
}

/*
 * Since we will be calculating hash in 32-bit pieces, we will have this
 * definition, which will be either bit<32>, bit<64> or bit<96> depending
 * on HASH_WIDTH
 */
 
typedef bit<(((HASH_WIDTH + 32)/32)*32)> selector_hash_t;

#endif // _BUNDLE_P4_

#ifndef _TYPES_P4_
#define _TYPES_P4_

typedef bit<16>     ethertype_t;
typedef bit<48>     mac_addr_t;
typedef bit<20>     label_t;
typedef bit<128>    polka_route_t;
typedef bit<32>     ipv4_addr_t;
typedef bit<128>    ipv6_addr_t;
typedef bit<16>     layer4_port_t;
typedef bit<16>     checksum_t;
typedef bit<16>     sec_grp_t;
typedef bit<12>     vlan_id_t;
typedef bit<16>     switch_vrf_t;
//typedef bit<9>    PortId_t;
typedef bit<16>     NextHopId_t;
typedef bit<14>     SubIntId_t;
typedef bit<2>      SubIntPad_t;
#define MAX_PORT 16383

#endif // _TYPES_P4_
