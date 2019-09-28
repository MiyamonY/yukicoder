;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sat Sep 28 23:46:29 2019
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

(define (mod+ a b)
  (modulo (+ a b) MOD))

(define (mod* a b)
  (modulo (* a b) MOD))

(use util.match)

(define (matrix* x y)
  (match x
	 (((a0 b0) (c0 d0))
	  (match y
		 (((a1 b1) (c1 d1))
		  (list (list (mod+ (mod* a0 a1) (mod* b0 c1))
			      (mod+ (mod* a0 b1) (mod* b0 d1)))
			(list (mod+ (mod* c0 a1) (mod* d0 c1))
			      (mod+ (mod* c0 b1) (mod* d0 d1)))))))))

(define (solve)
  (read-number (a b n))

  (define (prod a n)
    (cond ((= n 0) '((1 0) (0 1)))
	  ((even? n) (prod (matrix* a a) (div n 2)))
	  (else
	   (matrix* a (prod a (1- n))))))

  (print (car (cadr (prod (list (list a b) '(1 0)) n)))))

(solve)
