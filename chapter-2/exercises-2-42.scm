(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter 
				(lambda(positions) (safe? k positions))
				(flatmap
					(lambda(rest-of-queens)
						(map (lambda(new-row)
								(adjoin-position new-row k rest-of-queens))
						(enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
	(queen-cols board-size))

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
	
(define (adjoin-position row cloumn data)
	(display data)
	(if (null? (car data))
		(list (list cloumn row))
		(append data (list cloumn row))))
	
(define empty-board '())

(define (safe? k positions)
	(let ([position (list-ref positions k)])
		(define (iter-compare index)
			(if (= index k)
				#t
				(let ([index-position (list-ref positions index)]
					[difference (- k index)])
					(if (or (= (cdr position) (cdr index-position)) 
							(= (+ (cdr position) difference) (cdr index-position)) 
							(= (- (cdr position) difference) (cdr index-position)))
						#f
						(iter-compare (+ index 1))))))
		(iter-compare 0)))