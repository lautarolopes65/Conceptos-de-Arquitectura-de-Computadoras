.data
peso:	.double 100
estatura:	.double 1.7
limite1:	.double 18.5
limite2:	.double 25.0
limite3:	.double 30.0	
IMC:	.double 0;	IMC=peso/(estatura*estatura)
estado:	.word 0		;estado nutricional, tipo de peso(Infrapeso,Normal,Sobrepeso,Obeso) 
	.code
	l.d f1,peso(r0)
	l.d f2,estatura(r0)
	mul.d f3,f2,f2
	div.d f1,f1,f3
	s.d f1,IMC(r0)
	l.d f4,limite1(r0)
	l.d f5,limite2(r0)
	l.d f6,limite3(r0)
	c.lt.d f1,f4	;si IMC<18.5 FP=1
	bc1f sigo
	daddi r1,r0,1
	sd r1,estado(r0)
	j fin
sigo:	c.lt.d f1,f5	;si IMC<25 FP=1
	bc1f sigo2
	daddi r1,r0,2
	sd r1,estado(r0)
	j fin
sigo2:	c.lt.d f1,f6	;si IMC<30 FP=1
	bc1f sigo3
	daddi r1,r0,3
	sd r1,estado(r0)
	j fin
sigo3:	daddi r1,r0,4	;si IMC>=30
	sd r1,estado(r0)
fin:	halt