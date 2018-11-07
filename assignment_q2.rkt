#lang racket

(provide ins_beg)
(provide ins_end)

(define (ins_beg el lst)
  ;The (cons) function is used here to turn el into a list so it can be used in (append)
  (append (cons el empty) lst)
)

(define (ins_end el lst)
  ;The (cons) function is used here to turn el into a list so it can be used in (append)
  (append lst (cons el empty))
)


;Basic tests
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

