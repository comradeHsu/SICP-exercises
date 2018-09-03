;;(variable? e)      			e�Ǳ�����
;;(same-variable?    			v1 v2) v1��v2��ͬһ��������
;;(sum? e)  		   			e�Ǻ�ʽ��
;;(addend e)         			e�ı�����
;;(augend e)		   			e�ļ���
;;(make-sum a1 a2)   			����a1��a2�ĺ�ʽ
;;(product? e)       			e�ǳ�ʽ��
;;(multiplier e)     			e�ı�����
;;(multiplicand e)   			e�ĳ���
;;(make-product m1 m2) 		����m1��m2�ĳ�ʽ   

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