

parser IngressParser(
	packet_in pkt,
	out headers hdr,
	out ingress_metadata_t ig_md,
	out ingress_intrinsic_metadata_t ig_intr_md) {


    state start {
        pkt.extract(hdr.ethernet);
        transition select(hdr.ethernet.ether_type) {
            ETHERTYPE_REC: parse_rec;
            ETHERTYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_rec {
        pkt.extract(hdr.rec);
        transition select(hdr.rec.original_ether_type) {
            ETHERTYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_ipv4 {
        pkt.extract(hdr.ipv4);
        transition parse_tcp;
    }

    state parse_tcp {
        pkt.extract(hdr.tcp);
        transition accept;
    }
}

parser EgressParser(
        packet_in pkt,
        out header_t hdr,
        out egress_metadata_t eg_md,
        out egress_intrinsic_metadata_t eg_intr_md) {
    state start {
        transition accept;
    }
}
