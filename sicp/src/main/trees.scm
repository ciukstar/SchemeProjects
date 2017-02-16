
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

