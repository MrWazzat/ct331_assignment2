#lang racket
;Cons pair of 2 numbers
(cons 1 2)
;List of 3 numbers built with the cons function
(cons 3 (cons 4 (cons 5 empty)))
;List containing a String, a number and a nested list of three numbers (cons function)
(cons "cons" (cons 6 (cons '(7 8 9) empty)))
;List containing a String, a number and a nested list of three numbers (list function)
(list "list" 10 '(11 12 13))
;List containing a String, a number and a nested list of three numbers (append function)
(append '("append") '(14) '((15 16 17)))

