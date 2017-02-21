(load "lib/test-manager/load.scm")
(load "src/main/interfaces.scm")

(define-test (length-with-accumulate-test)
  (define s (list 1 2 3 4))
  (define r (length-with-accumulate s))
  (define e (length s))
  (assert-equal r e))

(define (length-with-accumulate sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define-test (append-with-accumulate-test)
  (define s1 (list 1 2 3))
  (define s2 (list 4 5 6))
  (define r (append-with-accumulate s1 s2))
  (assert-true (equal? r (append s1 s2))))

(define (append-with-accumulate seq1 seq2)
  (accumulate cons seq2 seq1))

(define-test (map-alt-test)
  (define s (list 1 2 3))
  (define r (map-with-accumulate square s))
  (assert-true (equal? r (map square s))))

(define (map-with-accumulate p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) () sequence))

