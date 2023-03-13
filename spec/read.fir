circuit Foo :
	module Foo :
		output p : Probe<UInt>
		; ...
   wire x : UInt<4> ; XXX: ADDED
   x is invalid ; XXX: ADDED
   define p = probe(x) ; XXX: ADDED

	module Bar :
		output x : UInt

		inst f of Foo
		x <= read(f.p) ; indirectly access the probed data

