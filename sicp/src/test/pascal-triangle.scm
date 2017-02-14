
(define (p n k)
  (cond ((and (= n 0) (= k 0)) 1)
        ((or (= k 0) (= k n)) 1)
        (else (+ (p (- n 1) (- k 1)) (p (- n 1) k)))))

;; (p 2 0)
;; ()
