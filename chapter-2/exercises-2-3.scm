(load "exercises-2-2.scm")

;;
(define start-top (make-point 0 0))

(define end-top (make-point 8 0))

(define seg-top (make-segment start-top end-top))

(define start-bottom (make-point 0 4))

(define end-bottom (make-point 8 4))

(define seg-bottom (make-segment start-bottom end-bottom))

;;construct
(define make-rectangle cons)

(define top car)

(define bottom cdr)

(define rect (make-rectangle seg-top seg-bottom))

(define (perimeter rectangle)
	(* (+ (high rectangle)
		(width rectangle))
	 2))

(define (area rectangle)
	(* (high rectangle)
		(width rectangle)))

(define (high rectangle)
	(abs (- (y-point (car (car rectangle)))
		(y-point (car (cdr rectangle))))))

(define (width rectangle)
	(abs (- (x-point (cdr (cdr rectangle)))
		(x-point (car (car rectangle))))))

;;
;;another

(define start-len (make-point 8 0))

(define end-len (make-point 0 0))

(define length (make-segment start-len end-len))

(define start-wid (make-point 0 4))

(define end-wid (make-point 0 0))

(define wid (make-segment start-wid end-wid))

(define rectangle (cons length wid))