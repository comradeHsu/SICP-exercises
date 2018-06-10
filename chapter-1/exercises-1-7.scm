(define (new-if predicate then-clause else-clause)
	(cond (predicate then-caluse)
		(else else-caluse)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess next)
	(< (abs (- guess next)) 0.01))

(define (square x)
	(* x x))

(define (sqrt-iter guess x)
	(cond ((good-enough? guess (improve guess x))
		guess)
		(else (sqrt-iter (improve guess x) x))))

(define (sqrt x)
	(sqrt-iter 1.0 x))
;;当猜测的值与下一次猜测的值相差很小的时候sqrt函数也可以正常工作
;;只是当要求根的数太小的时候sqrt函数无法正常工作
