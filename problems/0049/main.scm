(use data.queue)

(let ((s (read-line)))

  (print
   (let loop ((chars (string->list s))
	      (stack (make-queue))
	      (tmp 0))
     (cond ((null? chars)
	    (cond ((queue-empty? stack) (queue-push! stack tmp))
		  (else
		   (let1 op (queue-pop! stack)
			 (queue-push! stack #?=((if (eqv? op #\+) * +) (queue-pop! stack) tmp)))))
	    (queue-pop! stack))
	   (else
	    (let1 char (car chars)
		  (cond ((char-numeric? char)
			 (loop (cdr chars) stack (+ (* 10 tmp) (digit->integer char))))
			(else
			 (cond ((queue-empty? stack) (queue-push! stack tmp))
			       (else
				(let1 op (queue-pop! stack)
				      (queue-push! stack #?=((if (eqv? op #\+) * +) (queue-pop! stack) tmp)))))
			 (queue-push! stack char)
			 (loop (cdr chars) stack 0)))))))))
