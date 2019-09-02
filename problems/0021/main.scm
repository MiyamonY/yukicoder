(define (solve k arr)
  (define max (last arr))
  (define min (car arr))
  (- max min))

(let* ((n (string->number (read-line)))
       (k (string->number (read-line)))
       (arr (map (lambda (_) (string->number (read-line))) (iota n))))
  (print (solve k (sort arr))))
