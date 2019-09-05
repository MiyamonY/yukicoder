(use scheme.vector)
(use gauche.collection)
(use util.combinations)

(let* ((n (read)))
  (define vec (string->vector (number->string n)))
  (print (apply max
		(cons n #?=(let loop ((is (combinations (iota (vector-length vec)) 2)))
			     (cond ((null? is) '())
				   (else
				    (let ((vec-copied (vector-copy vec))
					  (pair (car is)))
				      (vector-swap! vec-copied (car pair) (cadr pair))
				      (cons (string->number (vector->string vec-copied))
					    (loop (cdr is)))))))))))
