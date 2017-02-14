
(define (width z)
  (/ (- (upper-bound z) (lower-bound z)) 2.0))

(define (add-interval x y)
  (mk-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (mk-interval (- (lower-bound x) (lower-bound y)) (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (mk-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (= (span y) 0) (error "Divisor may not be 0") 
      (mul-interval x (reciprocal-interval y))))

(define (span x)
  (- (upper-bound x) (lower-bound x)))

(define (reciprocal-interval z)
  (mk-interval (/ 1.0 (upper-bound z)) (/ 1.0 (lower-bound z))))

(define (equal-interval? x y)
  (and (= (lower-bound x) (lower-bound y)) (= (upper-bound x) (upper-bound y))))

(define (mk-interval a b) (cons a b))

(define (lower-bound z) (car z))

(define (upper-bound z) (cdr z))
