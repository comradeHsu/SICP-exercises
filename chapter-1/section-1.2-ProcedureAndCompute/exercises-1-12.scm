(define (getPaskEle x y)
	(if (or(= x 1) (= x y))  1
		(+ (getPaskEle (- x 1) (- y 1)) (getPaskEle x (- y 1)))))

(define paska
	(lambda(n) 
		(define data(make-vector n 1))
		(paska-iter 1 n data)))

(define (paska-iter x n data)
	(vector-set! data (- x 1) (getPaskEle x n))
	(if (= x n) data
	(paska-iter (+ x 1) n data)))
