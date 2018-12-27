;;intersection-set改名为intersection-tree，union-set被改名成 union-tree
;;intersection-tree
(load "exercises-2-61.scm")
(load "exercises-2-62.scm")
(load "exercises-2-63.scm")
(load "exercises-2-64.scm")

(define (intersection-tree tree another)
    (list->tree
        (intersection-set (tree->list-2 tree)
                          (tree->list-2 another))))

;;union-tree
(define (union-tree tree another)
    (list->tree
        (union-set (tree->list-2 tree)
                   (tree->list-2 another))))

;;使用树实现的 Θ(n) 复杂度的 intersection-tree 和 union-tree 的步骤如下：

;;(1)使用 练习 2.63 的 tree->list-2 程序，将输入的两棵树转换成两个列表，复杂度 Θ(n) 。
;;(2)如果要执行的是交集操作，那么使用书本 105 页的 intersection-set 计算两个列表的交集；如果要执行的是并集操作，
;;	那么使用 练习 2.62 的 union-set 计算两个列表的并集；以上两个程序的复杂度都是 Θ(n) 。
;;(3)使用 练习 2.64 的 list->tree 程序，将第二步操作所产生的列表转换成一棵平衡树，复杂度为 Θ(n) 。
;;intersection-tree 和 union-tree 的整个过程需要使用三个复杂度为 Θ(n) 的程序，但总的复杂度还是 Θ(n)