;;(variable? e)      			e是变量吗？
;;(same-variable?    			v1 v2) v1和v2是同一个变量吗？
;;(sum? e)  		   			e是和式吗？
;;(addend e)         			e的被加数
;;(augend e)		   			e的加数
;;(make-sum a1 a2)   			构造a1和a2的和式
;;(product? e)       			e是乘式吗？
;;(multiplier e)     			e的被乘数
;;(multiplicand e)   			e的乘数
;;(make-product m1 m2) 		构造m1和m2的乘式   

(define (deriv exp var)
	(cond ((number? exp) 0)
		((variable? exp)
			(if (same-variable? exp var) 1 0))
		((sum? exp)
			(make-sum (deriv (addend exp) var)
				(deriv (augend exp) var)))
		((product? exp)
			(make-sum (make-product (multiplier exp)
					(deriv (multiplicand exp) var))
				(make-product (deriv (multiplier exp) var)
					(multiplicand exp))))
		(else (error "unknow expression type -- DERIV" exp))))
		
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))
	
(define (make-sum a1 a2) (list '+ a1 a2))

(define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
	(and (pair? x) (eq? (car x) '+)))
	
(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
	(and (pair? x) (eq? (car x) '*)))
	
(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

;;solution a

(define (make-sum a1 a2)
    (cond ((=number? a1 0)
            a2)
        ((=number? a2 0)
            a1)
        ((and (number? a1) (number? a2))
            (+ a1 a2))
        (else 
			(list a1 '+ a2))))              ; 修改

(define (sum? x)
    (and (pair? x)
        (eq? (cadr x) '+)))                ; 修改

(define (addend s)
    (car s))                                ; 修改

(define (augend s)
    (caddr s))
	
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0))
            0)
        ((=number? m1 1)
            m2)
        ((=number? m2 1)
            m1)
        ((and (number? m1) (number? m2))
            (* m1 m2))
        (else
            (list m1 '* m2))))              ; 修改

(define (product? x)
    (and (pair? x)
         (eq? (cadr x) '*)))                ; 修改

(define (multiplier p)
    (car p))                                ; 修改

(define (multiplicand p)
    (caddr p))