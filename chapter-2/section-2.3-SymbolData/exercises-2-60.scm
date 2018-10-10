(define (element-of-set? x set)
	(cond ((null? set) #f)
		((equal? x (car set)) #t)
		(else (element-of-set x (cdr set)))))
		
(define (adjoin-set x set)
    (cons x set))
	
(define (union-set set1 set2)
    (iter (append set1 set2) '()))

(define (iter input result)
    (if (null? input)
        (reverse result)
        (let ((current-element (car input))
              (remain-element (cdr input)))
            (if (element-of-set? current-element result)
                (iter remain-element result)
                (iter remain-element
                      (cons current-element result))))))
					  
(define (intersection-set set another)
    (define (iter set result)
        (if (or (null? set) (null? another))
            (reverse result)
            (let ((current-element (car set))
                  (remain-element (cdr set)))
                (if (and (element-of-set? current-element another)
                         (not (element-of-set? current-element result)))
                    (iter remain-element
                          (cons current-element result))
                    (iter remain-element result)))))
    (iter set '()))
	
	
;;���������ظ�Ԫ�ؼ��Ϻ����ظ�Ԫ�ؼ��ϵļ��������ĸ��ӶȶԱȣ�

;;����	element-of-set?	adjoin-set	union-set	intersection-set
;;���ظ�	��(n)	��(n)	��(n2)	��(n2)
;;���ظ�	��(n)	��(1)	��(n2)	��(n2)
;;�Ƿ���Թ���	��	����	��	����
;;���Կ������ڸ��Ӷȷ��棬���ظ�Ԫ�ؼ��ϵ� adjoin-set �����ظ�Ԫ�ؼ��ϵ� adjoin-set Ҫ��һ������������֮�⣬�����汾�����������ĸ��Ӷȶ���һ���ġ�

;;����������ˣ������ظ�Ԫ�صļ��Ͻ��� element-of-set? �� union-set �� intersection-set ���㷨��ϵ��������ظ�Ԫ�صļ���Ҫ�ߣ������ظ�Ԫ�صĲ������࣬���ظ�Ԫ�صļ��Ͻ�������������������Խ��Խ����

;;��ˣ����ڲ������Ƶ����Ӧ����˵������ʹ�����ظ�Ԫ�صļ��ϣ�������Ƶ�����в��ҡ�����������������������Ӧ����˵��ʹ�����ظ�Ԫ�صļ��ϱȽϺá�