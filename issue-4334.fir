circuit Top : %[[
  {
    "class":"sifive.enterprise.grandcentral.DataTapsAnnotation",
    "keys":[
      {
        "class":"sifive.enterprise.grandcentral.ReferenceDataTapKey",
        "source":"~Top|Top>val",
        "sink":"~Top|Top/mid:Middle/leaf:Leaf>tap"
      },
      {
        "class":"sifive.enterprise.grandcentral.ReferenceDataTapKey",
        "source":"~Top|Top/mid:Middle/leaf:Leaf>val",
        "sink":"~Top|Top>tap"
      }
    ]
  }
]]
  module Leaf :
    input c: UInt<1>

    when c:
      wire val : UInt<3>
      val <= UInt(2)

      ; Tap Top's val
      wire tap : UInt<4>
      tap is invalid

  module Middle :
    input c: UInt<1>
    
    when c:
      inst leaf of Leaf
      leaf.c <= c

  module Top :
    input c: UInt<1>
    output o: UInt

    wire val : UInt<3>
    val <= UInt(1)

    inst mid of Middle
    mid.c <= c

    o is invalid

    ; Tap Leaf's val
    when c:
      wire tap : UInt
      tap is invalid
      o <= tap
