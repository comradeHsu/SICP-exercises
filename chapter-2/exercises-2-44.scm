(define (right-spilit painter n)
	(if (= n 0)
		painter
		(let ([smaller (right-spilit painter (- n 1))])
			(beside painter (below smaller smaller)))))

(define (corner-spilit painter n)
	(if (= n 0)
		painter
		(let ([up (up-spilit (- n 1))]
			[right (right-spilit painter (- n 1))])
			(let ([top-left (beside up up)]
				[bottom-right (below right right)]
				[corner (corner-spilit painter (- n 1))])
				(beside (below painter top-left)
					(below bottom-right corner))))))
					
(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (below painter
                (beside smaller smaller)))))