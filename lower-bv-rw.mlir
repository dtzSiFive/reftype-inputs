firrtl.circuit "InstWithRWProbeOfAgg" {
  // CHECK-LABEL: firrtl.module private @RefTypeBV_RW
  firrtl.module private @RefTypeBV_RW(
    out %vec_ref: !firrtl.rwprobe<vector<uint<1>,2>>,
    out %vec: !firrtl.vector<uint<1>,2>,
    out %bov_ref: !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>,
    out %bov: !firrtl.bundle<a: vector<uint<1>,2>, b: uint<2>>,
    out %probe: !firrtl.probe<uint<2>>
  ) {
    // Forceable declaration expanded into ground elements.
    // CHECK-NEXT: %{{.+}}, %[[X_A_0_REF:.+]] = firrtl.wire forceable : !firrtl.uint<1>, !firrtl.rwprobe<uint<1>>
    // CHECK-NEXT: %{{.+}}, %[[X_A_1_REF:.+]] = firrtl.wire forceable : !firrtl.uint<1>, !firrtl.rwprobe<uint<1>>
    // CHECK-NEXT: %{{.+}}, %[[X_B_REF:.+]] = firrtl.wire forceable : !firrtl.uint<2>, !firrtl.rwprobe<uint<2>>
    %x, %x_ref = firrtl.wire forceable : !firrtl.bundle<a: vector<uint<1>, 2>, b flip: uint<2>>, !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>

    // Define using forceable ref expanded.
    // CHECK-NEXT: firrtl.ref.define %{{.+}}, %[[X_A_0_REF]] : !firrtl.rwprobe<uint<1>>
    // CHECK-NEXT: firrtl.ref.define %{{.+}}, %[[X_A_1_REF]] : !firrtl.rwprobe<uint<1>>
    // CHECK-NEXT: firrtl.ref.define %{{.+}}, %[[X_B_REF]] : !firrtl.rwprobe<uint<2>>
    firrtl.ref.define %bov_ref, %x_ref : !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>

    // Update ref.sub uses.
    // CHECK-NEXT: %[[v_0:.+]] = firrtl.ref.resolve %[[X_A_0_REF]]
    // CHECK-NEXT: %[[v_1:.+]] = firrtl.ref.resolve %[[X_A_1_REF]]
    // CHECK-NEXT: firrtl.strictconnect %vec_0, %[[v_0]]
    // CHECK-NEXT: firrtl.strictconnect %vec_1, %[[v_1]]
    %x_ref_a = firrtl.ref.sub %x_ref[0] : !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>
    %x_a = firrtl.ref.resolve %x_ref_a : !firrtl.rwprobe<vector<uint<1>,2>>
    firrtl.strictconnect %vec, %x_a : !firrtl.vector<uint<1>,2>

    // Check chained ref.sub's work.
    // CHECK-NEXT: firrtl.ref.resolve %[[X_A_1_REF]]
    %x_ref_a_1 = firrtl.ref.sub %x_ref_a[1] : !firrtl.rwprobe<vector<uint<1>,2>>
    %x_a_1 = firrtl.ref.resolve %x_ref_a_1 : !firrtl.rwprobe<uint<1>>

    // Ref to flipped field.
    // CHECK-NEXT: firrtl.ref.resolve %[[X_B_REF]]
    %x_ref_b = firrtl.ref.sub %x_ref[1] : !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>
    %x_b = firrtl.ref.resolve %x_ref_b : !firrtl.rwprobe<uint<2>>

    // TODO: Handle rwprobe --> probe define, enable this.
    // firrtl.ref.define %probe, %x_ref_b : !firrtl.probe<uint<2>>

    // Check resolve is fully expanded.
    // CHECK-NEXT: %[[READ_A_0:.+]] = firrtl.ref.resolve %[[X_A_0_REF]]
    // CHECK-NEXT: %[[READ_A_1:.+]] = firrtl.ref.resolve %[[X_A_1_REF]]
    // CHECK-NEXT: %[[READ_B:.+]] = firrtl.ref.resolve %[[X_B_REF]]
    // CHECK-NEXT: firrtl.strictconnect %bov_a_0, %[[READ_A_0]]
    // CHECK-NEXT: firrtl.strictconnect %bov_a_1, %[[READ_A_1]]
    // CHECK-NEXT: firrtl.strictconnect %bov_b, %[[READ_B]]
    %x_read = firrtl.ref.resolve %x_ref : !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>
    firrtl.strictconnect %bov, %x_read : !firrtl.bundle<a: vector<uint<1>,2>, b: uint<2>>
    // CHECK-NEXT: }
  }
  // Check how rwprobe's of aggregates in instances are handled.
  // Temporary until no longer need to lower these.
  // CHECK-LABEL: firrtl.module @InstWithRWProbeOfAgg
  firrtl.module @InstWithRWProbeOfAgg(in %clock : !firrtl.clock, in %pred : !firrtl.uint<1>) {
    // CHECK: {{((%[^,]+, ){4})}}
    // CHECK-SAME: %[[BOV_REF_A_0:[^,]+]], %[[BOV_REF_A_1:[^,]+]], %[[BOV_REF_B:[^,]+]],
    // CHECK-SAME: %[[BOV_A_0:.+]],        %[[BOV_A_1:.+]],        %[[BOV_B:.+]],        %{{.+}} = firrtl.instance
    // CHECK-NOT: firrtl.probe
    // CHECK-SAME: probe: !firrtl.probe<uint<2>>)
    %inst_vec_ref, %inst_vec, %inst_bov_ref, %inst_bov, %inst_probe = firrtl.instance inst @RefTypeBV_RW(
      out vec_ref: !firrtl.rwprobe<vector<uint<1>,2>>,
      out vec: !firrtl.vector<uint<1>,2>,
      out bov_ref: !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>,
      out bov: !firrtl.bundle<a: vector<uint<1>,2>, b: uint<2>>,
      out probe: !firrtl.probe<uint<2>>)

    // Check lowering force and release operations.
    // Use self-assigns for simplicity.
    // CHECK: firrtl.ref.force %clock, %pred, %[[BOV_REF_A_0]], %[[BOV_A_0]] :
    // CHECK: firrtl.ref.force %clock, %pred, %[[BOV_REF_A_1]], %[[BOV_A_1]] :
    // CHECK: firrtl.ref.force %clock, %pred, %[[BOV_REF_B]], %[[BOV_B]] :
    firrtl.ref.force %clock, %pred, %inst_bov_ref, %inst_bov : !firrtl.clock, !firrtl.uint<1>, !firrtl.bundle<a: vector<uint<1>,2>, b: uint<2>>
    // CHECK-COUNT-3: firrtl.ref.force_initial %pred,
    firrtl.ref.force_initial %pred, %inst_bov_ref, %inst_bov : !firrtl.uint<1>, !firrtl.bundle<a: vector<uint<1>,2>, b: uint<2>>
    // CHECK-COUNT-3: firrtl.ref.release %clock, %pred, 
    firrtl.ref.release %clock, %pred, %inst_bov_ref : !firrtl.clock, !firrtl.uint<1>, !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>
    // CHECK-COUNT-3: firrtl.ref.release_initial %pred, 
    firrtl.ref.release_initial %pred, %inst_bov_ref : !firrtl.uint<1>, !firrtl.rwprobe<bundle<a: vector<uint<1>,2>, b: uint<2>>>
    // CHECK-NEXT: }
  }
}
