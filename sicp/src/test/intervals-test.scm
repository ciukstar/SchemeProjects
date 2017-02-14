
(load "src/main/intervals.scm")
(load "lib/test-manager/load.scm")

(define-test (width-of-sub-of-two-intervals-should-be-a-function-of-the-width-of-given-intervals)
  (let ((z1 (mk-interval 2 3)) (z2 (mk-interval 4 5)))
    (let ((z3 (sub-interval z1 z2)))
      (assert-true (= (width z3) (- (width z1) (width z2)))))))

(define-test (width-of-sum-of-two-intervals-should-be-a-function-of-the-width-of-given-intervals)
  (let ((z1 (mk-interval 2 3)) (z2 (mk-interval 4 5)))
    (let ((z3 (add-interval z1 z2)))
      (assert-true (= (width z3) (+ (width z1) (width z2)))))))

(define-test (equal-interval-test)
  (let ((z1 (mk-interval 2 4)) (z2 (mk-interval 5 6)))
    (assert-false (equal-interval? z1 z2))
    (assert-true (equal-interval? z1 z1))))

(define-test (div-interval-test)
  (let ((x1 2) (x2 4) (x3 6) (x4 8))
    (let ((z1 (mk-interval x1 x2)) (z2 (mk-interval x3 x4)))
      (let ((z3 (div-interval z1 z2)))
        (assert-true (and (= (lower-bound z3) (lower-bound (mul-interval z1 (reciprocal-interval z2))))
                          (= (upper-bound z3) (upper-bound (mul-interval z1 (reciprocal-interval z2))))))))))

(define-test (reciprocal-interval-test)
  (let ((z (mk-interval 2 4)))
    (let ((rec-z (reciprocal-interval z)))
      (assert-true (= (lower-bound rec-z) (/ 1.0 (upper-bound z))))
      (assert-true (= (upper-bound rec-z) (/ 1.0 (lower-bound z)))))))

(define-test (mul-interval-test)
  (let ((x1 2) (x2 3) (x3 4) (x4 5))
    (let ((z1 (mk-interval x1 x2)) (z2 (mk-interval x3 x4)))
      (let ((p1 (* (lower-bound z1) (lower-bound z2))) (p2 (* (lower-bound z1) (upper-bound z2))) (p3 (* (upper-bound z1) (lower-bound z2))) (p4 (* (upper-bound z1) (upper-bound z2))))
        (let ((z3 (mul-interval z1 z2)))
          (assert-true (and (= (lower-bound z3) (min p1 p2 p3 p4)) (= (upper-bound z3) (max p1 p2 p3 p4)))))))))

(define-test (sub-interval-test)
  (let ((z1 (mk-interval 2 3)) (z2 (mk-interval 4 5)))
    (let ((z3 (sub-interval z1 z2)))
      (assert-true (and (= (lower-bound z3) (- (lower-bound z1) (lower-bound z2))) (= (upper-bound z3) (- (upper-bound z1) (upper-bound z2))))))))

(define-test (add-interval-test)
  (let ((x1 2)(x2 3) (x3 4) (x4 5))
    (let ((z1 (mk-interval x1 x2)) (z2 (mk-interval x3 x4)))
      (let ((z3 (add-interval z1 z2)))
        (assert-true (and (= (lower-bound z3) (+ (lower-bound z1) (lower-bound z2))) (= (upper-bound z3) (+ (upper-bound z1) (upper-bound z2)))))))))

(define-test (lower-bound-test)
  (let ((x1 2) (x2 3)) 
    (let ((i1 (mk-interval x1 x2)))
      (assert-true (and (= (lower-bound i1) x1) (= (upper-bound i1) x2))))))
