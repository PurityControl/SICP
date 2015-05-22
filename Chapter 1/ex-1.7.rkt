#lang racket
#|
Exercise 1.7.
The good-enough? test used in computing square roots will not be very
effective for finding the square roots of very small numbers. Also, in
real computers, arithmetic operations are almost always performed with
limited precision. This makes our test inadequate for very large numbers.
Explain these statements, with examples showing how the test fails for
small and large numbers. An alternative strategy for implementing good-enough?
is to watch how guess changes from one iteration to the next and to stop when
the change is a very small fraction of the guess. Design a square-root
procedure that uses this kind of end test. Does this work better for small
and large numbers?

|#

(define (square x)
  (* x x))

(define (abs x)
  (if (> x 0)
      x
      (- x)))

#|
;original good-enoug
(define (good-enough? prev guess)
  (define delta 0.0001)
  (< (abs (- prev guess)) delta))
|#

(define (good-enough? guess x)
  (define delta 0.0001)
  (< (abs (- guess (square x))) delta))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter prev guess x)
  (if (good-enough? prev guess)
      guess
      (sqrt-iter guess
                 (improve guess x)
                 x)))

#|
on modern machines the result for small values is calculated so
quickly without timing multiple iterations there is no significant
speed increase.
The problem with large numbers is such that the accuracy of the delta
(precision) is lost in the way floats / doubles store their information.
Therefore for sufficiently large numbers the algorithm fails to terminate
in reasonable time.
|#
