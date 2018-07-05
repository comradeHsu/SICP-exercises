;;a

(define (cont-frac n d k)
	(define (frac-iter c result)
		(if (= c 1) 
			1.0
			(frac-iter (- c 1) (/ (n c) (+ (d c) result)))))
	(frac-iter k 0))

(define (cont-frac n d k)
	(define (frac-iter c)
		(if (> c k)
			0
			(/ (n c) (+ (d c) (frac-iter (+ c 1))))))
	(frac-iter 1.0))