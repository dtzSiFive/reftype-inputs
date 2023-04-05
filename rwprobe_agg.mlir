module {
  firrtl.circuit "RWProbeAgg" {
    firrtl.module @RWProbeAgg(in %in: !firrtl.bundle<a: uint<1>, b: uint<3>>, out %out: !firrtl.rwprobe<bundle<a: uint<1>, b: uint<3>>>) attributes {convention = #firrtl<convention scalarized>} {
      %n, %n_ref = firrtl.node interesting_name %in forceable : !firrtl.bundle<a: uint<1>, b: uint<3>>
      firrtl.ref.define %out, %n_ref : !firrtl.rwprobe<bundle<a: uint<1>, b: uint<3>>>
    }
  }
}
