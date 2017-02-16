
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

;; (count-leaves (cons (list 1 2) (list 3 4)))
;; (count-leaves (cons (cons 1 (cons 2 ())) (cons 3 (cons 4 ()))))
;; (count-leaves (+ (count-leaves (cons 1 (cons 2 ()))) (count-leaves (cons 3 (cons 4 ())))))
;; (count-leaves (+ (count-leaves (+ (count-leaves 1) (count-leaves (cons 2 ())))) (count-leaves (+ (count-leaves 3) (count-leaves (cons 4 ()))))))
;; (count-leaves (+ (count-leaves (+ 1 (count-leaves (+ (count-leaves 2) (count-leaves ()))))) (count-leaves (+ 1 (count-leaves (+ (count-leaves 4) (count-leaves ())))))))
;; (count-leaves (+ (count-leaves (+ 1 (count-leaves (+ 1 0)))) (count-leaves (+ 1 (count-leaves (+ 1 0))))))
;; (count-leaves (+ (count-leaves 2) (count-leaves 2)))
;; (count-leaves (+ (count-leaves 2) (count-leaves 2)))

