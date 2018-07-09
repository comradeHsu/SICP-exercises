(load "exercises-1-43.scm")

(define dx 0.01)

(define (smooth f)
	(lambda(x)
		(/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (multi-smooth f n)
	((repeated smooth n) f))