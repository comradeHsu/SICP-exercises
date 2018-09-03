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