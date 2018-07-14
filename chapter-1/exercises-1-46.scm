(define (sqrt x)
	(define (good-enough? guess)
		(< (abs (- (square guess) x)) 0.001))
	(define (improve guess)
		(average guess (/ x guess)))
	(define (sqrt-iter guess)
		(if (good-enough? guess)
			guess
			(sqrt-iter (improve guess))))
	(sqrt-iter 1.0))

(define (square x)
	(* x x))

(define (average x y)
	(/ (+ x y) 2))

(define (iterative-improve func test-func)
	(lambda(x) 
		(define (try guess)
			(if (test-func guess)
				guess)
			(try (func guess)))
		(try x)))

;;
(define (sqrt-an x)
	(define (good-enough? guess)
		(< (abs (- (square guess) x)) 0.001))
	(define (improve guess)
		(average guess (/ x guess)))
	((iterative-improve improve good-enough?) 1.0))