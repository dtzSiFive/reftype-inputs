circuit RefReset:
  extmodule ResetSource:
    output p : RWProbe<AsyncReset>
  module RefReset:
    output p : Probe<Reset>
    inst s of ResetSource
    define p = s.p
