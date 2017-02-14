
(define (add-rat x y)
  (mk-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y))))

(define (sub-rat x y)
  (mk-rat (- (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y))))

(define (mul-rat x y)
  (mk-rat (* (numer x) (numer y)) (* (denom x) (denom y))))

(define (div-rat x y)
  (mk-rat (* (numer x) (denom y)) (* (denom x) (numer y))))

(define (mk-rat a b)
  (define (gcd x y) (if (= y 0) x (gcd y (remainder x y))))
  (let ((g (gcd a b)))
    (cons (/ a g) (/ b g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (equal-rat? x y)
  (= (* (numer x) (denom y)) (* (numer y) (denom x))))

(define (print-rat x) 
  (newline) (display (numer x)) (display "/") (display (denom x)))
