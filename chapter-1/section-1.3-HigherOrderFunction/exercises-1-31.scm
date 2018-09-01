
;;a 递归过程
(define (product fun a next b)
	(if (> a b) 1
		(* (fun a) (product fun (next a) next b))))

(define (handle a)
	(if (even? a) 
		(/ (+ a 2) (+ a 1))
		(/ (+ a 1) (+ a 2))))
	
(define (even? a)
	(= (remainder a 2) 0))
	
(define (next a)
	(+ a 1))
	
(define (pie n)
	(* (product handle 1 next n) 4))
	
;;b 迭代过程
(define (product-iter fun a next b)
	(define (iter a result)
		(if (> a b) 1
			(iter (next a) (* result (fun a)))))
	(iter a 1))
