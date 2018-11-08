#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)

(define (ins_beg el lst)
  ;The (cons) function is used here to turn el into a list so it can be used in (append)
  (append (cons el empty) lst)
)

(define (ins_end el lst)
  ;The (cons) function is used here to turn el into a list so it can be used in (append)
  (append lst (cons el empty))
)

(define (cout_top_level list)
  (if (not (empty? list))
     (+ 1 (cout_top_level (cdr list)))
  0)
)

(define (count_instances elem list)
  (if (not (empty? list))
      (if (= elem (car list))
          (+ 1 (count_instances elem (cdr list)))
          (count_instances elem (cdr list))
          )
      0)
)


;Basic tests
(display "Tests ins_beg \n")
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))

(display "\nTests ins_end \n")
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

(display "\nTests cout_top_level \n")
(cout_top_level '(b c d))
(cout_top_level '(b "Hello"))
(cout_top_level '(b "Hello" '("sublist" 1 a b) 5))

(display "\nTests count_instances \n")
(count_instances 5 '(5 2 3 6 5 4 5))
(count_instances 5 '(5))
(count_instances 5 '())
(count_instances 5 '(5 5 5 5 5 5))
(count_instances 5 '(2 1 3 6 8 7))




