circuit InWhen:

  module UTurn :
    input in : Probe<UInt<5>>
    output out : Probe<UInt<5>>
    define out = in

  module InWhen:
    input c : UInt<1>
    input d : UInt<5>

    output x : UInt

    inst u of UTurn

    when c:
      ; Define input probe in one block...
      define u.in = probe(d)
      x <= UInt(0)
    else:
      ; Consume its uturn output in another.
      node n = read(u.out)
      x <= n

