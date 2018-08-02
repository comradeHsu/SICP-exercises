(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
	(accumulate (lambda(this-coeff higher-terms) (+ (* higher-terms x) this-coeff))
		0 coefficient-sequence))

;;1+3x+5*x^3+x^5 = 1+3*x+0*x^2+5*x^3+0*x^4+1*x^5
;;((a[n]*x+a[n-1])*x)+a[n-2])*x+a[n-3]....