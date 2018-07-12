
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

(define (average-damp f)
	(lambda(x) (average x (f x))))

(define (average x y)
	(/ (+ x y) 2))


(define (repeated func n)
	(define (inner f cur)
		(if (< cur n)
			(compose f (inner f (+ cur 1)))
			f))
	(inner func 1))

(define (compose funca funcb)
	(lambda(x) (funca (funcb x))))

;;
(define (sqrt-n x n)
	(let ((frequency (if (< n 3)
		1
		(- n 2))))
	(fixed-point (repeated (average-damp (lambda(y) (/ x (expt y (- n 1)))))  frequency) 1.0)))

(define (log-n x n)
	(let ((frequency (log n)))
	(fixed-point (repeated (average-damp (lambda(y) (/ x (expt y (- n 1)))))  frequency) 1.0)))
