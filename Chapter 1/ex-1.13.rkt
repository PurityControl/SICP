#lang racket
#|

Exercise 1.13:

Prove that Fib(n) is the closest integer to φn/√5, where φ=(1+√5)/2.
Hint: Let ψ=(1-√5)/2.

Use induction and the definition of the Fibonacci numbers
(see 1.2.2)to prove that Fib(n)=(φn-ψn)/√5.
|#

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib-proof n)
  (let ((phi
         (/
          (+ 1
             (sqrt 5))
          2))
        (psi
         (/
          (- 1
             (sqrt 5))
          2)))

    (/
     (-
      (expt phi n)
      (expt psi n))
     (sqrt 5))))

(require rackunit rackunit/text-ui)
(define delta 1)

;;tests
(define file-tests
  (test-suite
  "Tests fib proof"
  (for-each
   (lambda (x)
     (check-= (fib x) (fib-proof x) delta))
   (range 50))))

(run-tests file-tests)
