(define (smallest_devisor n)
	(find-divisor n 2))

(define (find-divisor a test)
	(cond ((> (square test) n) n)
		(divides? test n) test)
		(else (find-divisor n (+ test 1))))

(define (divides? a b)
	(= (remainder b a) 0))
