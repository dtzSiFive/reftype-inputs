circuit Foo :
	module Foo :
		output p : Probe<UInt>
		; ...

	module Bar :
		output x : UInt

		inst f of Foo
		x <= read(f.p) ; indirectly access the probed data

