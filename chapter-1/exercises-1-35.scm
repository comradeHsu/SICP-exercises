;;1.34
(define (f g) (g 2))
;;当调用(f f)时程序会解释为(f 2)=>(2 2),程序会报错,因为2不是一个运算符

;;1.35
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
