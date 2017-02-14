(load "lib/test-manager/load.scm")
(load "src/main/lists.scm")

(define-test (length-test)
  (let ((l (list 1 2 3 4)))
    (assert-equal (length l) 4)
    (assert-equal (length-iter l) 4)))

(define-test (list-ref-test)
  (let ((l (list 1 2 3 4)))
    (assert-equal (list-ref l 0) 1)
    (assert-equal (list-ref l 1) 2)
    (assert-equal (list-ref l 2) 3)
    (assert-equal (list-ref l 3) 4)))
