#lang racket

#|
Exercise 1.17.
The exponentiation algorithms in this section are based on performing
exponentiation by means of repeated multiplication. In a similar way, one can
perform integer multiplication by means of repeated addition. The following
multiplication procedure (in which it is assumed that our language can only
add, not multiply) is analogous to the expt procedure:

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

This algorithm takes a number of steps that is linear in b. Now suppose we
include, together with addition, operations double, which doubles an integer,
and halve, which divides an (even) integer by 2. Using these, design a
multiplication procedure analogous to fast-expt that uses a logarithmic number
of steps.
|#

(define (fast-mult b n)
  (define (double n)
    (* n 2))
  (define (halve n)
    ; could throw an error if odd, but not for this exercise
    (/ n 2))
  (define (mult-iter b n acc)
    (cond
      ((= n 0) acc)
      ((odd? n) (mult-iter b (sub1 n) (+ acc b)))
      (else
       (mult-iter (double b) (halve n) acc))))
  (mult-iter b n 0))

(require rackunit rackunit/text-ui)

(define file-tests
  (test-suite
   "test to make sure expt produces same result as library"
   (check-equal? (fast-mult 256 256) (* 256 256))
   (check-equal? (fast-mult 1356 4328) (* 1356 4328))
   (check-equal? (fast-mult 1865 1753) (* 1865 1753))))

(run-tests file-tests)
