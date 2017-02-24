(load "lib/test-manager/load.scm")
(load "src/main/interfaces.scm")

(define-test (count-leaves-test)
  (define x (list 1 (list 2 3) (list 4 (list 5 6) 7) 8))
  (define r (count-leaves x))
  (assert-true (map enumerate-tree x) (list 1 2 3 4 5 6 7 8))
  (assert-equal r 8))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))
