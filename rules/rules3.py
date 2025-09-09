from netaddr import IPAddress
p4main = bfrt.p4_main

def clear_all(verbose=True, batching=True):
    global b_ewma1

    for table_types in (['MATCH_DIRECT', 'MATCH_INDIRECT_SELECTOR'],['SELECTOR'],['ACTION_PROFILE']):
        for table in p4main.info(return_info=True, print_info=False):
            if table['type'] in table_types:
                if verbose:
                    print("Clearing table {:<40} ... ".
                    format(table['full_name']), end='', flush=True)
                table['node'].clear(batch=batching)
                if verbose:
                    print('Done')

#clear_all(verbose=True)

b_ewma1 = p4main.concept_drift.Ingress.Stage2.basic_ewma1
b_ewma1.add_with_prep_temp_shift_value_0(ewma_bit_shift = 0)
b_ewma1.add_with_prep_temp_shift_value_1(ewma_bit_shift = 1)
b_ewma1.add_with_prep_temp_shift_value_2(ewma_bit_shift = 2)
b_ewma1.add_with_prep_temp_shift_value_3(ewma_bit_shift = 3)
b_ewma1.add_with_prep_temp_shift_value_4(ewma_bit_shift = 4)
b_ewma1.add_with_prep_temp_shift_value_5(ewma_bit_shift = 5)
b_ewma1.add_with_prep_temp_shift_value_6(ewma_bit_shift = 6)
b_ewma1.add_with_prep_temp_shift_value_7(ewma_bit_shift = 7)
b_ewma1.add_with_prep_temp_shift_value_8(ewma_bit_shift = 8)
b_ewma1.add_with_prep_temp_shift_value_9(ewma_bit_shift = 9)
b_ewma1.add_with_prep_temp_shift_value_10(ewma_bit_shift = 10)
b_ewma1.add_with_prep_temp_shift_value_11(ewma_bit_shift = 11)
b_ewma1.add_with_prep_temp_shift_value_12(ewma_bit_shift = 12)
b_ewma1.add_with_prep_temp_shift_value_13(ewma_bit_shift = 13)
b_ewma1.add_with_prep_temp_shift_value_14(ewma_bit_shift = 14)
b_ewma1.add_with_prep_temp_shift_value_15(ewma_bit_shift = 15)
b_ewma1.add_with_prep_temp_shift_value_16(ewma_bit_shift = 16)
b_ewma1.add_with_prep_temp_shift_value_17(ewma_bit_shift = 17)
b_ewma1.add_with_prep_temp_shift_value_18(ewma_bit_shift = 18)
b_ewma1.add_with_prep_temp_shift_value_19(ewma_bit_shift = 19)
b_ewma1.add_with_prep_temp_shift_value_20(ewma_bit_shift = 20)
b_ewma1.add_with_prep_temp_shift_value_21(ewma_bit_shift = 21)
b_ewma1.add_with_prep_temp_shift_value_22(ewma_bit_shift = 22)
b_ewma1.add_with_prep_temp_shift_value_23(ewma_bit_shift = 23)
b_ewma1.add_with_prep_temp_shift_value_24(ewma_bit_shift = 24)
b_ewma1.add_with_prep_temp_shift_value_25(ewma_bit_shift = 25)
b_ewma1.add_with_prep_temp_shift_value_26(ewma_bit_shift = 26)
b_ewma1.add_with_prep_temp_shift_value_27(ewma_bit_shift = 27)
b_ewma1.add_with_prep_temp_shift_value_28(ewma_bit_shift = 28)
b_ewma1.add_with_prep_temp_shift_value_29(ewma_bit_shift = 29)
b_ewma1.add_with_prep_temp_shift_value_30(ewma_bit_shift = 30)
b_ewma1.add_with_prep_temp_shift_value_31(ewma_bit_shift = 31)

b_ewma2 = p4main.concept_drift.Ingress.Stage2.basic_ewma2
b_ewma2.add_with_apply_ewma_update_0(ewma_bit_shift = 0)
b_ewma2.add_with_apply_ewma_update_1(ewma_bit_shift = 1)
b_ewma2.add_with_apply_ewma_update_2(ewma_bit_shift = 2)
b_ewma2.add_with_apply_ewma_update_3(ewma_bit_shift = 3)
b_ewma2.add_with_apply_ewma_update_4(ewma_bit_shift = 4)
b_ewma2.add_with_apply_ewma_update_5(ewma_bit_shift = 5)
b_ewma2.add_with_apply_ewma_update_6(ewma_bit_shift = 6)
b_ewma2.add_with_apply_ewma_update_7(ewma_bit_shift = 7)
b_ewma2.add_with_apply_ewma_update_8(ewma_bit_shift = 8)
b_ewma2.add_with_apply_ewma_update_9(ewma_bit_shift = 9)
b_ewma2.add_with_apply_ewma_update_10(ewma_bit_shift = 10)
b_ewma2.add_with_apply_ewma_update_11(ewma_bit_shift = 11)
b_ewma2.add_with_apply_ewma_update_12(ewma_bit_shift = 12)
b_ewma2.add_with_apply_ewma_update_13(ewma_bit_shift = 13)
b_ewma2.add_with_apply_ewma_update_14(ewma_bit_shift = 14)
b_ewma2.add_with_apply_ewma_update_15(ewma_bit_shift = 15)
b_ewma2.add_with_apply_ewma_update_16(ewma_bit_shift = 16)
b_ewma2.add_with_apply_ewma_update_17(ewma_bit_shift = 17)
b_ewma2.add_with_apply_ewma_update_18(ewma_bit_shift = 18)
b_ewma2.add_with_apply_ewma_update_19(ewma_bit_shift = 19)
b_ewma2.add_with_apply_ewma_update_20(ewma_bit_shift = 20)
b_ewma2.add_with_apply_ewma_update_21(ewma_bit_shift = 21)
b_ewma2.add_with_apply_ewma_update_22(ewma_bit_shift = 22)
b_ewma2.add_with_apply_ewma_update_23(ewma_bit_shift = 23)
b_ewma2.add_with_apply_ewma_update_24(ewma_bit_shift = 24)
b_ewma2.add_with_apply_ewma_update_25(ewma_bit_shift = 25)
b_ewma2.add_with_apply_ewma_update_26(ewma_bit_shift = 26)
b_ewma2.add_with_apply_ewma_update_27(ewma_bit_shift = 27)
b_ewma2.add_with_apply_ewma_update_28(ewma_bit_shift = 28)
b_ewma2.add_with_apply_ewma_update_29(ewma_bit_shift = 29)
b_ewma2.add_with_apply_ewma_update_30(ewma_bit_shift = 30)
b_ewma2.add_with_apply_ewma_update_31(ewma_bit_shift = 31)

bfrt.complete_operations()
b_ewma1.dump(table=True)
b_ewma2.dump(table=True)
