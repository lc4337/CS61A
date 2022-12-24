(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)


(define (sign num)
  'YOUR-CODE-HERE
  (cond ((< num 0) -1)
        ((> num 0) 1)
        (else 0))
)


(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (if (= 1 y) 
    x
    (if (odd? y) 
        (* x (square (pow x (/ (- y 1) 2))))
        (square (pow x (/ y 2)))))
)


(define (unique s)
  'YOUR-CODE-HERE
  (if (null? s) 
       nil
       (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s))))
  )
)


(define (replicate x n)
  'YOUR-CODE-HERE
    (define (repl lst x n)
        (if (= n 0)
            lst
            (repl (cons x lst) x (- n 1))
        )
    )
    (repl nil x n)
)


(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= n 0)
      start
      (accumulate combiner (combiner start (term n)) (- n 1) term)
  )
)


(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (accumulate combiner start n term)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  (list 'map (list 'lambda (list var) map-expr) (list 'filter (list 'lambda (list var) filter-expr) lst))
)

