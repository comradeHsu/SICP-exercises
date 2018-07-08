(load "exercises-1-42.scm")

(define (repeated func n)
	(lambda(x) 
		(if (= n 1)
			(func x)
			(repeated (compose func func) (- n 1)))))

(define (square x)
	(* x x))