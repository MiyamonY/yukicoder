(use math.prime)

(define (read-number)
  (string->number (read-line)))

(let* ((n (read-number)))
  (define primes (naive-factorize n))

  (define assoc '())
  (let loop ((primes primes))
    (unless (null? primes)
      (let1 prime (car primes)
	    (set! assoc (assoc-set! assoc prime (+ 1 (assoc-ref assoc prime 0)))))
      (loop (cdr primes))))

  (if (= (fold (lambda (x init) (logxor init (cdr x))) 0 assoc) 0)
      (print "Bob")
      (print "Alice")))
