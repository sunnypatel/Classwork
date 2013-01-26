(define l1 '( (ben "short") (cara "walking") (dan "bald")))
(define l2 '( (kurt "is not") (ski "skinny") (kim "cook") (cara "injured")))

(define e (list l1 l2) )

(define (lookup name assoc_list)
		(if (null? assoc_list)
			#f
		(if (equal? (car (car assoc_list)) name)
				(car assoc_list)
				(lookup name (cdr assoc_list))
		)))

(define (lookup-env name env)
		(if (null? env)
			#f
		(if (lookup name (car e))
				(lookup name (car e))
				(lookup-env name (cdr e)))
		)
)
