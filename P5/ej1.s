.data
	n1: .double 9.13
	n2: .double 6.58
	res1: .double 0.0
	res2: .double 0.0
.code				;16 ciclos,7 inst.,2.286 CPI
	l.d f1, n1(r0)		;4 RAW's dato en conflicto->f2,f3 y f4
	l.d f2, n2(r0)
	add.d f3, f2, f1		;1 RAW
	mul.d f1, f2, f1		;1 WAR porq va a escribir en un regsitro q se va a usar en una inst. anterior
	mul.d f4, f2, f1
	s.d f3, res1(r0)		;2 RAW,1 Str con la instrucción: add.d f3, f2, f1
	s.d f4, res2(r0)		;1 RAW,1 Str con la instrucción: mul.d f4, f2, f1
halt