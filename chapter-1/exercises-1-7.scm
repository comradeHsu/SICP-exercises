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

(define count 1)

;;(define (sqrt-iter guess x)
;;	(set! count (+ count 1))
;;	(display count)
;;	(new-if (good-enough? guess x)
;;		guess
;;		(sqrt-iter (improve guess x) x)))

(define (sqrt-iter guess x)
	(cond ((good-enough? guess (improve guess x))
		guess)
		(else (sqrt-iter (improve guess x) x))))

(define (sqrt x)
	(sqrt-iter 1.0 x))
