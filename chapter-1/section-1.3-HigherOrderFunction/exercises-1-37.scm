;;a
;;迭代过程
(define (cont-frac-iter n d k)
	(define (frac-iter c result)
		(if (= c 0) 
			result
			(frac-iter (- c 1) (/ (n c) (+ (d c) result)))))
	(frac-iter k 0.0))

;;递归过程
(define (cont-frac n d k)
	(define (frac-iter c)
		(if (> c k)
			0
			(/ (n c) (+ (d c) (frac-iter (+ c 1))))))
	(frac-iter 1.0))
