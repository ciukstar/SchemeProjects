
(define (for-each proc items)
  (if (null? items) #t
      (if ((lambda (x) #t) (proc (car items)))
       (for-each proc (cdr items)))))

;; (for-each display (list 1 2 3 4))
;; (display 1) (for-each diplay (list 2 3 4))

(define (square-list-iter-reverse2 items)
  (define (iter things answer)
    (if (null? things) answer
        (iter (cdr things) (cons answer (square (car things))))))
  (iter items ()))

;; (square-list-iter-reverse (list 1 2 3 4))
;; (iter (list 1 2 3 4) ())
;; (iter (list 2 3 4) (cons () (square 1)))
;; (iter (list 3 4) (cons (cons () (square 1)) (square 2)))
;; (iter (list 4) (cons (cons (cons () (square 1)) (square 2)) (square 3)))
;; (iter () (cons (cons (cons (cons () (square 1)) (square 2)) (square 3)) (square 4)))
;; (cons (cons (cons (cons () (square 1)) (square 2)) (square 3)) (square 4))

(define (square-list-iter-reverse items)
  (define (iter things answer)
    (if (null? things) answer
        (iter (cdr things) (cons (square (car things)) answer))))
  (iter items ()))

;; (square-list-iter (list 1 2 3 4))
;; (iter (list 1 2 3 4) ())
;; (iter (list 2 3 4) (cons (square 1) ()))
;; (iter (list 3 4) (cons (square 2)) (cons (square 1) ()))
;; (iter (list 4) (cons (square 3) (cons (square 2)) (cons (square 1) ())))
;; (iter () (cons (square 4) (cons (square 3) (cons (square 2)) (cons (square 1) ()))))
;; (cons (square 4) (cons (square 3) (cons (square 2)) (cons (square 1) ())))
;; (list 16 9 2 1)

(define (square-list l)
  (map square l))

;; (square-list (list 1 2 3 4))
;; (map square (list 1 2 3 4))
;;; (cons (square 1) (map square (list 2 3 4)))
;; (cons (square 1) (cons (square 2) (map square (list 3 4))))
;; (cons (square 1) (cons (square 2) (cons (square 3) (map square (list 4)))))
;; (cons (square 1) (cons (square 2) (cons (square 3) (cons (square 4) (map square ())))))
;; (cons (square 1) (cons (square 2) (cons (square 3) (cons (square 4) ()))))


(define (square-list0 l)
  (if (null? l) ()
      (cons (square (car l)) (square-list0 (cdr l)))))

;; (square-list0 (list 1 2 3 4))
;; (cons (square 1) (square-list0 (list 2 3 4)))
;; (cons (square 1) (cons (square 2) (square-list0 (list 3 4))))
;; (cons (square 1) (cons (square 2) (cons (square 3) (square-list0 (list 4)))))
;; (cons (square 1) (cons (square 2) (cons (square 3) (cons (square 4) ()))))
;; (cons 1 (cons 4 (cons 9 16)))
;; (cons 1 (list 4 9 16))
;; (list 1 4 9 16)

(define (map proc items)
  (if (null? items) ()
      (cons (proc (car items)) (map proc (cdr items)))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))
