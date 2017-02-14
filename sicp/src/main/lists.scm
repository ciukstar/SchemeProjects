
(define (length-iter items)
  (define (go items c)
    (if (null? items) c
        (go (cdr items) (+ c 1))))
  (go items 0))

;; (lenght-iter (list 1 2 3 4))
;; (go (list 1 2 3 4) 0)
;; (go (list 2 3 4) 1)
;; (go (list 3 4) 2)
;; (go (list 4) 3)
;; (go () 4)
;; 4

(define (length items)
  (if (null? items) 0
      (+ 1 (length (cdr items)))))

;; (length (list 1 2 3 4))
;; (+ 1 (length (list 2 3 4)))
;; (+ 1 (+ 1 (length (list 3 4))))
;; (+ 1 (+ 1 (+ 1 (length (list 4)))))
;; (+ 1 (+ 1 (+ 1 (+ 1 (length ())))))
;; (+ 1 (+ 1 (+ 1 (+ 1 0))))
;; (+ 1 (+ 1 (+ 1 1)))
;; (+ 1 (+ 1 2))
;; (+ 1 3)
;; 4


(define (list-ref items n)
  (if (= n 0) (car items)
      (list-ref (cdr items) (- n 1))))

;; (list-ref (list 1 2 3 4) 3)
;; (list-ref (cdr (list 1 2 3 4)) (- 3 1))
;; (list-ref (list 2 3 4) 2)
;; (list-ref (cdr (list 2 3 4)) (- 2 1))
;; (list-ref (list 3 4) 1)
;; (list-ref (cdr (list 3 4)) (- 1 1))
;; (list-ref (list 4) 0)
;; (car (list 4))
;; 4

;; (list-ref (list 1 2) 2)
;; (list-ref (cdr (list 1 2)) (- 2 1))
;; (list-ref (list 2) 1)
;; (list-ref (cdr (list 2)) (- 1 1))
;; (list-ref () 0)
;; (car ())?????
