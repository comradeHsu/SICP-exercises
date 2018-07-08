(define (double func)
	(lambda(x) (func (func x))))

(define (inc x)
	(+ x 1))