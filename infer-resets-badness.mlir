// BADNESS:
firrtl.circuit "RefResetBadness" {
  // CHECK-LABEL: firrtl.module private @SendReset
  // CHECK-SAME: in %r: !firrtl.asyncreset
  // CHECK-SAME: out %ref: !firrtl.ref<asyncreset>
  // CHECK-NEXT: send %r : !firrtl.asyncreset
  // CHECK-NEXT: ref<asyncreset>
  firrtl.module private @SendReset(in %r: !firrtl.reset, out %ref: !firrtl.ref<reset>) {
    %ref_r = firrtl.ref.send %r : !firrtl.reset
    firrtl.strictconnect %ref, %ref_r : !firrtl.ref<reset>
    // firrtl.ref.define %ref, %ref_r : !firrtl.ref<reset>
  }
  // CHECK-LABEL: firrtl.module @RefReset
  // CHECK-NEXT: in r: !firrtl.asyncreset
  // CHECK-SAME: out ref: !firrtl.ref<asyncreset>
  // CHECK-NEXT: !firrtl.asyncreset, !firrtl.asyncreset
  // CHECK-NEXT: %s_ref : !firrtl.ref<asyncreset>
  firrtl.module @RefResetBadness(in %r: !firrtl.reset, out %reset : !firrtl.asyncreset) {
    %s_r, %s_ref = firrtl.instance s @SendReset(in r: !firrtl.reset, out ref: !firrtl.ref<reset>)
    firrtl.connect %s_r, %r : !firrtl.reset, !firrtl.reset
    %res_reset = firrtl.ref.resolve %s_ref : !firrtl.ref<reset>
    firrtl.connect %reset, %res_reset : !firrtl.asyncreset, !firrtl.reset
  }
}

