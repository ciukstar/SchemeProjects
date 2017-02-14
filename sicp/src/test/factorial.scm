
(load "lib/test-manager/load.scm")
(load "src/main/factorial.scm")

(define-test (factorial-rec-test)
  (assert-= 720 (factorial-rec 6) "(factorial-rec 6) should be 6!"))

(define-test (factorial-iter-test)
  (assert-= 720 (factorial-iter 6) "(factorial-iter 6) should be 6!"))
