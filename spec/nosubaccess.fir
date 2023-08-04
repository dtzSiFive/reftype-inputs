circuit NoSubAccessesWithProbes :
  extmodule Ext :
    output x : {a : Probe<UInt<2>[2]>, b : UInt<2>}[3]

  module NoSubAccessesWithProbes :
    input i : UInt<5>
    input c : const UInt<5>
    output p : Probe<UInt>

    inst e of Ext
  
    ; Illegal: e.x[i], e.x[c]
    ; Illegal: e.x[0].a[i], e.x[0].a[c]
  
    ; Legal:
    define p = e.x[0].a[1]
