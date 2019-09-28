;;; File:  main.scm
;; Author: ymiyamoto
;;
;; Created on Sat Sep 28 23:14:58 2019
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

(use data.queue)

(define (solve)
  (read-number (n))
  (read-numbers as n)
  (define q (make-queue))
  (for-each
   (lambda (lis) (enqueue! q lis))
   (map (lambda (a) (cdr a)) as))

  (prlist
   (let loop ((ans '()))
     (if (queue-empty? q)
	 (reverse ans)
	 (let1 lis (dequeue! q)
	       (cond ((null? lis) (loop ans))
		     (else
		      (enqueue! q (cdr lis))
		      (loop (cons (car lis) ans)))))))))

(solve)
