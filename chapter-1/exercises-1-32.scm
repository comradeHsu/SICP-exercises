
;;a 递归过程

(define (accumulate combiner null-value term a next b)
	(if (> a b) null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b))))

;;b 迭代过程

(define (accumulate-iter combiner null-value term a next b)
	(define (iter x result)
		(if (> x b) 
			result
			(iter (next x) (combiner result (term x)))))
	(iter a null-value))

;;validate code

(define (combiner a b)
	(+ a b))

(define (term a)
	(* a a))

(define (next a)
	(+ a 1))