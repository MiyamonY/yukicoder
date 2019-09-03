(define (read-number)
  (string->number (read-line)))

(let* ((n (read-number))
       (arr (map (lambda (_)
		   (define a (read))
		   (define b (symbol->string (read)))
		   (cons a b))
		 (iota n)))
       (total-length
	(fold + 0 (map (lambda (x) (string-length (cdr x))) arr)))
       (count-success
	(fold + 0 (map (lambda (x)
			 (min (div (* 12 (car x)) 1000) (string-length (cdr x)))) arr) )))

  (format #t "~a ~a\n" count-success (- total-length count-success)))
