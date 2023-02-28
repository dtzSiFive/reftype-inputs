circuit Connect:
	module Consumer:
		input in : {a: UInt, pref: Probe<UInt>, flip cref: Probe<UInt>}
		; ...
		node n = in.a
		export probe(n) as in.cref

	module Producer:
		output out : {a: UInt, pref: Probe<UInt>, flip cref: Probe<UInt>}
		wire x : UInt
		export probe(x) as out.pref
		; ...
		out.a <= x

	module Connect:
		output out : {x: Probe<UInt>, y: Probe<UInt>}

		inst a of A
		inst b of B

		; A => B
		a.in.a <= b.out.a
		forward b.out.pref as a.in.pref
		forward a.in.cref as b.out.cref

		; Send references out
		forward b.out.pref as out.pref
		forward a.in.cref as out.cref

	module Top:
		inst c of Connect

		node producer_debug = read(c.pref);
		node consumer_debug = read(c.cref);

