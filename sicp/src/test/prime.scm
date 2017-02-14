
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))


;; (smallest-divisor 603)
;; (find-divisor 603 2)
;; (find-divisor 603 3)
;; 3


;; (smallest-divisor 9)
;; (find-divisor 9 2)
;; (find-divisor 9 3)
;; 3

(load "lib/test-manager/load.scm")

(define-test (smallest-divisor-test)
  (assert-= (smallest-divisor 6) 2)
  (assert-= (smallest-divisor 9) 3)
  (assert-= (smallest-divisor 11) 11))

(define-test (prime-test)
  (assert-true (prime? 2))
  (assert-true (prime? 3))
  (assert-false (prime? 6))
  (assert-true (prime? 5))
  (assert-false (prime? 6)))
