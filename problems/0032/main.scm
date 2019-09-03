(define (read-number)
  (string->number (read-line)))

(let* ((l (read-number))
       (m (read-number))
       (n (read-number))
       (total (+ n (* m 25) (* l 100))))

  (print (+ (div (mod total 1000) 100)
	    (div (mod total 100) 25)
	    (mod total 25))))
