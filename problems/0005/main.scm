(define (solve l arr)
  (if (or (null? arr) (< l (car arr)))
      0
      (let ((top (car arr)))
	(+ 1 (solve (- l top) (cdr arr))))))

(let* ((l (string->number (read-line)))
       (n (string->number (read-line)))
       (arr (map string->number (string-split (read-line) #\space))))
  (print (solve l (sort arr))))
