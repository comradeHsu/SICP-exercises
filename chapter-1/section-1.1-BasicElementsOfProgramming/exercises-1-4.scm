;equals if b > 0,a + b, else a - b,of course ,a plus abs b
;i think awesome that is scheme can operating operation symbol

(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))
