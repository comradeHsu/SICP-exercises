(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

;;a
(define (left-branch mobile)
  (car mobile))
 
(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))
 
(define (branch-structure branch)
  (cadr branch))

;;b
(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define (branch-weight branch)
	(let ([branch-leaf (cadr branch)])
		(if (list? branch-leaf)
			(total-weight branch-leaf)
			branch-leaf)))

(define (test-b)
	(define l (make-branch 2 
		(make-mobile (make-branch 2 3) (make-branch 3 4))))
	(define r (make-branch 2 
		(make-mobile (make-branch 2 3) (make-branch 3 4))))
	(define a (make-mobile l r))
	(total-weight a))