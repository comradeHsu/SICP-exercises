
(define (tan-cf x k)
	(define (tan-iter c result)
		(let ((num (- (* c 2) 1)))
		(if (= c 0)
			result
			(if (= c 1)
				(tan-iter (- c 1) (/ x (- num result)))
				(tan-iter (- c 1) (/ (* x x) (- num result)))))))
	(tan-iter k 0.0))