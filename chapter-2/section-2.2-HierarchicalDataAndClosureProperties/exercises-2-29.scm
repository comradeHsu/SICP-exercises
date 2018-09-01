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
	(let ([branch-leaf (branch-structure branch)])
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
	
;;c 
(define (balance? mobile)
  (newline)
  (display "evaluating: ")
  (display mobile)
  (if (not (list? mobile))
      (begin
		(display "not list")
		#t
		)
      (let ([left-one (branch-structure (left-branch mobile))]
	    [right-one (branch-structure (right-branch mobile))])
	(newline)
	(display "inner evaluating:")
	(display left-one)
	(display right-one)
	(if (and (balance? left-one)
		 (balance? right-one)
		 (= (* (branch-length (left-branch mobile))
		       (total-weight left-one))
		    (* (branch-length (right-branch mobile))
		       (total-weight right-one))))
	    #t
	    #f))))

;;d
(define (make-mobile-d left right)
	(list left right))

(define (make-branch-d length structure)
	(list length structure))
	
(define (right-branch mobile)
  (cdr mobile))
 
(define (branch-structure branch)
  (cdr branch))
