;;a
(define (product fun a next b)
	(if (> a b) 0
		(* (fun a) (product fun (next a) next b))))

(define (pie a b)
	())