control Stage1(
    inout ingress_metadata_t md){

        action do_division() {
            md.mp = (md.msum << 15);
        }


	apply{
	    do_division();
	}
}

control Stage2(inout headers hdr, inout ingress_metadata_t md) {

    // Action to determine if mn <= mp
    action calculate_and_extract_sign_bit() {
        md.sub_result = md.mp - md.mn;
        md.sign_bit = md.sub_result[31:31];
    }

    // --- Auto-generated Actions for each shift value (0-31) ---
    // Preparatory actions (Stage N)
    action prep_temp_shift_value_0()  { md.temp_shifted_mn = md.mn << 0; }
    action prep_temp_shift_value_1()  { md.temp_shifted_mn = md.mn << 1; }
    action prep_temp_shift_value_2()  { md.temp_shifted_mn = md.mn << 2; }
    action prep_temp_shift_value_3()  { md.temp_shifted_mn = md.mn << 3; }
    action prep_temp_shift_value_4()  { md.temp_shifted_mn = md.mn << 4; }
    action prep_temp_shift_value_5()  { md.temp_shifted_mn = md.mn << 5; }
    action prep_temp_shift_value_6()  { md.temp_shifted_mn = md.mn << 6; }
    action prep_temp_shift_value_7()  { md.temp_shifted_mn = md.mn << 7; }
    action prep_temp_shift_value_8()  { md.temp_shifted_mn = md.mn << 8; }
    action prep_temp_shift_value_9()  { md.temp_shifted_mn = md.mn << 9; }
    action prep_temp_shift_value_10() { md.temp_shifted_mn = md.mn << 10; }
    action prep_temp_shift_value_11() { md.temp_shifted_mn = md.mn << 11; }
    action prep_temp_shift_value_12() { md.temp_shifted_mn = md.mn << 12; }
    action prep_temp_shift_value_13() { md.temp_shifted_mn = md.mn << 13; }
    action prep_temp_shift_value_14() { md.temp_shifted_mn = md.mn << 14; }
    action prep_temp_shift_value_15() { md.temp_shifted_mn = md.mn << 15; }
    action prep_temp_shift_value_16() { md.temp_shifted_mn = md.mn << 16; }
    action prep_temp_shift_value_17() { md.temp_shifted_mn = md.mn << 17; }
    action prep_temp_shift_value_18() { md.temp_shifted_mn = md.mn << 18; }
    action prep_temp_shift_value_19() { md.temp_shifted_mn = md.mn << 19; }
    action prep_temp_shift_value_20() { md.temp_shifted_mn = md.mn << 20; }
    action prep_temp_shift_value_21() { md.temp_shifted_mn = md.mn << 21; }
    action prep_temp_shift_value_22() { md.temp_shifted_mn = md.mn << 22; }
    action prep_temp_shift_value_23() { md.temp_shifted_mn = md.mn << 23; }
    action prep_temp_shift_value_24() { md.temp_shifted_mn = md.mn << 24; }
    action prep_temp_shift_value_25() { md.temp_shifted_mn = md.mn << 25; }
    action prep_temp_shift_value_26() { md.temp_shifted_mn = md.mn << 26; }
    action prep_temp_shift_value_27() { md.temp_shifted_mn = md.mn << 27; }
    action prep_temp_shift_value_28() { md.temp_shifted_mn = md.mn << 28; }
    action prep_temp_shift_value_29() { md.temp_shifted_mn = md.mn << 29; }
    action prep_temp_shift_value_30() { md.temp_shifted_mn = md.mn << 30; }
    action prep_temp_shift_value_31() { md.temp_shifted_mn = md.mn << 31; }

    // Update actions (Stage N+1)
    action apply_ewma_update_0()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 0); }
    action apply_ewma_update_1()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 1); }
    action apply_ewma_update_2()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 2); }
    action apply_ewma_update_3()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 3); }
    action apply_ewma_update_4()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 4); }
    action apply_ewma_update_5()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 5); }
    action apply_ewma_update_6()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 6); }
    action apply_ewma_update_7()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 7); }
    action apply_ewma_update_8()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 8); }
    action apply_ewma_update_9()  { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 9); }
    action apply_ewma_update_10() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 10); }
    action apply_ewma_update_11() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 11); }
    action apply_ewma_update_12() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 12); }
    action apply_ewma_update_13() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 13); }
    action apply_ewma_update_14() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 14); }
    action apply_ewma_update_15() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 15); }
    action apply_ewma_update_16() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 16); }
    action apply_ewma_update_17() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 17); }
    action apply_ewma_update_18() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 18); }
    action apply_ewma_update_19() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 19); }
    action apply_ewma_update_20() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 20); }
    action apply_ewma_update_21() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 21); }
    action apply_ewma_update_22() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 22); }
    action apply_ewma_update_23() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 23); }
    action apply_ewma_update_24() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 24); }
    action apply_ewma_update_25() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 25); }
    action apply_ewma_update_26() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 26); }
    action apply_ewma_update_27() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 27); }
    action apply_ewma_update_28() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 28); }
    action apply_ewma_update_29() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 29); }
    action apply_ewma_update_30() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 30); }
    action apply_ewma_update_31() { md.mp = md.mp - md.temp_shifted_mn; hdr.rec.ans = hdr.rec.ans + (1 << 31); }

    // Table for Stage N: Selects the correct preparatory shift action
    table basic_ewma1 {
        key = { hdr.rec.ewma_bit_shift: exact; }
        actions = {
            prep_temp_shift_value_0;  prep_temp_shift_value_1;  prep_temp_shift_value_2;  prep_temp_shift_value_3;
            prep_temp_shift_value_4;  prep_temp_shift_value_5;  prep_temp_shift_value_6;  prep_temp_shift_value_7;
            prep_temp_shift_value_8;  prep_temp_shift_value_9;  prep_temp_shift_value_10; prep_temp_shift_value_11;
            prep_temp_shift_value_12; prep_temp_shift_value_13; prep_temp_shift_value_14; prep_temp_shift_value_15;
            prep_temp_shift_value_16; prep_temp_shift_value_17; prep_temp_shift_value_18; prep_temp_shift_value_19;
            prep_temp_shift_value_20; prep_temp_shift_value_21; prep_temp_shift_value_22; prep_temp_shift_value_23;
            prep_temp_shift_value_24; prep_temp_shift_value_25; prep_temp_shift_value_26; prep_temp_shift_value_27;
            prep_temp_shift_value_28; prep_temp_shift_value_29; prep_temp_shift_value_30; prep_temp_shift_value_31;
            NoAction;
        }
        size = 32;
        default_action = NoAction;
    }

    // Table for Stage N+1: Selects the correct update action
    table basic_ewma2 {
        key = { hdr.rec.ewma_bit_shift: exact; }
        actions = {
            apply_ewma_update_0;  apply_ewma_update_1;  apply_ewma_update_2;  apply_ewma_update_3;
            apply_ewma_update_4;  apply_ewma_update_5;  apply_ewma_update_6;  apply_ewma_update_7;
            apply_ewma_update_8;  apply_ewma_update_9;  apply_ewma_update_10; apply_ewma_update_11;
            apply_ewma_update_12; apply_ewma_update_13; apply_ewma_update_14; apply_ewma_update_15;
            apply_ewma_update_16; apply_ewma_update_17; apply_ewma_update_18; apply_ewma_update_19;
            apply_ewma_update_20; apply_ewma_update_21; apply_ewma_update_22; apply_ewma_update_23;
            apply_ewma_update_24; apply_ewma_update_25; apply_ewma_update_26; apply_ewma_update_27;
            apply_ewma_update_28; apply_ewma_update_29; apply_ewma_update_30; apply_ewma_update_31;
            NoAction;
        }
        size = 32;
        default_action = NoAction;
    }

    apply {
        // Step 1: Perform comparison and set boolean flag
        calculate_and_extract_sign_bit();
        if (md.sign_bit == 1w0) {
            md.is_mn_le_mp = true;
        } else {
            md.is_mn_le_mp = false;
        }

        // Step 2: If condition is met, apply the sequence of tables
        if (md.is_mn_le_mp) {
            // This applies the Stage N action
            basic_ewma1.apply();
            // This applies the Stage N+1 action, resolving the data dependency
            basic_ewma2.apply();
        }
	hdr.rec.ans = hdr.rec.ans -1;
    }
}