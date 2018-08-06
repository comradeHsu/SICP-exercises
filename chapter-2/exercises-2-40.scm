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

(define (prime? n)
	(= n (smallest-devisor n)))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum?
			(flatmap (lambda(i) (map (lambda(j) (list i j))
				(enumerate-interval 1 (- i 1))))
			(enumerate-interval 1 n)))))

(define (enumerate-interval s e)
	(define (iter index result)
		(if (> index e)
			result
			(iter (+ index 1) (append result (list index)))))
	(iter s '()))

(define (unique-pairs n)  
  (flatmap (lambda (i)   
             (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))  
           (enumerate-interval 2 n)))

;;
(define (prime-sum-pairs-another n)  
  (map make-pair-sum  
       (filter prime-sum? (unique-pairs n))))