(define (rle s)
  (define (count cnt s)
    (if (null? (cdr-stream s))
        cnt
        (if (eq? (car s) (car (cdr-stream s)))
            (count (+ cnt 1) (cdr-stream s))
            cnt
        )
    )
  )
  (define (next s)
    (if (null? (cdr-stream s))
        nil
        (if (eq? (car s) (car (cdr-stream s)))
            (next (cdr-stream s))
            (cdr-stream s)
        )
    )
  )
  (if (null? s)
    nil
    (cons-stream (list (car s) (count 1 s)) (rle (next s)))
  )
)



(define (group-by-nondecreasing s)
    (define (group s)
        (if (null? (cdr-stream s))
            (cons (car s) nil)
            (if (> (car s) (car (cdr-stream s)))
                (cons (car s) nil)
                (cons (car s) (group (cdr-stream s))))))
    (define (next s)
        (if (null? (cdr-stream s))
            nil
            (if (> (car s) (car (cdr-stream s)))
                (cdr-stream s)
                (next (cdr-stream s)))))
    (if (null? s)
        nil
        (cons-stream (group s) (group-by-nondecreasing (next s))))
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

