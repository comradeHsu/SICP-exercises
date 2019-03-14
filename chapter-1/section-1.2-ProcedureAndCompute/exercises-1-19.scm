(define fib(n)
	(fib-iter 1 0 n))
	
(define (fib-iter a b count)
	(if (= count 0) 
		b
	(fib-iter (+ a b ) a (- count 1))))
	
(define (fast-fib n)
	(fast-fastfib-iter 1 0 0 1 n))
	
(define (fast-fastfib-iter a b p q count)  
  (cond ((= count 0) b)  
    ((even? count)  
     (fast-fastfib-iter a  
           b  
           (+ (* p p) (* q q))  
           (+ (* q q) (* 2 q p))  
           (/ count 2)))  
    (else (fast-fastfib-iter (+ (* b q) (* a q) (* a p))  
             (+ (* b p) (* a q))  
             p  
             q  
             (- count 1)))))
;;根据斐波那契数列的基本性质[Fn`Fn−1]=[Fn−1+Fn−2,Fn−1]=[1,1`1,0] * [Fn−1`Fn−2]
;;[1,1;1,0]是一个2x2的矩阵，将上述等式变换可得
;;[Fn+1`Fn]=[1,1`1,0]^n * [F1`F0],这里我们认为F0 = 0
;;我们假设[1,1`1,0]^n = [q+p,q`q,p],代入上可得[F2n+1`F2n]=[q+p,q`q,p]^2 * [1`0]
;;进一步变化得[(q+p)^2+q^2,q^2+2qp`q^2+2qp,q^2+p^2] * [1`0]
