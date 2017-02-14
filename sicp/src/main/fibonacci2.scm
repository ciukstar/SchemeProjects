
(define (fib n)
  (go 1 0 n))

(define (go a b count)
  (if (= count 0) b (go (+ a b) a (- count 1))))

;; (fib 5)
;; (go 1 0 5)
;; (go 1 1 4)
;; (go 2 1 3)
;; (go 3 2 2)
;; (go 5 3 1)
;; (go 8 5 0)
;; 5

;; a <- a + b
;; b <- a
