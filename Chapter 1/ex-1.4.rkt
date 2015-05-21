#lang racket

#|

Exercise 1.4.  
Observe that our model of evaluation allows for combinations whose operators
are compound expressions. Use this observation to describe the behavior of
the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

it adds the absolute value of b to a by adding it to a if b is positive
of taking away from a if b is negative.

|#
