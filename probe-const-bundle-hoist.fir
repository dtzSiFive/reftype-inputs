circuit ProbeConstBundleHoist:
  extmodule RefSource:
    output x : Probe<{a: const UInt<3>}>

  module ProbeConstBundleHoist:
    output x : Probe<const {a : UInt}>
    inst r of RefSource
    define x = r.x
