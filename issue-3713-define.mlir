module {
  firrtl.circuit "UseRefsWithSinkFlow" {
    firrtl.module private @InChild(in %p: !firrtl.ref<uint<1>>) {
    }
    firrtl.module private @OutChild(in %x: !firrtl.uint, out %y: !firrtl.uint, out %p: !firrtl.ref<uint>) {
      %0 = firrtl.ref.send %x : !firrtl.uint
      firrtl.ref.define %p, %0 : !firrtl.ref<uint>, !firrtl.ref<uint>
      %1 = firrtl.ref.resolve %p : !firrtl.ref<uint>
      firrtl.connect %y, %1 : !firrtl.uint, !firrtl.uint
    }
    firrtl.module @UseRefsWithSinkFlow(in %x: !firrtl.uint<1>, out %y: !firrtl.uint<1>, out %z: !firrtl.uint<1>, out %zz: !firrtl.uint<1>, out %p: !firrtl.ref<uint<1>>) {
      %0 = firrtl.ref.send %x : !firrtl.uint<1>
      firrtl.ref.define %p, %0 : !firrtl.ref<uint<1>>
      %1 = firrtl.ref.resolve %p : !firrtl.ref<uint<1>>
      firrtl.strictconnect %y, %1 : !firrtl.uint<1>
      %ic_p = firrtl.instance ic interesting_name @InChild(in p: !firrtl.ref<uint<1>>)
      %2 = firrtl.ref.send %x : !firrtl.uint<1>
      firrtl.ref.define %ic_p, %2 : !firrtl.ref<uint<1>>
      %3 = firrtl.ref.resolve %ic_p : !firrtl.ref<uint<1>>
      firrtl.strictconnect %z, %3 : !firrtl.uint<1>
      %oc_x, %oc_y, %oc_p = firrtl.instance oc interesting_name @OutChild(in x: !firrtl.uint, out y: !firrtl.uint, out p: !firrtl.ref<uint>)
      firrtl.connect %oc_x, %x : !firrtl.uint, !firrtl.uint<1>
      firrtl.connect %zz, %oc_y : !firrtl.uint<1>, !firrtl.uint
    }
  }
}
