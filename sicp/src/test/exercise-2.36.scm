(load "lib/test-manager/load.scm")
(load "src/main/interfaces.scm")

(define-test (accumulate-n-test)
  (define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
  (define r (accumulate-n + 0 s))
  (assert-true (equal? r (list 22 26 30))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs)) ()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

