from netaddr import IPAddress
p4main = bfrt.p4_main

def clear_all(verbose=True, batching=True):
    global basic_i_tree

    for table_types in (['MATCH_DIRECT', 'MATCH_INDIRECT_SELECTOR'],
                        ['SELECTOR'],
                        ['ACTION_PROFILE']):
        for table in p4main.info(return_info=True, print_info=False):
            if table['type'] in table_types:
                if verbose:
                    print("Clearing table {:<40} ... ".
                          format(table['full_name']), end='', flush=True)
                table['node'].clear(batch=batching)
                if verbose:
                    print('Done')

#clear_all(verbose=True)

basic_i_tree = p4main.concept_drift.Ingress.basic_i_tree

basic_i_tree.add_with_do_leaf_node_if(node_id=8, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 58,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=8, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 59,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=6, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 48,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=6, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 49,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=6, next_node_id_t=8)
basic_i_tree.add_with_do_leaf_node_if(node_id=4, flags_start = 0,flags_end = 0,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=4, flags_start = 1,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=4, next_node_id_t=6)
basic_i_tree.add_with_do_leaf_node_if(node_id=11, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 330,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=11, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 331,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=3, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 19, pass_cnt_t=3, next_node_id_t=4)
basic_i_tree.add_with_do_internal_node(node_id=3, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 20,ctrl_end = 500, pass_cnt_t=3, next_node_id_t=11)
basic_i_tree.add_with_do_leaf_node_if(node_id=18, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 1562,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=18, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 1563,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=16, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 1360,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=16, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 1361,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=16, next_node_id_t=18)
basic_i_tree.add_with_do_leaf_node_if(node_id=14, flags_start = 0,flags_end = 0,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=14, flags_start = 1,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=14, next_node_id_t=16)
basic_i_tree.add_with_do_internal_node(node_id=2, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 867,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=2, next_node_id_t=3)
basic_i_tree.add_with_do_internal_node(node_id=2, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 868,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=2, next_node_id_t=14)
basic_i_tree.add_with_do_leaf_node_if(node_id=21, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 94,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=21, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 95,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=1, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 7,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=1, next_node_id_t=2)
basic_i_tree.add_with_do_internal_node(node_id=1, flags_start = 0,flags_end = 32767,protocol_start = 8,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=1, next_node_id_t=21)
basic_i_tree.add_with_do_leaf_node_if(node_id=25, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 3846,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_leaf_node_if(node_id=25, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 3847,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=24, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 0,ctrl_end = 22, pass_cnt_t=24, next_node_id_t=25)
basic_i_tree.add_with_do_leaf_node_if(node_id=24, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 10000,ctrl_start = 23,ctrl_end = 500, port_t = 130)
basic_i_tree.add_with_do_internal_node(node_id=0, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 0,total_len_end = 2144,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=0, next_node_id_t=1)
basic_i_tree.add_with_do_internal_node(node_id=0, flags_start = 0,flags_end = 32767,protocol_start = 0,protocol_end = 254,total_len_start = 2145,total_len_end = 10000,ctrl_start = 0,ctrl_end = 500, pass_cnt_t=0, next_node_id_t=24)

#tbl.add_with_do_internal_node(md.pass_cnt=0, hdr.ipv4.total_len = (61,100000),hdr.tcp.dst_port = (0,100000),hdr.tcp.flags = (0,100000),hdr.tcp.ctrl = (0,100000), pass_cnt_t=0, next_node_id_t=38)



bfrt.complete_operations()

print("""
******************* PROGAMMING RESULTS *****************
""")
print ("Table basic_classification:")
basic_i_tree.dump(table=True)
