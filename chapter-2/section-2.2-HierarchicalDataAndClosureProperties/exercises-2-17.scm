(define (length items)
	(define (length-iter a count)
		(if (null? a)
			count
			(length-iter (cdr a) (+ 1 count))))
	(length-iter items 0))

(define (lastPair var)
	(let ((len (length var)))
		(list-ref var (- len 1))))

;;last-pair 在chezScheme里已经有了实现，返回list中的最后一个元素
