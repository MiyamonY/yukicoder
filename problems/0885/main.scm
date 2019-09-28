;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sun Sep 29 01:12:58 2019
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

(use data.heap)

(define (solve)
  (read-number (n))
  (read-numbers as)
  (read-number (q))
  (read-numbers xs)

  (define heap (build-binary-heap (list->vector as)))
  (fold
   (lambda (x sum)
     (let1 sum (let loop ((n (binary-heap-find-max heap))
			  (sum sum))
		 (if (<= x n)
		     (let1 rem (modulo n x)
			   (binary-heap-swap-max! heap rem)
			   (loop (binary-heap-find-max heap) (- (+ sum rem) n)))
		     sum))
	   (print sum)
	   sum))
   (fold + 0 as)
   xs))

(solve)
