(define (right-spilit painter n)
	(if (= n 0)
		painter
		(let ([smaller (right-spilit painter (- n 1))])
			(beside painter (below smaller smaller)))))

(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (below painter
                (beside smaller smaller)))))
				
(define right-spilit (split beside below))

(define up-split (split below beside))

(define (split big small)
	(lambda(painter n)
		(if (= n 0)
			painter
			(let ([smaller ((split big small) painter (- n 1))])
				(big painter (small smaller smaller))))