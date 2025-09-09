

control Ingress(
        inout headers hdr,
        inout ingress_metadata_t md,
        in ingress_intrinsic_metadata_t ig_intr_md,
        in ingress_intrinsic_metadata_from_parser_t ig_intr_prsr_md,
        inout ingress_intrinsic_metadata_for_deparser_t ig_intr_dprsr_md,
        inout ingress_intrinsic_metadata_for_tm_t ig_intr_tm_md) {

	Register<bit<32>, bit<32>>(32w1) m_n;
	Register<bit<32>, bit<32>>(32w1) m_sum_0;
	Register<bit<32>, bit<32>>(32w1) m_sum_1;
	Register<bit<32>, bit<32>>(32w1) m_p_0;
	Register<bit<32>, bit<32>>(32w1) m_p_1;
	Register<bit<32>, bit<32>>(32w1) z_t_0;
	Register<bit<32>, bit<32>>(32w1) z_t_1;
    Register<bit<16>, bit<16>>(32w1) state;

    RegisterAction<bit<32>, bit<32>, bit<32>>(m_n) increment_to_mn = {
        void apply(inout bit<32> state_value, out bit<32> readvalue){state_value = state_value + 1;readvalue = state_value;}
    };

    RegisterAction<bit<16>, bit<16>, bit<16>>(state) state_action = {
		  void apply(inout bit<16> state_value, out bit<16> readvalue){
			if (state_value == 1){ state_value = 0; }
			else { state_value = 1;	}
			readvalue = state_value;
        }
    };

    RegisterAction<bit<32>, bit<32>, bit<32>>(m_sum_0) m_sum_0_read_action =  {void apply(inout bit<32> value, out bit<32> ret){ret = value;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(m_sum_0) m_sum_0_write_action = {void apply(inout bit<32> value){value = md.msum;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(m_sum_1) m_sum_1_read_action =  {void apply(inout bit<32> value, out bit<32> ret){ret = value;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(m_sum_1) m_sum_1_write_action = {void apply(inout bit<32> value){value = md.msum;}};

    RegisterAction<bit<32>, bit<32>, bit<32>>(m_p_0) m_p_0_read_action =  {void apply(inout bit<32> value, out bit<32> ret){ret = value;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(m_p_0) m_p_0_write_action = {void apply(inout bit<32> value){value = md.mp;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(m_p_1) m_p_1_read_action =  {void apply(inout bit<32> value, out bit<32> ret){ret = value;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(m_p_1) m_p_1_write_action = {void apply(inout bit<32> value){value = md.mp;}};

    RegisterAction<bit<32>, bit<32>, bit<32>>(z_t_0) z_t_0_read_action =  {void apply(inout bit<32> value, out bit<32> ret){ret = value;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(z_t_0) z_t_0_write_action = {void apply(inout bit<32> value){value = md.zt;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(z_t_1) z_t_1_read_action =  {void apply(inout bit<32> value, out bit<32> ret){ret = value;}};
    RegisterAction<bit<32>, bit<32>, bit<32>>(z_t_1) z_t_1_write_action = {void apply(inout bit<32> value){value = md.zt;}};

	action do_recirculate(){
	    // 196 recirculation port pipe 1
            // 68 recirculation port pipe 0
            ig_intr_tm_md.ucast_egress_port = 9w68;
        }

	action do_internal_node(bit<8> pass_cnt_t, bit<8> next_node_id_t){
		hdr.rec.node_id = next_node_id_t;
        md.do_resubmit = 1;
		do_recirculate();	
	}

	action do_leaf_node(bit<9> port_t) {
		ig_intr_tm_md.ucast_egress_port = port_t;
		md.do_resubmit = 0;
        hdr.rec.next_node_id = 0;
	}

	action do_leaf_node_if(bit<1> an, bit<9> port_t) {
	    hdr.rec.if_pass = 1;
	    hdr.rec.annomaly = (bit<4>) an;
	    ig_intr_tm_md.ucast_egress_port = port_t;
	}

	action do_ewma_calculation(bit<5> bbit) {
	    
	}

	action drop_packet() {
	}

	table basic_classification {
	    key = {
		hdr.rec.node_id: exact;
		hdr.rec.pass_cnt: exact;
		hdr.ipv4.total_len: range;
		hdr.tcp.dst_port: range;
        hdr.tcp.flags : range;
		hdr.tcp.ctrl : range;
	    }
	    actions = {
		do_internal_node;
		do_leaf_node;
	    }
	    size = 256;
	}

	table basic_i_tree{
	    key = {
		hdr.rec.node_id : exact;
		hdr.ipv4.flags : range;
		hdr.ipv4.protocol : range;
		hdr.ipv4.total_len : range;
		hdr.tcp.ctrl : range;
	    }
	    actions = {
	    	do_internal_node;
		do_leaf_node_if;
            }
	    size = 256;
	}


	apply {
		    bit<9> device_port = ig_intr_md.ingress_port;
            hdr.rec.setValid();
		    if (!hdr.rec.isValid()) {
                hdr.rec.original_ether_type = hdr.ethernet.ether_type;
                hdr.ethernet.ether_type = ETHERTYPE_REC;
                hdr.rec.if_pass = 0;
            }        
            md.prob_p = state_action.execute(16w1);
            hdr.rec.state = md.prob_p;
            md.m_n = increment_to_mn.execute(32w1);

            if (md.prob_p == 0) {
                //increment_to_mn();
                md.msum = m_sum_0_read_action.execute(32w1);
                md.mp = m_p_0_read_action.execute(32w1);
                md.zt = z_t_0_read_action.execute(32w1);
            } else {
                md.msum = m_sum_1_read_action.execute(32w1);
                md.mp = m_p_1_read_action.execute(32w1);
                md.zt = z_t_1_read_action.execute(32w1);
            }

            if (hdr.rec.if_pass == 0) {
                basic_i_tree.apply();
            } else if (hdr.rec.if_pass == 1) {
                hdr.rec.if_pass = 2;
                Stage1.apply(md);
            } 
            if (hdr.rec.annomaly != 1) {
                basic_classification.apply();
            }
            Stage2.apply(hdr, md);
            ig_intr_tm_md.bypass_egress = 1w1;


        if (md.do_resubmit == 0) {  
            ig_intr_tm_md.bypass_egress = 1w1;
		    ig_intr_tm_md.ucast_egress_port = 9w168;
        }
	}
}

control IngressDeparser(
        packet_out pkt,
        inout headers hdr,
        in ingress_metadata_t ig_md,
        in ingress_intrinsic_metadata_for_deparser_t ig_intr_dprsr_md) {

    apply {
        pkt.emit(hdr);
    }
}

