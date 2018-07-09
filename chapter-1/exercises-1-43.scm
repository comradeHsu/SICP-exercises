(load "exercises-1-42.scm")

(define (repeated func n)
	(define (inner f cur)
		(if (< cur n)
			(compose f (inner f (+ cur 1)))
			f))
	(inner func 1))

(define (square x)
	(* x x))