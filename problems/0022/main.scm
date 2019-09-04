(use data.queue)

(let* ((pair (map string->number (string-split (read-line) #\space)))
       (k (cadr pair))
       (s (read-line)))

  (print
   (let loop ((chars (string->list s))
	      (i 1)
	      (stack (make-queue)))
     (cond
      ((eqv? (car chars) #\()
       (queue-push! stack i)
       (loop (cdr chars) (+ i 1) stack))
      ((eqv? (car chars) #\))
       (let1 popped (queue-pop! stack)
	     (cond ((= popped k) i)
		   ((= i k) popped)
		   (else
		    (loop (cdr chars) (+ i 1) stack)))))))))
