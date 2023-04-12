// -----
firrtl.circuit "RefDefineEqual" {
  firrtl.module private @InVal(in %val : !firrtl.uint) {}
  firrtl.module private @Refs(out %x_r : !firrtl.rwprobe<uint>, out %y_r : !firrtl.rwprobe<uint>) {
    %x, %x_ref = firrtl.wire forceable : !firrtl.uint, !firrtl.rwprobe<uint>
    %y, %y_ref = firrtl.wire forceable : !firrtl.uint, !firrtl.rwprobe<uint>
    //%zero1 = firrtl.constant 0 : !firrtl.uint<1>
    //%zero2 = firrtl.constant 0 : !firrtl.uint<2>
    //firrtl.connect %x, %zero1 : !firrtl.uint, !firrtl.uint<1>
    //firrtl.connect %y, %zero2 : !firrtl.uint, !firrtl.uint<2>
    firrtl.ref.define %x_r , %x_ref : !firrtl.rwprobe<uint>
    firrtl.ref.define %y_r , %y_ref : !firrtl.rwprobe<uint>
  }
  firrtl.module @RefDefineEqual(in %x : !firrtl.uint<1>, in %y : !firrtl.uint<2>) {
     %refs_x_r, %refs_y_r = firrtl.instance refs @Refs(out x_r : !firrtl.rwprobe<uint>, out y_r : !firrtl.rwprobe<uint>)

    %inst1_val = firrtl.instance inst1 @InVal(in val: !firrtl.uint)
    %inst2_val = firrtl.instance inst2 @InVal(in val: !firrtl.uint)
    %val1 = firrtl.ref.resolve %refs_x_r : !firrtl.rwprobe<uint>
    %val2 = firrtl.ref.resolve %refs_y_r : !firrtl.rwprobe<uint>
    firrtl.connect %inst1_val, %val1 : !firrtl.uint, !firrtl.uint
    firrtl.connect %inst2_val, %val2 : !firrtl.uint, !firrtl.uint
  }
}
