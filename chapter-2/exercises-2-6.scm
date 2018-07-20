(define zero (lambda(f) (lambda(x) x)))

(define (add-1 n)
	(lambda(f) (lambda(x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))
 
(define two
  (lambda (f) (lambda (x) (f (f x)))))

;;有谁说过只有符号0才代表数字“零”呢？一个空空的口袋不能代表“零”吗？ 
;;又有谁说过只有符号1才代表数字“壹”呢？在苍茫大地上孤独行走的我不能代表“壹”吗？

;;丘奇计数的基本想法就是通过调用0次函数来表示0，通过调用1次函数来表示1，以此类推。。。