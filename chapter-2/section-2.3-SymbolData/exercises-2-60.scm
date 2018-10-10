(define (element-of-set? x set)
	(cond ((null? set) #f)
		((equal? x (car set)) #t)
		(else (element-of-set x (cdr set)))))
		
(define (adjoin-set x set)
    (cons x set))
	
(define (union-set set1 set2)
    (iter (append set1 set2) '()))

(define (iter input result)
    (if (null? input)
        (reverse result)
        (let ((current-element (car input))
              (remain-element (cdr input)))
            (if (element-of-set? current-element result)
                (iter remain-element result)
                (iter remain-element
                      (cons current-element result))))))
					  
(define (intersection-set set another)
    (define (iter set result)
        (if (or (null? set) (null? another))
            (reverse result)
            (let ((current-element (car set))
                  (remain-element (cdr set)))
                (if (and (element-of-set? current-element another)
                         (not (element-of-set? current-element result)))
                    (iter remain-element
                          (cons current-element result))
                    (iter remain-element result)))))
    (iter set '()))
	
	
;;以下是有重复元素集合和无重复元素集合的几个函数的复杂度对比：

;;函数	element-of-set?	adjoin-set	union-set	intersection-set
;;无重复	Θ(n)	Θ(n)	Θ(n2)	Θ(n2)
;;有重复	Θ(n)	Θ(1)	Θ(n2)	Θ(n2)
;;是否可以共用	是	不是	是	不是
;;可以看出，在复杂度方面，有重复元素集合的 adjoin-set 比无重复元素集合的 adjoin-set 要低一个量级，除此之外，两个版本的其他操作的复杂度都是一样的。

;;不过尽管如此，在有重复元素的集合进行 element-of-set? 、 union-set 和 intersection-set ，算法的系数会比无重复元素的集合要高，随着重复元素的不断增多，带重复元素的集合进行以上三个操作将会越来越慢。

;;因此，对于插入操作频繁的应用来说，可以使用有重复元素的集合，而对于频繁进行查找、交集、并集这三个操作的应用来说，使用无重复元素的集合比较好。