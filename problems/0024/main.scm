(use scheme.set)

(define (read-number)
  (string->number (read-line)))

(define (solve matrix)
  (define neg-set (set eq-comparator))
  (define pos-set (apply set eq-comparator (iota 10)))

  (dolist (l (filter (lambda (line)
		       (eqv? (last line) 'NO)) matrix))
	  (list->set! neg-set (take l 4)))

  (dolist (l (filter (lambda (line)
		       (eqv? (last line) 'YES)) matrix))
	  (set-intersection! pos-set (list->set eq-comparator (take l 4))))
  (car (filter (lambda (n) (and (set-contains? pos-set n)
			   (not (set-contains? neg-set n)))) (iota 10))))

(let* ((n (read-number))
       (matrix
	(map (lambda (_) (map (lambda (_) (read)) (iota 5))) (iota n))))

  (print (solve matrix)))
