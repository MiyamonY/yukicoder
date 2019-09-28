;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sat Sep 28 20:04:17 2019
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

(define MOD 1000000007)

(define (mod+ x y)
  (modulo (+ x y) MOD))

(define (mod* x y)
  (modulo (* x y) MOD))

(define (make-comb num)
  (define fact-dp (make-vector num -1))
  (define inv-fact-dp (make-vector num -1))
  (define (fact n) (vector-ref fact-dp n))
  (define (inv-fact n) (vector-ref inv-fact-dp n))

  (vector-set! fact-dp 0 1)
  (vector-set! inv-fact-dp 0 1)
  (let loop ((i 1))
    (when (< i num)
      (vector-set! fact-dp i (mod* i (fact (- i 1))))
      (vector-set! inv-fact-dp i (expt-mod (fact i) (- MOD 2) MOD))
      (loop (+ i 1))))

  (lambda (n k)
    (define factn (fact n))
    (define powk (inv-fact k))
    (define pownk (inv-fact (- n k)))
    (mod* (mod* factn powk) pownk)))

(define (solve)
  (define comb (make-comb (* 3 100000)))
  (read-number (a b c))

  (print (fold mod+ 0
	       (map (lambda (i)
		      (define x (comb (- (+ a b c) i 2) (1- c)))
		      (define y (comb (- (+ a b) i 1) (1- b)))
		      (define z (1- (expt-mod 2 (- (+ a b c) i 1) MOD)))
		      (mod* (mod* x y) z))
		    (iota a 1)))))

(solve)
