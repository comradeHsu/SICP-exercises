;;remainder 是求余数
(define (even? n)
	(= (remainder n 2) 0))

(define (double data)
	(+ data data))

(define (halve data)
	(/ data 2))

(define (iter-x a b)
	(x-iter a b 0))

(define (x-iter a b sum)
	(cond ((= b 0) 0)
		((= b 1) (+ a sum))
		((even? b) (x-iter (double a) (/ b 2) sum))
		(else (x-iter a (- b 1) (+ a sum)))))
