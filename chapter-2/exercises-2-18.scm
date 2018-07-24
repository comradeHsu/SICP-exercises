(define (reverse var)
	(define (iter temp len)
		(if (= len 0)
			(append temp (make-list 1 (list-ref var len)))
			(iter (append temp (make-list 1 (list-ref var len))) (- len 1))))
	(iter '() (- (length var) 1)))

;;another

(define (rever var)
	(define (iter temp index len)
		(if (= len 0)
			(list-set! temp index (list-ref var len))
			(iter (list-set! temp index (list-ref var len)) (+ index 1) (- len 1))))
	(iter (make-list (length var) 0) 0 (- (length var) 1)))