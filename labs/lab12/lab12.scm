(define-macro (def func args body)
  `(define ,func (lambda ,args ,body)))

(define (map-stream f s)
  (if (null? s)
      nil
      (cons-stream (f (car s))
                   (map-stream f (cdr-stream s)))))

(define all-three-multiples
        (cons-stream 3
                     (map-stream (lambda (x) (+ x 3))
                                 all-three-multiples)))

(define (compose-all funcs)
  (define (compose funcs comp)
    (if (null? funcs)
        comp
        (compose (cdr funcs)
                 (lambda (x) ((car funcs) (comp x))))))
  (compose funcs (lambda (x) x)))

(define (partial-sums stream)
  (define (helper sum stream)
    (if (null? stream)
        nil
        (cons-stream (+ sum (car stream))
                     (helper (+ sum (car stream)) (cdr-stream stream)))))
  (helper 0 stream))
