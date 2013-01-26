(define l1 '( (ben "short") (cara "walking") (dan "bald")))

(define (lookup name assoc_list)
		(if (null? assoc_list)
			#f
		(if (equal? (car (car assoc_list)) name)
				(car assoc_list)
				(lookup name (cdr assoc_list))
		)))

