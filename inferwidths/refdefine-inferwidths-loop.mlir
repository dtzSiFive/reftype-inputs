firrtl.circuit "RefDefineLoop" {
  firrtl.module private @Ref(out %ref : !firrtl.rwprobe<uint>, in %in : !firrtl.rwprobe<uint>) {
    firrtl.ref.define %ref, %in : !firrtl.rwprobe<uint>
    //%x, %x_ref = firrtl.wire forceable : !firrtl.uint, !firrtl.rwprobe<uint>
    //firrtl.ref.define %ref, %x_ref : !firrtl.rwprobe<uint>
  }
  firrtl.module @RefDefineLoop(out %x : !firrtl.uint<2>) {
    %inst_ref, %inst_in = firrtl.instance inst @Ref(out ref : !firrtl.rwprobe<uint>, in in : !firrtl.rwprobe<uint>)
    firrtl.ref.define %inst_in, %inst_ref : !firrtl.rwprobe<uint>
    //%val = firrtl.ref.resolve %inst_ref : !firrtl.rwprobe<uint>
    //firrtl.connect %x, %val : !firrtl.uint<2>, !firrtl.uint
  }
}

