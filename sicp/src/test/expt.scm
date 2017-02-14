
(define (expt b n) 
  (if (= n 0) 1 (* b (expt b (- n 1)))))



;; (expt 2 9)
;; (* 2 (expt 2 8))
;; (* 2 (* 2 (expt 2 7)))
;; (* 2 (* 2 (* 2 (expt 2 6))))
;; (* 2 (* 2 (* 2 (* 2 (expt 2 5)))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (expt 2 4))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt 2 3)))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt 2 2))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt 2 1)))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt 2 0))))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 1)))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 4)))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 8))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 16)))))
;; (* 2 (* 2 (* 2 (* 2 32))))
;; (* 2 (* 2 (* 2 64)))
;; (* 2 (* 2 128))
;; (* 2 256)
;; 512




(load "lib/test-manager/load.scm")

(define-test (expt-test)
  (assert-equal (expt 5 0) 1)
  (assert-equal (expt 2 3) 8)
  (assert-equal (expt 4 2) 16))

;; (expt 5 0)
;; 1

;; (expt 2 3)
;; (* 2 (expt 2 2))
;; (* 2 (* 2 (expt 2 1)))
;; (* 2 (* 2 (* 2 (expt 2 0))))
;; (* 2 (* 2 (* 2 1)))
;; (* 2 (* 2 2))
;; (* 2 4)
;; 8

;; (expt 4 2)
;; (* 4 (expt 4 1))
;; (* 4 (* 4 (exp 4 0)))
;; (* 4 (* 4 1))
;; (* 4 4)
;; 16

(define (expti b n)
  (define (go p c)
    (if (= c 0) p (go (* p b) (- c 1))))
  (go 1 n))

;; (expti 2 3)
;; (go 1 3)
;; (go 2 2)
;; (go 4 1)
;; (go 8 0)
;; 8

(define-test (expi-test)
  (assert-= (expti 5 0) 1)
  (assert-= (expti 2 3) 8)
  (assert-= (expti 4 2) 16))
