(load "lib/test-manager/load.scm")
(load "src/main/symbols.scm")

(define-test (exercise-2.53)
  (define s '((x1 x2) (y1 y2)))
  (assert-true (equal? s (list '(x1 x2) '(y1 y2))))
  (assert-true (equal? s (list (list 'x1 'x2) (list 'y1 'y2))))
  (assert-true (equal? (cdr s) (cdr (list (list 'x1 'x2) (list 'y1 'y2)))))
  (assert-true (equal? (cadr s) (car (cdr (list (list 'x1 'x2) (list 'y1 'y2))))))
  (assert-false (pair? (car '(a short list))))
  (assert-false (memq 'red '((red shoes) (blue socks))))
  (assert-true (equal? '(red shoes blue socks) (memq 'red '(red shoes blue socks)))))

(define-test (memq-test)
  (define x '(pear banana prune))
  (assert-false (memq 'apple x))
  (assert-true (equal? '(apple pear) (memq 'apple '(x (apple sauce) y apple pear)))))