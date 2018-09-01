(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((not-square-root? base m) 0)
		((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
		(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (check n)
	(fast-prime? n 3))

(define (fast-prime? n times)
	(cond ((= times 0) #t)
		((format-test n) (fast-prime? n (- times 1)))
		(else #f)))
		
(define (format-test n)
	(define (try-it a)
		(= (expmod a (- n 1) n) 1))
	(try-it (+ 1 (random (- n 1)))))

(define (square x)
	(* x x))

(define (even? n)
	(= (remainder n 2) 0))

(define (not-square-root? x n)
	(and (not (= x 1))
		(not (= x (- n 1)))
	(= 1 (remainder (square x) n))))