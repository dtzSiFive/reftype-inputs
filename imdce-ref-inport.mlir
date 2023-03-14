firrtl.circuit "Test" {
  firrtl.module private @Child(in %in: !firrtl.ref<uint<1>>) { }
  firrtl.module @Test(in %in: !firrtl.uint<1>, out %out: !firrtl.uint<1>) {
    %child_ref = firrtl.instance child @Child(in in: !firrtl.ref<uint<1>>)
    %ref = firrtl.ref.send %in : !firrtl.uint<1>
    firrtl.ref.define %child_ref, %ref : !firrtl.ref<uint<1>>, !firrtl.ref<uint<1>>
    %res = firrtl.ref.resolve %child_ref : !firrtl.ref<uint<1>>
    firrtl.strictconnect %out, %res : !firrtl.uint<1>
  }
}

