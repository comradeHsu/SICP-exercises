(load "exercises-1-21.scm")

(define (timed-prime-test n)
	(newline)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (fast-prime? n 1)
		(report-prime (- (runtime) start-time))
		(search-for-primes (+ n 2))))

(define (report-prime elapsed-time)
	(display "***")
	(display elapsed-time))

(define (prime? n)
	(= n (smallest-devisor n)))

(define (search-for-primes n)
	(timed-prime-test n))

(define (runtime)
        (time-nanosecond (current-time)))
		
(define (fast-prime? n times)
	(cond ((= times 0) #t)
		((format-test n) (fast-prime? n (- times 1)))
		(else #f)))
		
(define (format-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))
	
(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
		(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (even? n)
	(= (remainder n 2) 0))
;;10001:5500
;;100000001:11000