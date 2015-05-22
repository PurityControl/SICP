#lang racket
#|
Exercise 1.8. 
Newton's method for cube roots is based on the fact that if y is an
approximation to the cube root of x, then a better approximation is
given by the value

(/ (+ (/ r (* y y))
      (* 2 y))
   3)


Use this formula to implement a cube-root procedure analogous to the
square-root procedure. (In section 1.3.4 we will see how to implement
Newton's method in general as an abstraction of these square-root and
cube-root procedures.)
|#

(require rackunit rackunit/text-ui)
(define delta 0.000001)

(define (cube-root x)
  
  (define (cube x)
    (* x x x))
  
  (define (abs x)
    (if (> x 0) x (- x)))
  
  (define (good-enough? guess x)
    (< (abs (- (abs (cube guess)) 
               x)) 
       delta))
  
  (define (improve guess x)
    (/ (+ (/ x (* guess guess))
          (* 2 guess))
       3))
  
  (define (cube-root guess x)
    (if (good-enough? guess x)
        guess
        (cube-root (improve guess x) x)))
  
  (cube-root 1.0 x))


;;tests
(define file-tests
  (test-suite
  "Tests cube root within delta"
  ; delta in tests is on the answer, delta in solution is on parameter
  (check-= (cube-root 0.000008) (expt 0.000008 1/3) (expt delta 1/3))
  (check-= (cube-root 8) (expt 8 1/3) (expt delta 1/3))
  (check-= (cube-root 100) (expt 100 1/3) (expt delta 1/3))
  (check-= (cube-root 5000) (expt 5000 1/3) (expt delta 1/3))))


(run-tests file-tests)
