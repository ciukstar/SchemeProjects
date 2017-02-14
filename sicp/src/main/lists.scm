
(define (reverse lst)
  (define (go lst tail)
    (if (null? lst) tail
        (go (cdr lst) (cons (car lst) tail))))
  (go lst ()))

;; (reverse (list 1 2 3 4))
;; (go (list 1 2 3 4) ())
;; (go (list 2 3 4) (list 1))
;; (go (list 3 4) (list 2 1))
;; (go (list 4) (list 3 2 1))
;; (go () (list 4 3 2 1))
;; (list 4 3 2 1)

(define (reverse2 lst)
  (if (null? lst) ()
      (append (reverse2 (cdr lst)) (list (car lst)))))

;; (reverse2 (list 1 2 3 4))
;; (append (reverse2 (list 2 3 4)) (list 1))
;; (append (append (reverse2 (list 3 4)) (list 2)) (list 1))
;; (append (append (append (reverse2 (list 4)) (list 3)) (list 2)) (list 1))
;; (append (append (append (append (reverse2 ()) (list 4)) (list 3)) (list 2)) (list 1))
;; (append (append (append (append () (list 4)) (list 3)) (list 2)) (list 1))
;; (append (append (append (list 4) (list 3)) (list 2)) (list 1))
;; (append (append (list 4 3) (list 2)) (list 1))
;; (append (list 4 3 2) (list 1))
;; (list 4 3 2 1)

(define (append l1 l2)
  (if (null? l1) l2
      (cons (car l1) (append (cdr l1) l2))))

(define (last-pair l)
  (if (null? (cdr l)) l
      (last-pair (cdr l))))

(define (length-iter items)
  (define (go items c)
    (if (null? items) c
        (go (cdr items) (+ c 1))))
  (go items 0))

(define (length items)
  (if (null? items) 0
      (+ 1 (length (cdr items)))))

(define (list-ref items n)
  (if (= n 0) (car items)
      (list-ref (cdr items) (- n 1))))
