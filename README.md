# Conversion Binary Real

This was my final project for COMP122: Computer Architecture and Assembly Language.  


## Overview:

In this project, I wrote a java and MIPS program that takes a real number, provided via sharp notation, and presented it as a binary real number -- also using sharp notation. Some of the coding was provided by Professor Steven Fitzgerald.

The program is structured with the following files:

  * `strtol.{j,s}`: converts the string contained with the buffer to a long (integer) within the given base (radix) -- created by me.
  * `whole2bin.{j,s}`: a method that converts a base10 integer to binary -- created by me.
  * `fractional2bin.{j,s}`: a method that converts base10 fractional value to binary -- created by me.
  * `binaryReal.{j,s}`: a driver method provided by the Professor
  * `strtofrac.{j,s}`: a conversion method provide by the Professor




## Test:

### Test Cases provided by the professor:
   To test run the following commands.

```bash
      "make test_java" to test your current version of binaryReal.j
      "make test_mips" to test your current version of binaryReal.s
      "make final" to test all your final versions of binaryReal.*
```