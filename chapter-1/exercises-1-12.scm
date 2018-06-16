(define (getPaskEle x y)
	(if (or(= x 1) (= x y))  1
		(+ (getPaskEle (- x 1) (- y 1)) (getPaskEle x (- y 1)))))
