(load "exercises-2-7.scm")

(load "exercises-2-12.scm")

(define (par1 r1 r2)
	(div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
	(let ((one (make-interval 1 1)))
		(div-interval one 
			(add-interval (div-interval one r1)
				(div-interval one r2)))))

(define (test r1 r2)
	(mul-interval (mul-interval r1 r2)
		(div-interval r1 r2)))

(define (test1 r1 r2)
	(mul-interval r1 r1))

;;when r1(2 3) r2(3 4)
;;test (3 12)
;;test1 (4 9)
