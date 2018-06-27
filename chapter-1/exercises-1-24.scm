(load "exercises-1-21.scm")

(define (timed-prime-test n)
	(newline)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (fast-prime? n 1)
		(report-prime (- (runtime) start-time))
		(search-for-primes (+ n 2))))

(define (report-prime elapsed-time)
	(display "***")
	(display elapsed-time))

(define (prime? n)
	(= n (smallest-devisor n)))

(define (search-for-primes n)
	(timed-prime-test n))

(define (runtime)
        (time-nanosecond (current-time)))
		
(define (fast-prime? n times)
	(cond ((= times 0) #t)
		((format-test n) (fast-prime? n (- times 1)))
		(else #f)))
		
(define (format-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))

;;这里expmod使用了余数的基本性质，令a*b = c，则c % n = ((a % n) * (b % n)) % n
(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
		(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (even? n)
	(= (remainder n 2) 0))
;;10001:5500
;;100_000_001:11000
;;我是用10001和100_000_001去测试的，多次取平均值发现计算100_000_001所花费的时间是10001的两倍左右,符合费马检查的O(log n)
;;的时间复杂度



;; SICP No.1.25

;; 直接定义(expmod base exp m)为base^exp基于m的模(modulo)
;; (define (expmod base exp m)
;;   (remainder (fast-expt base exp) m))
;; 在理想情况下是正确的，在语义上与原定义是等价的，甚至递归层数
;; 都是一样的，而且更加直观。
;;
;; 但在实践中，这样的定义是不可行的，这也是为什么我们要采用原文中的定义
;; 的原因：因为base^exp很可能是一个非常大的数。比如，当我们取第二个
;; 测试例子中的n=1000000时，base是[1,999999]区间中的任意
;; 随机数，它的平均取值为50000，而exp=1000000。50000^1000000是一个大得
;; 惊人的数，无论是fast-expt的层层函数调用计算，还是用remainder对其取模，
;; 计算量都是很大的。
;;
;; 而相反，原始的expmod函数
;; (define (expmod base exp m)
;;   (cond ((= exp 0) 1)
;;         ((even? exp)
;;          (remainder (square (expmod base (/ exp 2) m))
;;                     m))
;;         (else
;;          (remainder (* base (expmod base (- exp 1) m))
;;                     m))))
;; 通过分解(a*b mod n) 为 ((a mod n) * (b mod n) mod n)，使得每层递归
;; 调用的计算参数和返回值总是小于n (x mod n < n)，即便是计算过程中出现
;; 的最大数(a mod n) * (b mod n) 也依然是要小于n^2, 相对于前者n^n的数
;; 量级，实在是小得多，这样就避免了大数的计算问题。
;;
;; 比如经测试，在使用新的expmod的情况下，1009的验证需要1.2ms的时间，
;; 1000003的验证需要 93680ms，远高于原来的expmod函数。
;;
;; 这也同时印证了我们在1.24题中的分析，同样的操作在不同字长的数字上的
;; 代价是不同的。1000000的验证时间现在是1000的8000多倍，远不再是2倍左右
;; 的关系。在1.24中的，因为expmod算法的控制，操作数最多是n^2级的，字长
;; 所引起的差距并不明显，只在10^6-10^12间产生了一点点阶跃；而这里的算法
;; 中, 操作数可以达到n^n级，当n=1000时，1000^1000的字长大约在10000位(二
;; 进制数)左右，而n=1000000时1000000^1000000的字长则达到在20000000位(二
;; 进制数)左右，这字长的巨大差距导致了我们在1.24中已经发现的问题更加明显。
