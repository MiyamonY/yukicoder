(use math.prime)

(let ((n (read)))
  (define primes (filter small-prime? (iota (+ n 1))))

  (define result
    (let loop ((i 0)
	       (vec (make-vector (+ n 1) 0)))
      (cond ((= i (+ n 1))
	     (vector-ref vec n))
	    (else
	     (let1 winner
		   (if (<= i 3)
		       2
		       (let check-win ((ps primes))
			 (if (null? ps)
			     2
			     (let1 pred (- i (car ps))
				   (if (and (>= pred 2) (= (vector-ref vec pred) 2))
				       1
				       (check-win (cdr ps)))))))
		   (vector-set! vec i winner)
		   (loop (+ i 1) vec))))))

  (print (if (= result 1) "Win" "Lose")))
