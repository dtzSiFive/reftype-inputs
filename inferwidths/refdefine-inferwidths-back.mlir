firrtl.circuit "RefDefineBack" {
  firrtl.module private @Ref(out %ref : !firrtl.rwprobe<uint>) {
    %x, %x_ref = firrtl.wire forceable : !firrtl.uint, !firrtl.rwprobe<uint>
    firrtl.ref.define %ref, %x_ref : !firrtl.rwprobe<uint>
  }
  firrtl.module @RefDefineBack(out %x : !firrtl.uint<2>) {
    %inst_ref = firrtl.instance inst @Ref(out ref : !firrtl.rwprobe<uint>)
    %val = firrtl.ref.resolve %inst_ref : !firrtl.rwprobe<uint>
    firrtl.connect %x, %val : !firrtl.uint<2>, !firrtl.uint
  }
}
