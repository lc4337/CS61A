(define (split-at lst n)
	(define (getn lst n)
		(if (null? lst)
			nil
			(if (= n 0)
				nil
				(cons (car lst) (getn (cdr lst) (- n 1))))))
	(define (nextn lst n)
		(if (null? lst)
			nil
			(if (= n 0)
				lst
				(nextn (cdr lst) (- n 1)))))
	(cons (getn lst n) (nextn lst n))
)


(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons (eq? (eval expr) (car case)) (cdr case)))
    			cases))
)
