(define (same-parity x . var)
	(let ([boolean (double-num x)]
		  [var-length (- (length var) 1)])
		(define (iter temp len)
			(let ([y (list-ref var len)]
				[bool-len (double-num (list-ref var len))])
			(if (= len var-length)
				(if (eqv? boolean bool-len)
					(append temp (make-list 1 y))
					temp)
				(if (eqv? boolean bool-len)
					(iter (append temp (make-list 1 y)) (+ len 1))
					(iter temp (+ len 1))))))
	(iter (make-list 1 x) 0)))

(define (double-num x)
	(= (remainder x 2) 0))

(define (test a)
	(let ([x 5] [y (+ x 4)])
		(+ a y)))