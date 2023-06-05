circuit Squiggle:

  module UTurnsAndMore:
    input data: UInt<1>[2]
    input ref: Probe<UInt<1>> ; data to read and send out
    input x: {in: Probe<UInt<1>>, flip out: Probe<UInt<1>>} ; bounce
    input y: {in: Probe<UInt<1>>, flip out: Probe<UInt<1>>} ; bounce

    output bundle_ref : Probe<{a: UInt<1>, b: UInt<1>}> ; export data for squiggling.
    output out: UInt<1> ; send read(data) out to keep alive/interesting.

    define x.out = x.in
    define y.out = y.in

    wire bundle : {a: UInt<1>, b: UInt<1>}
    bundle.a <= data[0]
    bundle.b <= data[1]
    define bundle_ref = probe(bundle)

    out <= read(ref)

  module Squiggle:
    input data: UInt<1>[2]
    output out: UInt<1> ; send read(data) out to keep alive/interesting.

    inst u1 of UTurnsAndMore
    inst u2 of UTurnsAndMore

    u1.data <= data
    u2.data <= data

    out <= and(u1.out, u2.out)

    ; cross back and forth a bit.
    define u1.ref = u1.x.out
    define u1.x.in = u2.x.out
    define u2.x.in = u1.y.out
    define u1.y.in = u2.y.out
    define u2.y.in = u1.bundle_ref.a

    ; loopback, resolve to same.
    define u2.ref = u2.bundle_ref.a
