#lang racket

#|
Exercise 1.16.
Design a procedure that evolves an iterative exponentiation process that uses
successive squaring and uses a logarithmic number of steps, as does fast-expt.
(Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along with the
exponent n and the base b, an additional state variable a, and define the state
transformation in such a way that the product a bn is unchanged from state to
state. At the beginning of the process a is taken to be 1, and the answer is
given by the value of a at the end of the process. In general, the technique of
defining an invariant quantity that remains unchanged from state to state is a
powerful way to think about the design of iterative algorithms.)
|#

(define (fast-expt b n)
  (define (square n)
    (* n n))
  (define (expt-iter b n acc)
    (cond
      ((= n 0) acc)
      ((odd? n) (expt-iter b (sub1 n) (* acc b)))
      (else
       (expt-iter (square b) (/ n 2) acc))))
  (expt-iter b n 1))

(require rackunit rackunit/text-ui)

(define file-tests
  (test-suite
   "test to make sure expt produces same result as library"
   (check-equal? (fast-expt 2 256) (expt 2 256))
   (check-equal? (fast-expt 3 35) (expt 3 35))
   (check-equal? (fast-expt 5 15) (expt 5 15))))

(run-tests file-tests)
