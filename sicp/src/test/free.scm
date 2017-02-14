
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a)) (* y b) (* a b)))
  (f-helper (+ 1 (* x y)) (- 1 y)))

(define (f2 x y)
  ((lambda (a b) (+ (* x (square a)) (* y b) (* a b)))
   (+ 1 (* x y)) (- 1 y)))

(define (f3 x y)
  (let ((a (+ 1 (* x y))) (b (- 1 y)))
    (+ (* x (square a)) (* y b) (* a b))))

(define (f4 x)
  (let ((x 3) (y (+ x 2))) (* x y)))

(define (f5 x) 
  ((lambda (a b) (* a b)) 3 (+ x 2)))
