#lang racket
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(display "atom")

(atom? (quote atom))
(atom? (quote turkey))
(atom? 1492)
(atom? (quote u))
(atom? (quote *abc$))

(define list?
  (lambda (x)
    (atom? (quote x))))

(display "list")

(list? (quote (atom)))
(list? (quote (atom turkey or)))
;(list? (quote (atom turkey) or))

(display "s-expression")

(define sexp?
  (lambda (x)
    (atom? (quote x))))

(sexp? 'xyz)
(sexp? '(x y z))
(sexp? '((x y) z))

(list? '(how are you doing so far))
(list? '(((how) are) ((you) (doing so)) far))

(list? '())
(atom? '())
(list? '(() () ()))

(display "car")

(car '(a b c))
(car '((a b c) x y z))
;(car 'hotdog); no for atoms
;(car '()); no for empty

; The Law of Car: car is defined only for non-empty lists

(car '(((hotdogs)) (and) (pickle) relish))
(car (car '(((hotdogs)) (and) (pickle) relish)))

(cdr '(a b c))
(cdr '((a b c) x y z))
(cdr '(hamburger))
(cdr '((x) t r))
;(cdr 'hotdogs)