(let* ((_ (read-line)))

  (let loop ((line (read-line)))
    (cond ((eof-object? line))
	  (else
	   (let* ((in (open-input-string line))
		  (n (read in))
		  (k (read in)))
	     (if (= (mod (- n 1) (+ k 1)) 0)
		 (print "Lose")
		 (print "Win"))
	     (loop (read-line)))))))
