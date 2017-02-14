
(load "lib/test-manager/load.scm")

(define-test (improve-test)
  (assert-= (improve 1.0 2) 1.5)
  (assert-< (improve 1.5 2) 1.4167))

(define-test (good-enough-test)
  (assert-true (good-enough? 2 4))
  (assert-true (good-enough? 3 9))
  (assert-false (good-enough? 4 2))
  (assert-false (good-enough? 9 3)))

(define-test (sqrt-test)
  (assert-true (and (>= (sqrt 9) 3.000) (< (mysqrt 9) 3.001)) "sqrt 9 should be 3")
  (assert-true (and (>= (sqrt 4) 2.000) (< (mysqrt 4) 2.001)) "sqrt 4 should be 2"))
