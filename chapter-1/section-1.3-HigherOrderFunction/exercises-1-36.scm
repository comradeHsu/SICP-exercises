(define tolerance 0.00001)

;;(let ((<var1><exp1>)...)
;;	<body>))

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(newline)
		(display (+ 0.0 guess))
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

;;使用平均阻尼
(fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 2)

;;使用非平均阻尼
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
