(load "lib/test-manager/load.scm")
(load "src/main/trees.scm")

(define-test (lengt-test)
  (let ((x (cons (list 1 2) (list 3 4))))
    (assert-equal (count-leaves x) 4)
    (assert-equal (count-leaves (list x x)) 8)))
