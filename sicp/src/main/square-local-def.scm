
(define (sqrt x)
  (define (improve guess)
    (+ (/ guess 2) (/ x (* 2 guess))))
  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) 0.001))
  (define (go guess) 
    (if (good-enough? guess) guess (go (improve guess))))
  (go 1.0))
