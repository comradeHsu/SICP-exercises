(load "exercises-2-7.scm")

(define (div-interval x y)
  (if (< (* (upper-bound y) (lower-bound y)) 0)
      (errorf "this argment" "Div 0:~s" y))
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))