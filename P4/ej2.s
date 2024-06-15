.data
A: .word 1
B: .word 2
.code
ld r1, A(r0)
dsub r2,r0,r0
sd r2, A(r0)
sd r1, B(r0)
halt
