circuit RefReset:
  module ResetSource:
    input r : AsyncReset
    output p : Probe<{a: Reset, b: Reset}>
    output pconst : Probe<{a: Reset, b: const Reset}>

    wire x : Reset
    x <= r
    node zero = UInt(0) ; const
    wire bundle : {a: Reset, b: Reset}
    bundle.a <= x
    bundle.b <= zero
    define p = probe(bundle)

    wire bundle_const : {a: Reset, b: const Reset}
    bundle_const.a <= x
    bundle_const.b <= zero
    define pconst = probe(bundle_const)
    
  module RefReset:
    input r : AsyncReset
    output a : Probe<Reset>
    output b : Probe<Reset>
    output pconst : Probe<{a: Reset, b: const Reset}>
    inst s of ResetSource
    s.r <= r
    define a = s.p.a
    define b = s.p.b
    define pconst = s.pconst

