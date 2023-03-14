// Handle eliding ref.define that changes widths..

// CHECK-LABEL: firrtl.circuit "NoWireForLiveRefInputPort"
firrtl.circuit "NoWireForLiveRefInputPort" {
   // CHECK-NOT: @Child
  firrtl.module private @Child(in %in: !firrtl.ref<uint>) attributes {annotations = [{class = "firrtl.passes.InlineAnnotation"}]} { }
  // CHECK: @NoWireForLiveRefInputPort
  firrtl.module @NoWireForLiveRefInputPort(in %in: !firrtl.uint<1>, out %out: !firrtl.uint) {
    // CHECK-NEXT: %[[REF:.+]] = firrtl.ref.send %in
    // CHECK-NEXT: %[[RES:.+]] = firrtl.ref.resolve %[[REF]]
    // CHECK-NEXT: firrtl.strictconnect %out, %[[RES]]
    // CHECK-NEXT: }
    %child_ref = firrtl.instance child @Child(in in: !firrtl.ref<uint>)
    %ref = firrtl.ref.send %in : !firrtl.uint<1>
    firrtl.ref.define %child_ref, %ref : !firrtl.ref<uint>, !firrtl.ref<uint<1>>
    %res = firrtl.ref.resolve %child_ref : !firrtl.ref<uint>
    firrtl.connect %out, %res : !firrtl.uint, !firrtl.uint
  }
}

