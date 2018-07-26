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

;;(define (list-set! list-data n value)
;;	(let ([vector-data (list->vector list-data)])
;;		(vector-set! vector-data n value)
;;		(set! list-data (vector->list vector-data))
;;		(display list-data)))
;;直接在函数里面改变list-data参数的指针不行，原来的list-data不受影响，此处传递的还是指针的值的拷贝	

(define (list-set! list-data n value)
	(define (iter data step)
		(if (= step 0)
			(set-car! data value)
			(iter (cdr data) (- step 1))))
	(iter list-data n))
