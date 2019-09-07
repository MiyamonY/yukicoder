(define (comb s)
  (cond ((null? s) '(()))
	(else
	 (append (map (lambda (x) (cons (car s) x)) (comb (cdr s)))
		 (map (lambda (x) (cons (last s) x)) (comb (drop-right s 1)))))))

(let* ((s (read-line)))
  (print (length (delete-duplicates (comb (string->list s))))))
