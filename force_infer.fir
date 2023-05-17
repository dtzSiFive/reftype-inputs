circuit ForceInfer:
  module ForceInfer:
    input x : UInt<3>
    input y : UInt<3>


    node n = x

    wire inferMe : UInt
    inferMe <= y

    force_initial(rwprobe(n), inferMe)
