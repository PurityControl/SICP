#lang racket

#|
Exercise 1.12:

The following pattern of numbers is called Pascal’s triangle.

         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
       . . .

The numbers at the edge of the triangle are all 1, and each number inside th
triangle is the sum of the two numbers above it. Write a procedure that
computes elements of Pascal’striangle by means of a recursive process.
|#

(define (pascal depth)
  (cond
    ((= depth 1) '(1))
    ((= depth 2) '(1 1))
    (else (pascal-row (pascal (sub1 depth))))))

(define (pascal-row previous-row)
  (define (build-row acc dec)
    (cond
      ((null? (cdr dec)) (cons 1 acc))
      ((null? acc) (build-row (cons (+ (car dec)
                                      (cadr dec))
                                   '(1))
                              (cdr dec)))
      (else (build-row (cons (+ (car dec)
                                (cadr dec))
                             acc)
                       (cdr dec)))))
  (build-row '() previous-row))
