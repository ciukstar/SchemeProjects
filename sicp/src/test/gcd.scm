
(load "lib/test-manager/load.scm")

(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))


(define-test (gcd-test)
  (assert-equal (gcd 3 2) 1)
  (assert-equal (gcd 6 4) 2))


;; (gcd 206 40)
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (gcd (remainder 206 40) (remainder 40 6))
;; (gcd 6 4)
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; 2


;; (gcd 206 40)
;; (gcd 40 (remainder 206 40))
;; (gcd 40 6)
;; (gcd 6 (remainder 40 6))
;; (gcd 6 4)
;; (gcd 4 (remainder 6 4))
;; (gcd 4 2)
;; (gcd 2 (remainder 4 2))
;; (gcd 2 0)
;; 2

;; (gcd 12 8)
;; (gcd 8 4)
;; (gcd 4 0)
;; 4
