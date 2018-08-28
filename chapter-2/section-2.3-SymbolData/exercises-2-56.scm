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
                                     (multiiplicand exp))))
           ((exponentiation? exp)
     (let ((n (exponent exp))
                  (u (base exp)))
              (make-product
                    n
                   (make-product 
                        (make-exponentiation
                             u
                             (- u 1))
                       (deriv u var)))))
    (else
             (error "unknown expression type -- DERIV" exp))))
(define (make-exponentiation base exponent)
  (cond ((= exponent 0)
     1)
    ((= exponent 1)
     base)
    (else 
     (list '** base exponent))))
(define (exponentiation? x)
  (and (pair? x)
       (eq? (car x) '**)))
(define (base exp)
  (cadr exp))
(define (exponent exp)
  (caddr exp))
