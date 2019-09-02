(define (solve s)
  (define (aux i s)
    (if (null? s)
	'()
	(let* ((c (car s))
	       (shift (+ (modulo (- (+ (- (char->integer c) (char->integer #\A)) 26) i) 26)
			 (char->integer #\A))))
	  (cons (integer->char shift) (aux (+ i 1) (cdr s))))))
  (list->string (aux 1 (string->list s))))

(let* ((s (read-line)))
  (print (solve s)))
