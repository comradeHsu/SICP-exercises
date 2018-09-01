(load "exercises-1-43.scm")

(define dx 0.01)

(define (smooth f)
	(lambda(x)
		(/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (multi-smooth f n)
	((repeated smooth n) f))

;;解这道题不要纠结于平滑函数的数学定义，按照题目定义的平滑函数p(x)等于
;;f(x),f(x-dx),f(x+dx)三者的平均值来就行了
