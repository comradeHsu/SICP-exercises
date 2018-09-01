(load "exercises-1-37.scm")

(define (getValue i)
	(if (= (remainder (+ i 1) 3) 0)
		(* (/ (+ i 1) 3) 2)
		1))

(define (test k)
	(cont-frac (lambda(i) 1.0) getValue k))