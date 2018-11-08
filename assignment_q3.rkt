#lang racket

;;Using the definition from the slides :
;;Left child is the first element in the list
;;Value is second element in the list
;;Right is the last element in the list

(provide display_sorted_bst)
(provide search_elem_bst)
(provide insert_elem_bst)
;;Atom function
(define (atom? x)
  (not (or (pair? x) (null? x)))
)

;;Displays the bst passed as an argument in sorted order
(define (display_sorted_bst bst)
  (cond[(empty? bst)]
       [(atom? (car bst)) (display (car bst))
                          (display " ")
                          (display_sorted_bst (cdr bst))]
       [else (display_sorted_bst (car bst))
             (display_sorted_bst (cdr bst))]
   )
)

;;Searches an element in a bst
(define (search_elem_bst elem bst)
  (cond [(empty? bst) #f]
        [(atom? bst)(if(= elem bst)#t #f)]
        [(= elem (cadr bst))]
        [(< elem (cadr bst)) (search_elem_bst elem (car bst)) ]
        [else (search_elem_bst elem (caddr bst))]
  )
)

(define (insert_elem_bst elem bst)
  (cond[(empty? bst) (list bst elem)]
       [(atom? bst)(if(< elem bst)(list elem bst '()) (list '() bst elem))]
       [(= elem (cadr bst)) (display "The element is already in the tree")]
       [(< elem (cadr bst)) (insert_elem_bst elem (car bst)) ]
       [else (insert_elem_bst elem (caddr bst))]
  )
)
  

(display_sorted_bst '((1 3(4 6 7))8(() 10 (13 14 ()))))

(search_elem_bst 6'((1 3(4 6 7))8(() 10 (13 14 ()))))
(search_elem_bst 13 '((1 3(4 6 7))8(() 10 (13 14 ()))))
(search_elem_bst 2 '((1 3(4 6 7))8(() 10 (13 14 ()))))
(search_elem_bst 1 '((1 3(4 6 7))8(() 10 (13 14 ()))))
(search_elem_bst 14 '((1 3(4 6 7))8(() 10 (13 14 ()))))

;;Don't know how to keep trace of the tree
(insert_elem_bst 2 '((1 3(4 6 7))8(() 10 (13 14 ()))))
(insert_elem_bst 9 '((1 3(4 6 7))8(() 10 (13 14 ()))))
