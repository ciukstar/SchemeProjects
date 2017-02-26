(load "lib/test-manager/load.scm")
(load "src/main/sets-unordered.scm")

(define-test (set-axiom-3)
  (define s '())
  (define x 7)
  (assert-false (element-of-set? x s)))

(define-test (set-axiom-2)
  (define s (list 1 2 3))
  (define t (list 3 4 5))
  (define x 4)
  (assert-true (equal?
                (element-of-set? x (union-set s t))
                (or (element-of-set? x s) 
                    (element-of-set? x t)))))

(define-test (set-axiom-1)
  (define s (list 1 2 3))
  (define x 4)
  (assert-true (element-of-set? x (adjoin-set x s))))
