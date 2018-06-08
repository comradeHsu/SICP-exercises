(define (new-if predicate then-clause else-clause)
	(cond (predicate then-caluse)
		(else else-caluse)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (square x)
	(* x x))

(define count 1)

(define (sqrt-iter guess x)
;;书中的代码是没有以下两行的，这两行是验证代码陷入了无限递归
	(set! count (+ count 1))
	(display count)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)))

;;(define (sqrt-iter guess x)
;;	(cond ((good-enough? guess x)
;;		guess)
;;		(else (sqrt-iter (improve guess x) x))))

(define (sqrt x)
	(sqrt-iter 1.0 x))
;;当我们调用sqrt函数时，由于new-if定义为了一个过程并且scheme是采用应用序来求值
;;所以对new-if过程的3个参数求值，其中第三个参数也是一个过程(sqrt_iter (improve guess x) x)) 递归调用自身，导致无限循环直到栈溢出
;;其实就算是scheme是正则序来求值，正则序完全展开时，会忽略条件，一直展开只至展开到基本元素，所以遇到由条件判断结束的递归就没法结束
;;所以这里无论是正则序还是应用序都要陷入无限的递归
