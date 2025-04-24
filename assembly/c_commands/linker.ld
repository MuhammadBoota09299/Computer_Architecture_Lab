OUTPUT_ARCH("riscv")
ENTRY(reset_handler)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 16K
  RAM (rwx)  : ORIGIN = 0x80000000, LENGTH = 4K
}

SECTIONS
{
  __stack_size = DEFINED(__stack_size) ? __stack_size : 512;

  /* Vector table must be at absolute start */
  .vectors :
  {
    KEEP(*(.vectors))
  } >FLASH

  /* Main function first in text section */
  .text :
  {
    *(.text.main)  /* Explicitly place main first */
    *(.text .text.*)
    *(.rodata .rodata.*)
    *(.srodata .srodata.*)
    . = ALIGN(4);
    _etext = .;
  } >FLASH

  /* Initialized data */
  .data : AT(_etext)
  {
    _sdata = .;
    *(.data .data.*)
    *(.sdata .sdata.*)
    . = ALIGN(4);
    _edata = .;
  } >RAM

  /* Zero-initialized data */
  .bss :
  {
    _sbss = .;
    *(.bss .bss.*)
    *(.sbss .sbss.*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .;
  } >RAM

  /* Stack at top of RAM */
  .stack (NOLOAD) :
  {
    . = ORIGIN(RAM) + LENGTH(RAM) - __stack_size;
    _sp = . + __stack_size;
  } >RAM
}OUTPUT_ARCH("riscv")
ENTRY(reset_handler)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 16K
  RAM (rwx)  : ORIGIN = 0x80000000, LENGTH = 4K
}

SECTIONS
{
  __stack_size = DEFINED(__stack_size) ? __stack_size : 512;

  /* Vector table must be at absolute start */
  .vectors :
  {
    KEEP(*(.vectors))
  } >FLASH

  /* Main function first in text section */
  .text :
  {
    *(.text.main)  /* Explicitly place main first */
    *(.text .text.*)
    *(.rodata .rodata.*)
    *(.srodata .srodata.*)
    . = ALIGN(4);
    _etext = .;
  } >FLASH

  /* Initialized data */
  .data : AT(_etext)
  {
    _sdata = .;
    *(.data .data.*)
    *(.sdata .sdata.*)
    . = ALIGN(4);
    _edata = .;
  } >RAM

  /* Zero-initialized data */
  .bss :
  {
    _sbss = .;
    *(.bss .bss.*)
    *(.sbss .sbss.*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .;
  } >RAM

  /* Stack at top of RAM */
  .stack (NOLOAD) :
  {
    . = ORIGIN(RAM) + LENGTH(RAM) - __stack_size;
    _sp = . + __stack_size;
  } >RAM
}