firrtl.circuit "InterfaceGroundType" attributes {
  annotations = [
    {
      class = "sifive.enterprise.grandcentral.AugmentedBundleType",
      defName = "VectorView",
      elements = [
        {
          class = "sifive.enterprise.grandcentral.AugmentedVectorType",
          elements = [
            {
              class = "sifive.enterprise.grandcentral.AugmentedGroundType",
              name = "foo",
              id = 4 : i64
            },
            {
              class = "sifive.enterprise.grandcentral.AugmentedGroundType",
              name = "bar",
              id = 5 : i64
            }
          ],
          name = "vector"
        }
      ],
      id = 3 : i64,
      name = "VectorView"
    }
  ]
} {
   firrtl.module @RefSource(
     out %ui0 : !firrtl.ref<uint<0>>,
     out %ui1 : !firrtl.ref<uint<1>>,
     out %ui2 : !firrtl.ref<uint<2>>) {

     // These are dummy references created for the purposes of the test.
     %_ui0 = firrtl.verbatim.expr "???" : () -> !firrtl.uint<0>
     %_ui1 = firrtl.verbatim.expr "???" : () -> !firrtl.uint<1>
     %_ui2 = firrtl.verbatim.expr "???" : () -> !firrtl.uint<2>
     %ref_ui0 = firrtl.ref.send %_ui0 : !firrtl.uint<0>
     %ref_ui1 = firrtl.ref.send %_ui1 : !firrtl.uint<1>
     %ref_ui2 = firrtl.ref.send %_ui2 : !firrtl.uint<2>
     firrtl.strictconnect %ui0, %ref_ui0 : !firrtl.ref<uint<0>>
     firrtl.strictconnect %ui1, %ref_ui1 : !firrtl.ref<uint<1>>
     firrtl.strictconnect %ui2, %ref_ui2 : !firrtl.ref<uint<2>>
   }

  firrtl.module @Companion() attributes {
    annotations = [
      {
        class = "sifive.enterprise.grandcentral.ViewAnnotation.companion",
        defName = "VectorView",
        id = 3 : i64,
        name = "VectorView"
      }
    ]
  } {

    %ref_ui0, %ref_ui1, %ref_ui2 = firrtl.instance refs @RefSource(
        out ui0 : !firrtl.ref<uint<0>>,
        out ui1 : !firrtl.ref<uint<1>>,
        out ui2 : !firrtl.ref<uint<2>>)

    %ui1 = firrtl.ref.resolve %ref_ui1 : !firrtl.ref<uint<1>>
    %foo = firrtl.node %ui1 {
      annotations = [
        {
          class = "sifive.enterprise.grandcentral.AugmentedGroundType",
          id = 4 : i64
        }
      ]
    } : !firrtl.uint<1>

    %ui2 = firrtl.ref.resolve %ref_ui2 : !firrtl.ref<uint<2>>
    %bar = firrtl.node %ui2 {
      annotations = [
        {
          class = "sifive.enterprise.grandcentral.AugmentedGroundType",
          id = 5 : i64
        }
      ]
    } : !firrtl.uint<2>

  }
  firrtl.module @InterfaceGroundType() {
    firrtl.instance companion @Companion()
  }
}
