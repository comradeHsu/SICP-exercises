;;
(define (fast-expt b n)
	(cond ((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

(define (even? n)
	(= (remainder n 2) 0))

(define (square x)
	(* x x))

;;
(define (iter-expt b n)
	(expt-iter b n 1))

;;(define (expt-iter b n sum)
;;	(cond ((= n 0) sum)
;;		((even? n) (expt-iter b (- n 2) (* sum (square b))))
;;		(else (* b (expt-iter b (- n 1) sum)))))

(define (expt-iter b n sum)
	(cond ((= n 0) 1)
		((= n 1) (* b sum))  
		((even? n) (expt-iter (square b) (/ n 2) sum))
		(else ((expt-iter b (- n 1) (* b sum))))))
