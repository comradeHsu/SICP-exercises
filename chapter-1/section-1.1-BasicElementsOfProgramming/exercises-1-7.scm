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

(define (sqrt-1 x)
	(define (goodEnough? guess)
		(< (abs (- (square guess) x)) 0.001))
	(define (improve-1 guess)
		(average guess (/ x guess)))
	(define (sqrt-iter guess)
		(if (goodEnough? guess)
			guess
			(sqrt-iter (improve-1 guess))))
	(sqrt-iter 1.0))
;;sqrt-1函数与sqrt函数的功能相同，sqrt-1使用块结构改写
