(define (RMB-Change amount)
  (format #t "Changing ~S~%" amount)
  (cond ((= amount 0) 0)
	((< amount 0) 0)
	(else (RMB-Change-Recursive amount 1 '() ))))
 
(define (RMB-Change-Recursive amount change-kind change-result)
  (format #t "( ~S ~S )" amount change-kind)
  (if (= amount 0) (format #t "Got one: ~S~%" change-result))
  (cond ((= amount 0) 1)
	((> change-kind amount) 0)
	((= change-kind 0) 0)
	(else (+ (RMB-Change-Recursive amount (RMB-Change-Next-Kind change-kind) change-result)
		 (RMB-Change-Recursive (- amount change-kind) change-kind (cons change-kind change-result))))))



(define us-coins (list 50 25 10 5 1))
 
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
 
(define cn-coins (list 100 50 20 10 5 2 1))
 
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else 
	 (+ (cc amount 
		(except-first-denomination coin-values))
	    (cc (- amount 
		   (first-denomination coin-values))
		coin-values)))))
 
(define (first-denomination coin-values)
  (car coin-values))
 
(define (except-first-denomination coin-values)
  (cdr coin-values))
 
(define (no-more? coin-values)
  (null? coin-values))
 
(define (test-it)
  (cc 101 cn-coins))