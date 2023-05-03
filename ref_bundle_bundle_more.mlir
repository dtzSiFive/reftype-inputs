module {
  firrtl.circuit "Bundle" {
    firrtl.module private @Child(in %in: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %r: !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>) {
      %0 = firrtl.ref.send %in : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      firrtl.ref.define %r, %0 : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
    }
    firrtl.module private @Probe(in %in: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %r: !firrtl.openbundle<a: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, b: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>>, out %mixed: !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>) {
      %0 = firrtl.opensubfield %mixed[x] : !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>
      %1 = firrtl.opensubindex %0[1] : !firrtl.openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>
      %2 = firrtl.opensubfield %1[data] : !firrtl.openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>
      %3 = firrtl.opensubfield %1[p] : !firrtl.openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>
      %4 = firrtl.opensubindex %0[0] : !firrtl.openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>
      %5 = firrtl.opensubfield %4[data] : !firrtl.openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>
      %6 = firrtl.opensubfield %4[p] : !firrtl.openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>
      %7 = firrtl.opensubfield %mixed[b] : !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>
      %8 = firrtl.opensubfield %mixed[a] : !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>
      %9 = firrtl.opensubfield %r[b] : !firrtl.openbundle<a: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, b: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>>
      %10 = firrtl.opensubfield %r[a] : !firrtl.openbundle<a: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, b: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>>
      %c1_in, %c1_r = firrtl.instance c1 interesting_name @Child(in in: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out r: !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>)
      %11 = firrtl.ref.sub %c1_r[1] : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      %12 = firrtl.ref.sub %c1_r[0] : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      %c2_in, %c2_r = firrtl.instance c2 interesting_name @Child(in in: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out r: !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>)
      %13 = firrtl.ref.sub %c2_r[0] : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.strictconnect %c1_in, %in : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      firrtl.strictconnect %c2_in, %in : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      firrtl.ref.define %10, %c1_r : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.ref.define %9, %c2_r : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      %14 = firrtl.ref.resolve %12 : !firrtl.probe<uint<1>>
      firrtl.strictconnect %8, %14 : !firrtl.uint<1>
      %15 = firrtl.ref.resolve %11 : !firrtl.probe<vector<uint<1>, 2>>
      firrtl.strictconnect %7, %15 : !firrtl.vector<uint<1>, 2>
      firrtl.ref.define %6, %c1_r : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.ref.define %3, %c2_r : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      %16 = firrtl.ref.resolve %12 : !firrtl.probe<uint<1>>
      firrtl.strictconnect %5, %16 : !firrtl.uint<1>
      %17 = firrtl.ref.resolve %13 : !firrtl.probe<uint<1>>
      firrtl.strictconnect %2, %17 : !firrtl.uint<1>
    }
    firrtl.module @Bundle(in %in: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %out1: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %out2: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %out3: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %out4: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out %out5: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>) attributes {convention = #firrtl<convention scalarized>} {
      %0 = firrtl.subfield %out5[b] : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      %1 = firrtl.subfield %out5[a] : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      %p_in, %p_r, %p_mixed = firrtl.instance p interesting_name @Probe(in in: !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>, out r: !firrtl.openbundle<a: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, b: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>>, out mixed: !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>)
      %2 = firrtl.opensubfield %p_mixed[b] : !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>
      %3 = firrtl.opensubfield %p_mixed[a] : !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>
      %4 = firrtl.opensubfield %p_mixed[x] : !firrtl.openbundle<a: uint<1>, x: openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>, b: vector<uint<1>, 2>>
      %5 = firrtl.opensubindex %4[1] : !firrtl.openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>
      %6 = firrtl.opensubfield %5[p] : !firrtl.openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>
      %7 = firrtl.opensubindex %4[0] : !firrtl.openvector<openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>, 2>
      %8 = firrtl.opensubfield %7[p] : !firrtl.openbundle<p: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, data: uint<1>>
      %9 = firrtl.opensubfield %p_r[b] : !firrtl.openbundle<a: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, b: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>>
      %10 = firrtl.opensubfield %p_r[a] : !firrtl.openbundle<a: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>, b: probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>>
      firrtl.strictconnect %p_in, %in : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      %11 = firrtl.ref.resolve %10 : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.strictconnect %out1, %11 : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      %12 = firrtl.ref.resolve %9 : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.strictconnect %out2, %12 : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      %13 = firrtl.ref.resolve %8 : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.strictconnect %out3, %13 : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      %14 = firrtl.ref.resolve %6 : !firrtl.probe<bundle<a: uint<1>, b: vector<uint<1>, 2>>>
      firrtl.strictconnect %out4, %14 : !firrtl.bundle<a: uint<1>, b: vector<uint<1>, 2>>
      firrtl.strictconnect %1, %3 : !firrtl.uint<1>
      firrtl.strictconnect %0, %2 : !firrtl.vector<uint<1>, 2>
    }
  }
}
