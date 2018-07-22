(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
		(+ (upper-bound x) (upper-bound y))))

;;(upper-bound x) - (lower-bound x) = a
;;(upper-bound y) - (lower-bound y) = b

;;(+ (upper-bound x) (upper-bound y)) - (+ (lower-bound x) (lower-bound y))
;;=(upper-bound x)+(upper-bound y)-(lower-bound x)-(lower-bound y)
;;=a+b