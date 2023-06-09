circuit RefReset:
  extmodule ResetSource:
    output p : RWProbe<Reset>
  module RefReset:
    output p : Probe<AsyncReset>
    inst s of ResetSource
    define p = s.p
