(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
	(list entry left right))
	
(define (element-of-set? x set)
	(cond ((null? set) #f)
		((= x (entry set)) #t)
		((< x (entry set))
			(element-of-set? x (left-branch set)))
		((> x (entry set))
			(element-of-set? x (right-branch set)))))
			
(define (adjoin-set x set)
	(cond ((null? set) (make-tree x '() '()))
		((= x (entry set)) set)
		((< x (entry set))
			(make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
		((> x (entry set))
			(make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))))
			
(define (tree->list-1 tree)
	(if (null? tree)
		'()
		(append (tree->list-1 (left-branch tree))
			(cons (entry tree) (tree->list-1 (right-branch tree))))))
			
(define (tree->list-2 tree)
	(define (copy-to-list tree result-list)
		(if (null? tree)
			result-list
			(copy-to-list (left-branch tree)
				(cons (entry tree) (copy-to-list (right-branch tree) result-list)))))
	(copy-to-list tree '()))
	
;;exercises-a
(define tree-a (make-tree 7 (make-tree 3 (make-tree 1 '() '()) (make-tree 5 '() '())) 
	(make-tree 9 '() (make-tree 11 '() '()))))

(define tree-b (make-tree 3 (make-tree 1 '() '()) 
	(make-tree 7 (make-tree 5 '() '()) (make-tree 9 '() (make-tree 11 '() '())))))

(define tree-c (make-tree 5 (make-tree 3 (make-tree 1 '() '()) '()) 
	(make-tree 9 (make-tree 7 '() '()) (make-tree 11 '() '()))))
	
;;通过测试可以看出，对于同一棵树， tree->list-1 和 tree->list-2 都生成同一个列表。
;;对于不同形状但是包含的元素相同的多棵树， tree->list-1 和 tree->list-2 也都生成同一个列表。

;;exercises-b
;;对于 tree->list-1 ，如果给定树 a ，那么计算过程的展开如下：
;;(tree->list-1 (list 7
;;                    (list 3
;;                          (list 1 '() '())
;;                          (list 5 '() '()))
;;                    (list 9
;;                          '()
;;                          (list 11 '() '()))))

;;(append (tree->list-1 (list 3
;;                            (list 1 '() '())
;;                            (list 5 '() '())))
;;        (cons 7
;;              (tree->list-1 (list 9
;;                                  '()
;;                                  (list 11 '() '())))))
;;
;;(append (append (tree->list-1 (list 1 '() '()))
;;                (cons 3
;;                      (tree->list-1 (list 5 '() '()))))
;;        (cons 7
;;              (tree->list-1 (list 9
;;                                  '()
;;                                  (list 11 '() '())))))
;;
;;(append (append (append (tree->list-1 '())
;;                        (cons 1
;;                              (tree->list-1 '())))
;;                (cons 3
;;                      (tree->list-1 (list 5 '() '()))))
;;        (cons 7
;;              (tree->list-1 (list 9
;;                                  '()
;;                                  (list 11 '() '())))))
;;
;;(append (append (append '()
;;                        (cons 1 '()))
;;                (cons 3
;;                      (tree->list-1 (list 5 '() '()))))
;;        (cons 7
;;              (tree->list-1 (list 9
;;                                  '()
;;                                  (list 11 '() '())))))

;;(append (append (append '()
;;                       (cons 1 '()))
;;                (cons 3
;;                      (append (tree->list-1 '())
;;                              (cons 5
;;                                   (tree->list-1 '())))))
;;        (cons 7
;;              (tree->list-1 (list 9
;;                                  '()
;;                                  (list 11 '() '())))))
;;
;;(append (append (append '()
;;                        (cons 1 '()))
;;                (cons 3
;;                      (append '()
;;                              (cons 5 '()))))
;;        (cons 7
;;              (tree->list-1 (list 9
;;                                  '()
;;                                  (list 11 '() '())))))

;;(append (append (append '()
;;                        (cons 1 '()))
;;                (cons 3
;;                      (append '()
;;                             (cons 5 '()))))
;;        (cons 7
;;              (append (tree->list-1 '())
;;                     (cons 9
;;                            (tree->list-1 (list 11 '() '()))))))

;;(append (append (append '()
;;                        (cons 1 '()))
;;                (cons 3
;;                      (append '()
;;                              (cons 5 '()))))
;;        (cons 7
;;              (append '()
;;                      (cons 9
;;                            (append (tree->list-1 '())
;;                                    (cons 11
;;                                          (tree->list-1 '())))))))

;;(append (append (append '()
;;                        (cons 1 '()))
;;                (cons 3
;;                      (append '()
;;                              (cons 5 '()))))
;;        (cons 7
;;              (append '()
;;                      (cons 9
;;                            (append '()
;;                                    (cons 11 '()))))))

;;(append (append (append '() '(1))
;;                (cons 3
;;                      (append '() '(5))))
;;        (cons 7
;;              (append '()
;;                       (cons 9 (append '() '(11))))))

;;...

;;(append '(1 3 5)
;;        '(7 9 11))

;;'(1 3 5 7 9 11)
;;从展开过程来看，对于节点数为 6 的树， tree->list-1 需要伸展 6 次，使用 6 次 append ， 以及 6 次 cons ，
;;可以看出，对于大小为 n 的树， append 和 cons 的调用次数正比于 n 。
;;因为 cons 的复杂度为 Θ(1) ，比 append 的 Θ(n) 要低，所以 tree->list-1 的复杂度可以通过统计 append 调用
;;的次数来计算：对于树中每个节点，需要调用一次 append ，因此对于节点数为 n 的树来说， tree->list-1 的复杂度为 Θ(n2).
;;另一方面，对于 tree->list-2 ，同样给定树 a 作为输入，有以下展开序列：
;;(tree->list-2 (list 7
;;                    (list 3
;;                          (list 1 '() '())
;;                         (list 5 '() '()))
;;                    (list 9
;;                          '()
;;                          (list 11 '() '()))))

;;(copy-to-list (list 7
;;                    (list 3
;;                          (list 1 '() '())
;;                          (list 5 '() '()))
;;                    (list 9
;;                          '()
;;                          (list 11 '() '())))
;;              '())

;;(copy-to-list (list 3
;;                    (list 1 '() '())
;;                    (list 5 '() '()))
;;              (cons 7
;;                    (copy-to-list (list 9
;;                                        '()
;;                                        (list 11 '() '()))
;;                                  '())))

;;(copy-to-list (list 3
;;                   (list 1 '() '())
;;                    (list 5 '() '()))
;;              (cons 7
;;                    (copy-to-list '()
;;                                  (cons 9
;;                                        (copy-to-list (list 11 '() '())
;;                                                      '())))))
;;(copy-to-list (list 3
;;                    (list 1 '() '())
;;                    (list 5 '() '()))
;;              (cons 7
;;                    (copy-to-list '()
;;                                  (cons 9
;;                                        (copy-to-list '()
;;                                                      (cons 11
;;                                                            (copy-to-list '() '())))))))

;;(copy-to-list (list 1 '() '())
;;              (cons 3
;;                    (copy-to-list (list 5 '() '())
;;                                  (cons 7
;;                                        (copy-to-list '()
;;                                                      (cons 9
;;                                                            (copy-to-list '()
;;                                                                          (cons 11
;;                                                                                (copy-to-list '() '())))))))))

;;(copy-to-list '()
;;              (cons 1
;;                    (copy-to-list '()
;;                                  (cons 3
;;                                        (copy-to-list (list 5 '() '())
;;                                                     (cons 7
;;                                                            (copy-to-list '()
;;                                                                          (cons 9
;;                                                                                (copy-to-list '()
;;                                                                                              (cons 11
;;                                                                                                    (copy-to-list '() '())))))))))))

;;...

;;(cons 1 (cons 3 (cons 7 (cons 9 (cons 11 '())))))

;;'(1 3 7 9 11)
;;从展开过程来看，对于节点数为 6 的树来说， tree->list-2 展开 6 次，调用 6 次 copy-to-list ，调用 6 次 cons ，可以看出，
;;对于节点数为 n 的树， tree->list-2 调用 cons 和 copy-to-list 的次数等同于 n 。
;;tree->list-2 的复杂度可以通过统计 cons 的调用次数来统计：每次展开需要调用一次 cons ，而 cons 的复杂度为 Θ(1) ，因此对于
;;节点数为 n 的树来说， tree->list-2 的复杂度为 Θ(n) 。
;;通过对比，可以发现，虽然 tree->list-1 和 tree->list-2 对于同样的树生成的列表一样，但是 tree->list-2 的复杂度比 tree->list-1 更低。
