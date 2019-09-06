(let* ((n (string->number (read-line))))

  (print (if (= n 1)
	     0
	     (+ 1 (let loop ((i 0)
			     (m 1))
		    (if (<= n (* 2 m))
			i
			(loop (+ i 1) (* 2 m))))))))
