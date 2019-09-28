;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sat Sep 28 19:45:12 2019
;;
(define-syntax read-number
  (syntax-rules ()
    ((_ nums)
     (define-values nums
       (apply values (map string->number (string-split (read-line) #\space)))))))

(define-syntax read-numbers
  (syntax-rules ()
    ((_ as)
     (define as (map string->number (string-split (read-line) #\space))))
    ((_ as n)
     (define as (map (lambda (_) (map string->number (string-split (read-line) #\space))) (iota n))))))

(define-syntax 1+ (syntax-rules () ((_ x) (+ x 1))))

(define-syntax 1- (syntax-rules () ((_ x) (- x 1))))

(define (solve)
  (read-number (t a b))

  (print (- (+ (ceiling (/ t a))
	       (ceiling (/ t b)))
	    (ceiling (/ t (lcm a b))))))

(solve)
