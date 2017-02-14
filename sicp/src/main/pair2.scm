
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;; (cdr (cons 4 5))
;; (cdr (lambda (m) (m 4 5)))
;; ((lambda (m) (m 4 5)) (lambda (p q) q))
;; (lambda (4 5) 5)
;; 5



;; (car (cons 2 3))
;; (car (lambda (m) (m 2 3)))
;; ((lambda (m) (m 2 3)) (lambda (p q) p))
;; (lambda (2 3) 2)
;; 2
