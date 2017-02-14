
;; (load "lib/test-manager/load.scm")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) .001))

(define (improve guess x)
  (+ (/ guess 2) (/ x (* 2 guess))))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 x))
