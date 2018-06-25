(load "exercises-1-21.scm")

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (current-time)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (current-time) start-time))
		(search-for-primes (+ n 2))))

(define (report-prime elapsed-time)
	(display "***")
	(display elapsed-time))

(define (prime? n)
	(= n (smallest-devisor n)))

(define (search-for-primes n)
	(timed-prime-test n))
