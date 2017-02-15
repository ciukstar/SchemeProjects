
(define (same-parity x . t)
  (let ((parity (remainder x 2)))
    (define (go l)
      (cond ((null? l) ())
            ((= (remainder (car l) 2) parity) (cons (car l) (go (cdr l))))
            (else (go (cdr l)))))
    (go (cons x t))))

;; (same-parity 1 2 3 4 5 6 7)
;; (go (list 1 2 3 4 5 6 7))
;; (cons 1 (go (list 2 3 4 5 6 7)))
;; (cons 1 (go (list 3 4 5 6 7)))
;; (cons 1 (cons (3 (go (list 4 5 6 7)))))
;; (cons 1 (cons (3 (go (list 5 6 7)))))
;; (cons 1 (cons (3 (cons 5 (go (list 6 7))))))
;; (cons 1 (cons (3 (cons 5 (go (list 7))))))
;; (cons 1 (cons (3 (cons 5 (cons 7 (go ()))))))
;; (cons 1 (cons (3 (cons 5 (cons 7 ())))))
;; (cons 1 (cons (3 (cons 5 7))))
;; (cons 1 (list 3 5 7)))
;; (list 1 3 5 7)

(define (same-parity2 a . z)
  (define (iter items answer)
    (if (null? items) answer
        (iter (cdr items)
              (if (= (remainder (car items) 2) (remainder a 2)) 
                  (append answer (list (car items)))
                  answer))))
  (iter z (list a)))

;; (same-parity2 1 2 3 4 5 6 7)
;; (iter (list 2 3 4 5 6 7) (list 1))
;; (iter (list 3 4 5 6 7) (list 1))
;; (iter (list 4 5 6 7) (list 1 3))
;; (iter (list 5 6 7) (list 1 3))
;; (iter (list 6 7) (list 1 3 5))
;; (iter (list 7) (list 1 3 5))
;; (iter () (list 1 3 5 7))
;; (list 1 3 5 7)


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
