(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
		(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (check n)
	(rurse-test n (- n 1)))

(define (rurse-test n count)
	(cond ((= count 1) #t)
		((test count n) (rurse-test n (- count 1)))
		(else #f)))

(define (test count n)
	(define (try-it)
		(= (expmod count n n) count))
	(try-it))

(define (square x)
	(* x x))

(define (even? n)
	(= (remainder n 2) 0))