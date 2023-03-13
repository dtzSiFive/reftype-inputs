// CHECK-LABEL: "RefResetBundle"
firrtl.circuit "RefResetBundle" {
  // CHECK-LABEL: firrtl.module @RefResetBundle
  // CHECK-NOT: firrtl.reset
  firrtl.module @RefResetBundle(in %driver: !firrtl.asyncreset, out %out: !firrtl.bundle<a: reset, b: reset>) {
  %r = firrtl.wire : !firrtl.bundle<a: reset, b flip: reset> 
  %ref_r = firrtl.ref.send %r : !firrtl.bundle<a: reset, b flip: reset>
  %reset = firrtl.ref.resolve %ref_r : !firrtl.ref<bundle<a: reset, b: reset>>
  firrtl.strictconnect %out, %reset : !firrtl.bundle<a: reset, b: reset>

   %r_a = firrtl.subfield %r[a] : !firrtl.bundle<a: reset, b flip: reset>
   %r_b = firrtl.subfield %r[b] : !firrtl.bundle<a: reset, b flip: reset>
   firrtl.connect %r_a, %driver : !firrtl.reset, !firrtl.asyncreset
   firrtl.connect %r_b, %driver : !firrtl.reset, !firrtl.asyncreset
  }
}

