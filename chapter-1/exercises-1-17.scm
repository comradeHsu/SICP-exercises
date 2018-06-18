
(define (even? n)
	(= (remainder n 2) 0))

(define (x a b)
	(if (= b 0)
	0
	(+ a (x a (- b 1)))))

(define (fast-x a b)
	(cond ((= b 0) 0)
	((even? b) (double (fast-x a (halve b))))
	(else (+ a (fast-x a (- b 1))))))

(define (double data)
	(+ data data))

(define (halve data)
	(/ data 2))
