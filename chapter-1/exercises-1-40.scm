(define dx 0.00001)

(define (deriv g)
	(lambda(x)
		(/ (- (g (+ x dx)) (g x))
			dx)))

(define (newton-transform g)
	(lambda(x)
		(- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
	(fixed-point (newton-transform g) guess))

(define tolerance 0.00001)

;;(let ((<var1><exp1>)...)
;;	<body>))

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))


(define (cubic a b c) 
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))