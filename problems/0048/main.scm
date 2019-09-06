(define (read-number)
  (string->number (read-line)))

(let* ((x (read-number))
       (y (read-number))
       (l (read-number)))

  (print (+ #?=(div (+ (- l 1) (abs x)) l)
	    #?=(div (+ (- l 1) (abs y)) l)
	    #?=(cond ((>= y 0)
		      (if (= x 0) 0 1))
 		     (else 2)))))
