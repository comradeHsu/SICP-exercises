(define (improve guess x)
	(/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (cube guess) x)) 0.001))

(define (cube x)
	(* x x x))

(define square(lambda(x) (* x x)))

(define (cubeRoot-iter guess x)
	(cond ((good-enough? guess x)
		guess)
		(else (cubeRoot-iter (improve guess x) x))))

(define (cubeRoot x)
	(cubeRoot-iter 1.0 x))
