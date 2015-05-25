#lang racket

#|
Exercise 1.11:
A function f is defined by the rule that

f(n)=n if n<3 and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3.

Write a procedure that computes f by means of a recursive process.
Write a procedure that computes f by means of an iterative process.
|#

;; Recursive
(define (fn x)
  (if (< x 3)
      x
      (+ (fn (sub1 x))
         (* 2 (fn (- x 2)))
         (* 3 (fn (- x 3))))))


;; Iteration
(define (fn-iter x)
  (define (iter third second first total count)
    (if (= count 3)
        total
        (iter second
              first
              total
              (+ total
                 (* 2 first)
                 (* 3 second))
              (sub1 count))))
  (if (< x 3)
      x
      (iter 0 1 2 4 x)))

(fn 3)
(fn 4)
(fn 5)
(fn 6)
(fn 7)
(fn 8)
(fn 9)
(fn 10)
(fn 20)
(fn 30)
(fn 31)
(fn-iter 3)
(fn-iter 4)
(fn-iter 5)
(fn-iter 6)
(fn-iter 7)
(fn-iter 8)
(fn-iter 9)
(fn-iter 10)
(fn-iter 20)
(fn-iter 30)
(fn-iter 100)
