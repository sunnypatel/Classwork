(define (stream-filter f s)
	(cond ((stream-null? stream) the-empty-stream)
				(( f (stream-car s))
					(cons-stream ( stream-car s)
											 ( stream-filter f
																			(stream-cdr s))))
				(else (stream-filter f (stream-cdr s)))))
