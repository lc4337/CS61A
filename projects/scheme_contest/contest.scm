;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (draw)
  (define size 120)
  (define n 10)
  (define sinc1 (/ 4 5))
  (define sinc2 (/ 3 5))
  ;;;(define sinc1 (/ 1 1.414))
  ;;;(define sinc2 (/ 1 1.414))
  (define c1 (degrees (atan (/ 4 3))))
  (define c2 (degrees (atan (/ 3 4))))
  ;;;(define c1 45)
  ;;;(define c2 45)
  (define (draw-rect size n)
    (if (not (= n 0))
      (begin
      (fd size)
      (rt 90)
      (fd size)
      (rt 90)
      (fd size)
      (rt 90)
      (fd size)
      (rt 90)
      (fd size)
      (lt c1)
      (draw-rect (* size sinc2) (- n 1))
      (rt 90)
      (fd (* size sinc2))
      (draw-rect (* size sinc1) (- n 1))
      (rt 90)
      (fd (* size sinc1))
      (rt c1)
      (fd size)
      (rt 90)
      (fd size)
      (rt 90))
    )
  )
  (speed 10)
  (penup)
  (setpos (- size) (- size))
  (pendown)
  (draw-rect size n)
  (hideturtle)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)