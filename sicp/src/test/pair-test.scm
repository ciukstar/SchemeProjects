
(load "lib/test-manager/load.scm")

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 - CONS" m))))
    dispatch)

(define (car z) (z 0))

(define (cdr z) (z 1))

(define-test (pair-test)
  (assert-eqaul (car (cons 1 2)) 1)
  (assert-equal (cdr (cons 3 4)) 4))

