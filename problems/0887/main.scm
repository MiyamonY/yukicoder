;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Mon Oct  7 01:53:59 2019
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
  (read-number (n))

  (define-values (m i)
    (let loop ((n n)
	       (m n)
	       (i 0))
      (if (= n 1)
	  (values m i)
	  (let1 val (if (even? n) (div n 2) (1+ (* 3 n)))
		(loop val (max m val) (1+ i))))))

  (print i)
  (print m))

(solve)
