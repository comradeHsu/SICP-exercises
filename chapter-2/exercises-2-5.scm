(define (cons a b)
	(* (expt 2 a) (expt 3 b)))

(define (car x)
  (define (iter counter number-left)
    (if (= (remainder number-left 2) 0)
	(iter (+ counter 1) (/ number-left 2))
	counter))
 (iter 0 x))


(define (cdr x)
  (define (iter counter number-left)
    (if (= (remainder number-left 3) 0)
	(iter (+ counter 1) (/ number-left 3))
	counter))
  (iter 0 x))