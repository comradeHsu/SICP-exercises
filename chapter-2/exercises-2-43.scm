(define (queens board-size)
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board)
			(filter 
				(lambda(positions) (safe? k positions))
				(flatmap
					(lambda(new-row)
						(map (lambda(rest-of-queens)
								(adjoin-position new-row k rest-of-queens))
						(enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
	(queen-cols board-size))
	
;;��ϰ 2.42 �� queens ��������ÿ������ (queen-cols k) ��ʹ�� enumerate-interval ���� board-size �����̡�

;;�� Louis �� queens �������� (enumerate-interval 1 board-size) ��ÿ�� k ����Ҫ���� (queen-cols (- k 1)) �����̡�

;;��ˣ� Louis �� queens �����������ٶȴ�Լ��ԭ�� queens ������ board-size ����Ҳ���� T * board-size 