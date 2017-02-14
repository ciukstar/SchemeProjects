
(load "lib/test-manager/load.scm")

(define (f n)
  (if (< n 3) n (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define-test (f-test)
  (assert-= 0 (f 0))
  (assert-= 1 (f 1))
  (assert-= 2 (f 2))
  (assert-= 4 (f 3))
  (assert-= 11 (f 4))
  (assert-= 25 (f 5))
  (assert-= 59 (f 6)))

(define (g n)
  (define (go a b c n)
    (if (= n 0) c (go (+ a (* 2 b) (* 3 c)) a b (- n 1))))
  (go 2 1 0 n))


(define-test (g-test)
  (assert-= 0 (g 0))
  (assert-= 1 (g 1))
  (assert-= 2 (g 2))
  (assert-= 4 (g 3))
  (assert-= 11 (g 4))
  (assert-= 25 (g 5))
  (assert-= 59 (g 6)))
