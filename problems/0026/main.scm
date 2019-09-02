(define (read-number)
  (string->number (read-line)))

(let ((n (read-number))
      (_ (read-number)))
  (let loop ((line (read-line)))
    (cond ((eof-object? line) (print n))
	  (else
	   (let ((tokens (map string->number (string-split line #\space))))
	     (cond ((= n (car tokens)) (set! n (cadr tokens)))
		   ((= n (cadr tokens)) (set! n (car tokens))))
	     (loop (read-line)))))))
