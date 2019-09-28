;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sat Sep 28 23:42:04 2019
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

(define-syntax prlist
  (syntax-rules ()
    ((_ lis)
     (print (string-join (map number->string lis) " ")))))

(define-syntax 1+ (syntax-rules () ((_ x) (+ x 1))))

(define-syntax 1- (syntax-rules () ((_ x) (- x 1))))

(define MOD 1000000007)

(define (solve)
  (read-number (a1 b1 a2 b2 a3 b3))

  (print (if (even? (+ (expt-mod a1 b1 2) (expt-mod a2 b2 2) (expt-mod a3 b3 2)))
	     ":-)"
	     ":-(")))

(solve)
