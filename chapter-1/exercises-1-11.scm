(let (recursion n)
	(cond ((< n 3) n)
		(else (+ (recursion (- n 1)) (* (recursion (- n 2) 2) (* (recursion (- n 3) 3))))
