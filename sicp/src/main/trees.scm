
(define (subsets s)
  (if (null? s) (list ())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

;; (subsets (list 1 2 3))
;; (let ((rest (subsets (list 2 3)))) (append rest (map (lambda ()) rest)))
;; (let ((rest (let ((rest (subsets (list 3)))) (append rest (map ??? rest))))) (append rest (map ??? rest)))
;; (let ((rest (let ((rest (let ((rest (subsets ()))) (append rest (map ??? rest))))))) (append rest (map ??? rest))))) (append rest (map ??? rest))
;; (let ((rest (let ((rest (let ((rest (list ()))) (append rest (map ??? rest))))))) (append rest (map ??? rest))))) (append rest (map ??? rest)))


(define (map f x)
  (if (null? x) ()
      (cons (f (car x)) (map f (cdr x)))))


(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree))) 
       tree))

(define (square-tree2 x) (tree-map square x))

(define (square-tree x)
  (cond ((null? x) ())
        ((not (pair? x)) (square x))
        (else (cons (square-tree (car x)) (square-tree (cdr x))))))

(define (scale-tree2 x factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree2 sub-tree factor)
             (* sub-tree factor))) x))

(define (scale-tree tree factor) 
  (cond ((null? tree) ())
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))


(define (fringe x)
  (define (go l a)
    (cond ((null? l) a)
          ((not (pair? l)) (cons l a))
          (else (append (go (car l) a) (go (cdr l) a)))))
  (go x ()))

;; (fringe (list (list 1 2) (list 3 4)))
;; (fringe (cons (cons 1 (cons 2 ())) (cons (cons 3 (cons 4 ())) ())))
;; (go (cons (cons 1 (cons 2 ())) (cons (cons 3 (cons 4 ())) ())) ())
;; (go )

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

