
(define (sqrt x) 
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess r)
  (if (good-enough? guess r) guess (sqrt-iter (improve guess r) r)))

; x(n+1) = x(n)/2 + radicant/(2*x(n))
(define (improve guess r)
  (+ (/ guess 2) (/ r (* 2 guess))))

; |guess^2 - r| < .001
(define (good-enough? guess r)
  (< (abs (- (square guess) r)) .001))


