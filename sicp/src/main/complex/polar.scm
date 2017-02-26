(load "src/main/complex/tags.scm")

(define (magnitude-polar z) (car z))

(define (angle-polar z) (cdr z))

(define (real-part-polar z)
  (* (magnitude z) (cos (angle z))))

(define (imag-part-polar z)
  (* (magnitude z) (sin (angle z))))

(define (make-from-mag-ang-polar r a)
  (attach-tag 'polar (cons r a)))

(define (make-from-real-imag x y)
  (attach-tag 'polar 
              (cons (sqrt (+ (square x) (square y))) 
                    (atan y x))))
