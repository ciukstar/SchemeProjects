
(define (factorial-rec n)
  (if (= n 1) 1 (* n (factorial (- n 1)))))

;; (factorial 6)
;; (* 6 (factorial 5))
;; (* 6 (* 5 (factorial 4)))
;; (* 6 (* 5 (* 4 (factorial 3))))
;; (* 6 (* 5 (* 4 (* 3 (factorial 2)))))
;; (* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))
;; (* 6 (* 5 (* 4 (* 3 (* 2 1)))))
;; (* 6 (* 5 (* 4 (* 3 2))))
;; (* 6 (* 5 (* 4 6)))
;; (* 6 (* 5 24))
;; (* 6 120)
;; 720

(define (factorial-iter n)
  (fact-iter 1 1 6))

(define (fact-iter product counter max-count)
  (if (> counter max-count) product (fact-iter (* counter product) (+ counter 1) (max-count))))

;; (factorial 6)
;; (fact-iter 1 1 6)
;; (fact-iter 1 2 6)
;; (fact-iter 2 3 6)
;; (fact-iter 6 4 6)
;; (fact-iter 24 5 6)
;; (fact-iter 120 6 6)
;; (fact-iter 720 7 6)
;; 720
