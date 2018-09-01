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

;;这里使用list-copy过程，否则append!会影响到data	
(define (adjoin-position row cloumn data)
		(append! (list-copy data) (list row)))
	
(define empty-board '())

(define (safe? k positions)
	(let ([position (list-ref positions (- k 1))])
		(define (iter-compare index)
			(if (= index k)
				#t
				(let ([index-position (list-ref positions (- index 1))]
					[difference (- k index)])
					(if (or (= position index-position) 
							(= (+ position difference) index-position) 
							(= (- position difference) index-position))
						#f
						(iter-compare (+ index 1))))))
		(iter-compare 1)))