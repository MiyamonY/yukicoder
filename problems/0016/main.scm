(define MOD 1000003)

(define (pow x n)
  (define y (mod (* x x) MOD))
  (define m (div n 2))

  (cond ((= n 0) 1)
	((= (mod n 2) 1) (mod (* x (pow y m)) MOD))
	(else
	 (pow y m))))

(let* ((pair (map string->number (string-split (read-line) #\space)))
       (x (car pair))
       (arr (map string->number (string-split (read-line) #\space))))

  (print (fold (lambda (n s) (mod (+ (pow x n) s) MOD)) 0 arr)))
