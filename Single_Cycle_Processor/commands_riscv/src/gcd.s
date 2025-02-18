
.section .text
.global _start

_start:
    li x8, 84      # Load 84 into x8
    li x9, 60      # Load 60 into x9

gcd:
    beq x8, x9, stop   # If x8 == x9, go to stop
    blt x8, x9, less   # If x8 < x9, go to less
    sub x8, x8, x9     # x8 = x8 - x9
    j gcd              # Jump to gcd

less:
    sub x9, x9, x8     # x9 = x9 - x8
    j gcd              # Jump to gcd

stop:
    sw x8, 8(x0)      # Store GCD in memory
    lw x10, 8(x0)     # load
end:
    j end              # Infinite loop
