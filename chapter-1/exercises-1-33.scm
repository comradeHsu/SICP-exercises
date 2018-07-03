
;; 递归过程

(define (filtered-accumulate combiner filter null-value term a next b)
	(if (> a b) null-value
		(if (filter a)
		(combiner (term a) (filtered-accumulate combiner filter null-value term (next a) next b))
		(filtered-accumulate combiner filter null-value term (next a) next b))))

;; 迭代过程

(define (filtered-accumulate-iter combiner filter null-value term a next b)
	(define (iter x result)
		(if (> x b) 
			result
			(if (filter x)
			(iter (next x) (combiner result (term x)))
			(iter (next x) result))))
	(iter a null-value))

;;a

(define (prime? n)
	(= n (smallest-devisor n)))

(define (smallest-devisor n)
	(find-divisor n 2))

(define (find-divisor n test)
	(cond ((> (square test) n) n)
		((divides? test n) test)
		(else (find-divisor n (+ test 1)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (square x)
	(* x x))

(define (combiner a b)
	(+ a b))

(define (next a)
	(+ a 1))

(define (sum-prime a b)
	(filtered-accumulate combiner prime? 0 
		(lambda(x) x) a next b))

;; b

(define (filtered-accumulate-iter-b combiner filter null-value term a next b)
	(define (iter x result)
		(if (> x b) 
			result
			(if (filter x b)
			(iter (next x) (combiner result (term x)))
			(iter (next x) result))))
	(iter a null-value))

(define (coprime? a n)
	(= (common-factor a n) 1))

(define (common-factor a b)
	(if (= b 0)
		a
		(common-factor b (remainder a b))))

(define (multi-coprime a b)
	(filtered-accumulate-iter-b (lambda(c d) (* c d))
		coprime? 1 (lambda(x) x) a next b))