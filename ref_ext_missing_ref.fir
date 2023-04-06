circuit MissingRef:
  extmodule NoRef:
    output x : Probe<UInt<1>>

  module MissingRef:
    output x : UInt<1>
    inst nr of NoRef
    x <= read(nr.x);
