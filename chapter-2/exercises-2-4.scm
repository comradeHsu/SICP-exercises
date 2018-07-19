(define (cons x y)
	(lambda(m) (m x y)))

(define (car z)
	(z (lambda(p q) p)))

;;equals
(define (car (lambda(m) (m x y)))
	(lambda(m) (m x y)) (lambda(p q) p))

;;and next

(define (car (lambda(m) (m x y)))
	((lambda(p q) p) x y))

;; and next

(define (car (lambda(m) (m x y)))
	(define (so p q)
		p)
	(so (x y))