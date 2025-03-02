
.section .text
.global _start

_start:
    li x8, 84      # Load 84 into x8
    li x9, 60      # Load 60 into x9

store:
    sw x8, 8(x0)
    sw x9, 12(x0)
    lw x10, 8(x0)
    lw x11, 12(x0)
    
