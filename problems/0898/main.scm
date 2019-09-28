;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sun Sep 29 00:48:50 2019
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

  (print (let loop ((i 1))
	   (cond
	    ((= (* i i) n) (+ i (loop (1+ i))))
	    ((< (* i i) n) (+ (if (= (modulo n i) 0) (+ i (div n i)) 0) (loop (1+ i))))
	    (else 0)))))

(solve)
