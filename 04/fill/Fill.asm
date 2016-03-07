// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(START)
    @SCREEN
    D=A
    @x
    M=D
    @KBD
    D=M
    @UNFILL
    D;JEQ
    @FILL
    0;JMP

(UNFILL)
    @KBD
    D=M
    @START
    D;JGT // jump to the beginning if a key is pressed

    @KBD
    D=A
    @x
    D=M-D
    @START
    D;JEQ // jump to start if contents of x are the same as the address of @KBD

    @x
    A=M
    M=0
    @x
    M=M+1
    @UNFILL
    0;JMP

(FILL)
    @KBD
    D=M
    @START
    D;JEQ // jump to start if a key is not pressed

    @KBD
    D=A
    @x
    D=M-D
    @START
    D;JEQ

    @x
    A=M
    M=-1
    @x
    M=M+1
    @FILL
    0;JMP
