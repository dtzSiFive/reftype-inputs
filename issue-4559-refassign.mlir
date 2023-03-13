firrtl.circuit "Test" {
  firrtl.module @Test() {
    %child_ref = firrtl.instance child @Child(in in: !firrtl.ref<uint<1>>)
    %send_ref = firrtl.instance send @send(out dest: !firrtl.ref<uint<1>>) 
    firrtl.ref.define %child_ref, %send_ref : !firrtl.ref<uint<1>>
  }
  firrtl.module private @Child(in %in: !firrtl.ref<uint<1>>) {
    %x = firrtl.ref.resolve %in: !firrtl.ref<uint<1>>
    %sink = firrtl.instance sink @Sink(in sink: !firrtl.uint<1>)
    firrtl.strictconnect %sink, %x: !firrtl.uint<1>
  }
  firrtl.extmodule @Sink(in sink: !firrtl.uint<1>)
  firrtl.extmodule @Source(out sourceport: !firrtl.uint<1>)

  firrtl.module private @send(out %dest: !firrtl.ref<uint<1>>) {
    %res = firrtl.instance source @Source(out sourceport: !firrtl.uint<1>) 
    %ref_source = firrtl.ref.send %res : !firrtl.uint<1>
    firrtl.ref.define %dest, %ref_source : !firrtl.ref<uint<1>>
  }
}
