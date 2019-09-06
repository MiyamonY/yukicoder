(let* ((n (read)))

  (let1 num #?=(let loop ((i 2)
			  (m n))
		 (cond ((< m (* i i))
			(if (= m 1) 0 1))
		       ((= (mod m i) 0)
			(+ 1 (loop i #?=(div m i))))
		       (else
			(loop (+ i 1) m))))
	(print (if (> num 2) "YES" "NO"))))
