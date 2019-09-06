(define (read-number)
  (string->number (read-line)))

(define (generate n)
  (define m n)
  (lambda () (let1 k m
	      (set! m (- m 1))
	      k)))

(let* ((w (read-number))
       (d (read-number)))
  (define gen (generate d))

  (print (let loop ((rem w))
	   (let1 n (gen)
		 (cond ((= n 1) rem)
		       (else
			(loop (- rem (div rem (* n n))))))))))
