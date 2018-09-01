(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

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
		   
(define (unique-triples n)
   (flatmap (lambda (i)
        (map (lambda (j)
            (cons i j))
                (unique-pairs (- i 1))))
        (enumerate-interval 1 n)))
		   
(define (fold-right op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) 
			(fold-right op initial (cdr sequence)))))
		   
(define (triples-sum? triples s)
	(= s (fold-right + 0 triples)))
	
(define (filter-triples s triples)
    (filter (lambda (x)
        (triples-sum? x s))
        triples))
		
(define (finalFunc s)
	(filter-triples s (unique-triples s)))