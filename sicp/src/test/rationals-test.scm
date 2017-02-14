(load "lib/test-manager/load.scm")
(load "src/main/rationals.scm")

(define one-half (mk-rat 1 2))
(define one-third (mk-rat 1 3))

(define-test (lower-terms-test)
  (let ((x (mk-rat 6 9)))
    (assert-equal (numer x) 2)
    (assert-equal (denom x) 3)))

(define-test (equals-rat-test)
  (let ((x one-half) (y one-third) (z (add-rat one-third one-third)))
    (assert-false (equal-rat? x y))
    (assert-true (equal-rat? x x))
    (assert-true (equal-rat? y y))
    (assert-true (equal-rat? z (mk-rat 2 3)))))

(define-test (div-rat-test)
  (let ((x (div-rat one-half one-third)))
    (assert-equal (numer x) 3)
    (assert-equal (denom x) 2)))

(define-test (mul-rat-test)
  (let ((x (mul-rat one-half one-third)))
    (assert-equal (numer x) 1)
    (assert-equal (denom x) 6)))

(define-test (sub-rat-test)
  (let ((x (sub-rat one-half one-third)))
    (assert-equal (numer x) 1)
    (assert-equal (denom x) 6)))

(define-test (add-rat-test)
  (let ((x (add-rat one-half one-third)))
    (assert-equal (numer x) 5)
    (assert-equal (denom x) 6)))

(define-test (selector-test) 
  (assert-true (= (numer (mk-rat 2 3)) 2))
  (assert-true (= (denom (mk-rat 2 3)) 3)))

(define-test (axiom-test)
  (let ((n 2) (d 3))
    (let ((x (mk-rat n d)))
      (assert-equal (/ (numer x) (denom x)) (/ n d)))))
