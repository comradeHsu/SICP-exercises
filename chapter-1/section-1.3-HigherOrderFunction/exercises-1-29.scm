(define (integral f a b dx)
	(define (add-dx x) (+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-square a b)
	(sum square a inc b))

(define (square n) (* n n))

;;
(define (simpson f a b n)
	(define h (/ (- b a) n))
	(define (next x k) (+ a (* k h)))
	(* (sum-simpson f a next 0 n) (/ h 3)))

(define (sum-simpson term a next k n)
	(define (xishu)
		(cond ((or (= k 0) (= k n)) 1)
			((even? k) 2)
			(else 4)))
	(if (> k n)
		0
		(+ (* (xishu) (term a)) (sum-simpson term (next a (+ k 1)) next (+ k 1) n))))

(define (even? n)
	(= (remainder n 2) 0))

(define cube(lambda(x) (* x x x)))