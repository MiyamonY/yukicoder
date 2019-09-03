(define (read-number)
  (string->number (read-line)))

(define vec (make-vector 10 0))

(define extra 0)

(let ((_ (read-number)))
  (let loop ((row (read-line)))
    (cond ((eof-object? row) '())
	  (else
	   (let loop-inner ((column (map string->number (string-split row #\space))))
	     (if (null? column)
		 '()
		 (let ((n (car column)))
		   (vector-set! vec (- n 1) (+ 1 (vector-ref vec (- n 1))))
		   (loop-inner (cdr column)))))
	   (loop (read-line)))))

  (let1 total (fold + 0
		    (map (lambda (n)
			   (set! extra (+ extra (mod (vector-ref vec n) 2)))
			   (div (vector-ref vec n) 2)) (iota 10)))
	(print (+ total (div extra 4)))))
