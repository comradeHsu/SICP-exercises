(define (smallest-devisor n)
	(find-divisor n 2))

(define (find-divisor n test)
	(cond ((> (square test) n) n)
		((divides? test n) test)
		(else (find-divisor n (next test)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (square x)
	(* x x))
	
(define (next test)
	(if (= test 2)
	(+ test 1)
	(+ test 2)))
	
(define (timed-prime-test n)
	(newline)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (prime? n)
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
;;1001:1900