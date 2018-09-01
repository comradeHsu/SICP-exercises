(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons (square (car things)) answer))))
	(iter items nil))
;;设items (list 1 2 3)
;;=> (cons (square 1) nil)
;;=> (cons (square 2) (cons (square 1) nil))...
;;=>(3 2 1)


(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons answer (square (car things))))))
	(iter items nil))
;;设items (list 1 2 3)
;;=> (cons nil (square 1))
;;=> (cons (cons nil (square 1)) (square 2))
;;=> (cons (cons (cons nil (square 1)) (square 2)) (square 3))
;;=> (cons (cons ((). 1) 4) 9)
;;=> (cons ((().1).4) 9)
;;=> (((() . 1) . 4) . 9)
