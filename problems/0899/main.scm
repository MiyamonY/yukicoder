;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sun Sep 29 00:31:43 2019
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

(use math.prime)

(define (solve)
  (read-number (n))

  (print (cond ((small-prime? n) "Sosu!")
	       ((find (lambda (m) (= m n)) (map (lambda (n) (* n n)) (iota 8 2))) "Heihosu!")
	       ((find (lambda (m) (= m n)) (map (lambda (n) (* n n n)) (iota 8 2))) "Ripposu!")
	       ((find (lambda (m) (= m n)) '(6 28)) "Kanzensu!")
	       (else n))))

(solve)
