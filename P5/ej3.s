	.data
base:	.double 5.85
altura:	.double 13.47
aux:	.double 2
sup:	.double 0		;sup=(base*altura)/2
.code
	l.d f1,base(r0)
	l.d f2,altura(r0)
	l.d f3,aux(r0)
	
	mul.d f1,f1,f2
	div.d f3,f1,f3
	s.d f3, sup(r0)
halt