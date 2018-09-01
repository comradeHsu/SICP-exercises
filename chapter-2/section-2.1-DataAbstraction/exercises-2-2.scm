(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))

(define make-segment cons)

(define start-segment car)

(define end-segment cdr)

;;
(define make-point cons)

(define x-point car)

(define y-point cdr)


;;
(define average
  (lambda (x y)
    (/ (+ x y) 2)))

(define midpoint-segment
	(lambda(seg)
		(make-point (average (x-point (start-segment seg))
						(x-point (end-segment seg)))
			(average (y-point (start-segment seg))
						(y-point (end-segment seg))))))

;;test

(define start (make-point 2 4))

(define end (make-point 16 64))

(define seg (make-segment start end))

(define (test)
	(print-point (midpoint-segment seg)))