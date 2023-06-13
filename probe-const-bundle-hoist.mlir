firrtl.circuit "ProbeConstBundleHoist" {
  firrtl.extmodule private @RefSource(out x: !firrtl.probe<bundle<a: const.uint<3>>>) attributes {convention = #firrtl<convention scalarized>}
  firrtl.module @ProbeConstBundleHoist(out %x: !firrtl.probe<const.bundle<a: uint>>) attributes {convention = #firrtl<convention scalarized>} {
    %r_x = firrtl.instance r interesting_name @RefSource(out x: !firrtl.probe<bundle<a: const.uint<3>>>)
    %0 = firrtl.ref.cast %r_x : (!firrtl.probe<bundle<a: const.uint<3>>>) -> !firrtl.probe<const.bundle<a: uint>>
    firrtl.ref.define %x, %0 : !firrtl.probe<const.bundle<a: uint>>
  }
}
