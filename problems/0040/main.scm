(define (take-while-right list pred)
  (define (take-while list)
    (cond ((null? list) '())
	  ((pred (car list)) (take-while (cdr list)))
	  (else list)))
  (reverse (take-while (reverse list))))

(let* ((d (string->number (read-line)))
       (arr (list->vector (map string->number (string-split (read-line) #\space)))))

  (let loop ((i d))
    (cond ((< i 3) arr)
	  (else
	   (let1 c (vector-ref arr i)
		 (vector-set! arr i 0)
		 (vector-set! arr (- i 2) (- (vector-ref arr (- i 2)) (* -1 c))))
	   (loop (- i 1)))))

  (let1 lis (take-while-right (vector->list arr) (lambda (x) (= 0 x)))
	(cond ((= (length lis) 0) (print 0) (print 0))
	      (else
	       (print (- (length lis) 1))
	       (print (string-join (map number->string lis)" "))))))
