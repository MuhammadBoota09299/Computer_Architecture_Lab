# gcd.s
# registers x8 and x9 have been pre-initialized by random values

gcd:
    beq x8, x9, stop
    blt x8, x9, less
    sub x8, x8, x9
    j gcd

less:
    sub x9, x9, x8
    j gcd

stop:
    sw x8, 8(x0)
    lw x10, 8(x0)

end:
    j end
