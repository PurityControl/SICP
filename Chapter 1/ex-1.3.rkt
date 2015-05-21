#lang racket
#|

Exercise 1.3.  
Define a procedure that takes three numbers as arguments and returns the sum
of the squares of the two larger numbers.

|#

(define (sum-square-largest a b c)
  (define (square x)
    (* x x))
  (define (sum-square x y)
    (+ (square x) (square y)))
  (cond
    ((and (< a b) (< a c)) (sum-square b c))
    ((and (< b c) (< b a)) (sum-square a c))
    (else (sum-square a b))))

;test
(= 25 (sum-square-largest 2 3 4))
(= 25 (sum-square-largest 2 4 3))
(= 25 (sum-square-largest 4 3 2))
(= 41 (sum-square-largest 3 4 5))
(= 41 (sum-square-largest 4 3 5))
(= 41 (sum-square-largest 5 3 4))