circuit RefReset:
  module ResetSource:
    input r : AsyncReset
    output p : RWProbe<Reset>

    wire x : Reset
    x <= r
    define p = rwprobe(x)
    
  module RefReset:
    input r : AsyncReset
    output p : Probe<Reset>
    inst s of ResetSource
    s.r <= r
    define p = s.p

