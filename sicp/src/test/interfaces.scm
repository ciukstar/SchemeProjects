(load "lib/test-manager/load.scm")
(load "src/main/interfaces.scm")

(define-test (product-of-squares-of-odd-elements)
  (define s (list 1 2 3 4 5))
  (define r (product-of-squares-of-odd-elements s))
  (assert-equal r (* 1 9 25)))

(define (product-of-squares-of-odd-elements sequence)
  (accumulate * 1 (map square (filter odd? sequence))))

(define-test (list-fib-squares-test)
  (assert-true (equal? 
                (list-fib-squares 10) 
                (list 0 1 1 4 9 25 64 169 441 1156 3025))))

(define (list-fib-squares n)
  (accumulate cons () (map square (map fib (enumerate-interval 0 n)))))

(define-test (enumerate-tree-test)
  (define t (list 1 (list 2 (list 3 4)) 5))
  (define r (enumerate-tree t))
  (assert-true (equal? r (list 1 2 3 4 5))))

(define-test (enumerate-interval-test)
  (assert-true (equal? (enumerate-interval 2 7) (list 2 3 4 5 6 7))))

(define-test (accumulate-test)
  (define x (list 1 2 3 4))
  (define s (accumulate + 0 x))
  (define p (accumulate * 1 x))
  (define l (accumulate cons () x))
  (assert-equal s (+ 1 2 3 4))
  (assert-equal p (* 1 2 3 4))
  (assert-true (equal? l x)))

(define-test (filter-test)
  (define x (list 1 2 3 4))
  (define o (filter odd? x))
  (define e (filter even? x))
  (assert-true (equal? o (list 1 3)))
  (assert-true (equal? e (list 2 4))))

(define-test (map-test)
  (define x (list 1 2 3 4))
  (define r (map square x))
  (assert-true (equal? r (list 1 4 9 16))))

(define-test (even-fibs-test)
  (assert-true (equal? (even-fibs 10) (list 0 2 8 34))))

(define (even-fibs n)
  (accumulate cons () (filter even? (map fib (enumerate-interval 0 10)))))

(define (even-fibs-0 n)
  (define (next k)
    (if (> k n) ()
        (let ((f (fib k)))
          (if (even? f) (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

(define-test (sum-odd-squares-test)
  (define t (list 1 (list 2 (list 3 4)) 5))
  (define s (sum-odd-squares t))
  (assert-equal s (+ 1 9 25)))

(define (sum-odd-squares tree)
  (accumulate + 0 (map square (filter odd? (enumerate-tree tree)))))

(define (sum-odd-squares-0 tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))
