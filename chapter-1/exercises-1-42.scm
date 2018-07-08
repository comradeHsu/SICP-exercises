(define (compose funca funcb)
	(lambda(x) (funca (funcb x))))