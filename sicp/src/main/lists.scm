
(define (same-parity x . t)
  (let ((parity (remainder x 2)))
    (cond ((null? t) ())
          ((if (= (remainder (car t) 2) parity) (cons (car t) (same-parity x . (cdr t)))
               (same-parity x . (cdr t)))))))

(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t) 
        ((or (null? l1) (null? l2) (not (= (car l1) (car l2)))) #f)
        (else (equal? (cdr l1) (cdr l2)))))

(define (reverse lst)
  (define (go lst tail)
    (if (null? lst) tail
        (go (cdr lst) (cons (car lst) tail))))
  (go lst ()))

(define (reverse2 lst)
  (if (null? lst) ()
      (append (reverse2 (cdr lst)) (list (car lst)))))

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
