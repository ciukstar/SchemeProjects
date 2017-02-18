
(define (fringe x))

(define (deep-reverse x)
  (define (go items tail)
    (cond ((null? items) tail)
          ((not (pair? items)) items)
          (else (go (cdr items) (cons (go (car items) ()) tail)))))
  (go x ()))

(define (reverse x)
  (define (go items tail)
    (if (null? items) tail
        (go (cdr items) (cons (car items) tail))))
  (go x ()))

;; (reverse (list 1 2 3 4))
;; (go (list 1 2 3 4) ())
;; (go (list 2 3 4) (cons 1 ()))
;; (go (list 3 4) (cons 2 (cons 1 ())))
;; (go (list 4) (cons 3 (cons 2 (cons 1 ()))))
;; (go () (cons 4 (cons 3 (cons 2 (cons 1 ())))))
;; (cons 4 (cons 3 (cons 2 (cons 1 ()))))
;; (cons 4 (cons 3 (list 2 1)))
;; (cons 4 (list 3 2 1))
;; (list 4 3 2 1)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

;; (cnt (cons (list 1 2) (list 3 4)))
;; (cnt (cons (cons 1 (cons 2 ())) (cons 3 (cons 4 ()))))
;; (+ (cnt (cons 1 (cons 2 ()))) (cnt (cons 3 (cons 4 ()))))
;; (+ (+ (cnt 1) (cnt (cons 2 ()))) (+ (cnt 3) (cnt (cons 4 ()))))
;; (+ (+ 1 (+ (cnt 2) (cnt ()))) (+ 1 (+ (cnt 4) (cnt ()))))
;; (+ (+ 1 (+ 1 0)) (+ 1 (+ 1 0)))
;; (+ (+ 1 1) (+ 1 1))
;; (+ 2 2)
;; 4

