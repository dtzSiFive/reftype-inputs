module {
  firrtl.circuit "Foo" {
    firrtl.module @Foo(in %x: !firrtl.bundle<a: uint<5>, b flip: vector<uint<3>, 2>>, out %y: !firrtl.bundle<a: uint<5>, b flip: vector<uint<3>, 2>>, out %xp: !firrtl.probe<bundle<a: uint<5>, b: vector<uint<3>, 2>>>) attributes {convention = #firrtl<convention scalarized>} {
      %p = firrtl.wire interesting_name : !firrtl.bundle<a: uint<5>, b flip: vector<uint<3>, 2>>
      %0 = firrtl.ref.send %p : !firrtl.bundle<a: uint<5>, b flip: vector<uint<3>, 2>>
      firrtl.ref.define %xp, %0 : !firrtl.probe<bundle<a: uint<5>, b: vector<uint<3>, 2>>>
      firrtl.strictconnect %p, %x : !firrtl.bundle<a: uint<5>, b flip: vector<uint<3>, 2>>
      firrtl.strictconnect %y, %p : !firrtl.bundle<a: uint<5>, b flip: vector<uint<3>, 2>>
    }
  }
}
