(define (recursion n)
	(cond ((< n 3) n)
		(else (+ (recursion (- n 1)) 
			(* (recursion (- n 2)) 2) 
			(* (recursion (- n 3)) 3)))))


(define (recurs-iter a b c n)
	(if (= n 0)
	a
	(recurs-iter b c (+ (* a 3) (* b 2) c) (- n 1))))

(define (recurs n)
	(recurs-iter 0 1 2 n))
