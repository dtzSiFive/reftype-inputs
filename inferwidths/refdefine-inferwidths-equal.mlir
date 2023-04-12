// -----
firrtl.circuit "RefDefineEqual" {
  firrtl.module private @InRef(in %ref : !firrtl.rwprobe<uint>) { }
  firrtl.module @RefDefineEqual(in %x : !firrtl.uint<1>, in %y : !firrtl.uint<2>) {
    %w1, %w1_ref = firrtl.wire forceable : !firrtl.uint, !firrtl.rwprobe<uint>
    %w2, %w2_ref = firrtl.wire forceable : !firrtl.uint, !firrtl.rwprobe<uint>
    firrtl.connect %w1, %x : !firrtl.uint, !firrtl.uint<1>
    firrtl.connect %w2, %y : !firrtl.uint, !firrtl.uint<2>

    %inst1_ref = firrtl.instance inst1 @InRef(in ref: !firrtl.rwprobe<uint>)
    %inst2_ref = firrtl.instance inst2 @InRef(in ref: !firrtl.rwprobe<uint>)
    firrtl.ref.define %inst1_ref, %w1_ref : !firrtl.rwprobe<uint>
    firrtl.ref.define %inst2_ref, %w2_ref : !firrtl.rwprobe<uint>
  }
}
