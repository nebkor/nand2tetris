// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
    @R2
    M=0
    @R0
    D=M
    @STOP
    D;JEQ
    @R1
    D=M
    @STOP
    D;JEQ
(ADD)
    // load y's value into D, add it to what's in R2
    @R1
    D=M
    @R2
    M=D+M
    // load x and decrement
    @R0
    M=M-1
    D=M
    @ADD
    D;JGT

(STOP)
    @STOP
    0;JMP