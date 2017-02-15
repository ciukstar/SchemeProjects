(load "lib/test-manager/load.scm")
(load "src/main/list-mapping.scm")

(define-test (increment-test)
  (let ((l1 (map (lambda (x) (+ x 1)) (list 1 2 3)))
        (l2 (map abs (list -10 2.5 11.6 17))))
    (assert-true (equal? l1 (list 2 3 4)))
    (assert-true (equal? l2 (list 10 2.5 11.6 17)))))

(define-test (scale-list-test)
  (let ((l (scale-list (list 1 2 3) 10)))
    (assert-true (equal? l (list 10 20 30)))))
