(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
	(list entry left right))
	
(define (list->tree elements)
	(car (partial-tree elements (length elements))))
	
(define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
            (let ((left-result (partial-tree elts left-size)))
                (let ((left-tree (car left-result))
                      (non-left-elts (cdr left-result))
                      (right-size (- n (+ left-size 1))))
                    (let ((this-entry (car non-left-elts))
                          (right-result (partial-tree (cdr non-left-elts)
                                                      right-size)))
                        (let ((right-tree (car right-result))
                              (remaining-elts (cdr right-result)))
                            (cons (make-tree this-entry left-tree right-tree)
                                  remaining-elts))))))))
						
;;exercises-a
;;quotient函数是求商函数
;;list->tree 将调用 partial-tree ，而 partial-tree 每次将输入的列表分成两半（右边可能比左边多一个元素，用作当前节点)，
;;然后组合成一个平衡树。
;;(list->tree '(1 3 5 7 9 11)) ==> (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;;exercises-b
;;对于列表中的每个节点,list->tree 都要执行一次 make-tree （复杂度为O(1)），将这个节点和它的左右子树组合
;;起来，因此对于长度为n的列表来说， list->tree 的复杂度为O(n) 。