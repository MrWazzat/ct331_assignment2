#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_tr_helper)
(provide count_instances_deep)

;;Atom function for the deep search
(define (atom? x)
  (not (or (pair? x) (null? x)))
)

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
  (cond [(empty? list) 0]
        [(= elem (car list)) (+ 1 (count_instances elem (cdr list)))]
        [else(count_instances elem (cdr list))]
  )  
)

(define (count_instances_tr elem list)
  (count_instances_tr_helper elem list 0)
)


(define (count_instances_tr_helper elem list number)
  (cond [(empty? list) number]
        [(= elem (car list)) (count_instances_tr_helper elem (cdr list)(+ 1 number))]
        [else (count_instances_tr_helper elem (cdr list) number)]
   )
)

(define (count_instances_deep elem list)
  ;;if the list is empty return 0
  (cond[(empty? list) 0]
       ;;if the first element isn't an atom, we count the number of elements inside of it 
       [(not(atom? (car list))) (+ (count_instances_deep elem (car list)) (count_instances_deep elem (cdr list)))]
       ;;if the first element is the good 1 we add 1
       [(= elem (car list)) (+ 1 (count_instances_deep elem (cdr list)))]
       ;;if it isn't we go to the next element
       [else (count_instances_deep elem (cdr list))]
))

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

(display "\nTests count_instances_tr \n")
(count_instances_tr 5 '(5 2 3 6 5 4 5))
(count_instances_tr 5 '(5))
(count_instances_tr 5 '())
(count_instances_tr 5 '(5 5 5 5 5 5))
(count_instances_tr 5 '(2 1 3 6 8 7))

(display "\nTests count_instances_deep \n")
(count_instances_deep 5 '(5 (2 3 6 5) 4 5))
(count_instances_deep 5 '(5))
(count_instances_deep 5 '())
(count_instances_deep 5 '(5 (5 5 5) 5 5))
(count_instances_deep 5 '(2 (5 3 1) 3 6 8 7))



