(define (read-number)
  (string->number (read-line)))

(let ((w (read-number))
      (h (read-number))
      (n (read-number)))

  (let-values (((marks nums)
		(let loop ((in (read-line))
  	       		   (marks '())
  	       		   (nums '()))
  	       	  (cond ((eof-object? in)
  	       		 (values (length (delete-duplicates marks))
  	       			 (length (delete-duplicates nums))))
  	       		(else
  	       		 (let* ((in (open-input-string in))
  	       			(s (read in))
  	       			(k (read in)))
  	       		   (loop (read-line) (cons s marks) (cons k nums))))))))

    (print (- (+ (* marks h) (* nums w)) (* marks nums) n))))
