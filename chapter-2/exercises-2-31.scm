(define (square-tree tree)
	(tree-map square tree))
	
(define (tree-map square tree)
  (map (lambda (tree)
         (if (pair? tree)
             (tree-map square tree)
             (square tree)))
       tree))

(define square (lambda (x) (* x x)))