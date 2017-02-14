(load "lib/test-manager/load.scm")
(load "src/main/lists.scm")

(define-test (reverse-test)
  (let ((l (list 1 4 9 16 25)))
    (let ((r (reverse l)))
      (assert-true (and
                    (= (list-ref r 0) 25)
                    (= (list-ref r 1) 16)
                    (= (list-ref r 2) 9)
                    (= (list-ref r 3) 4)
                    (= (list-ref r 4) 1))))))

(define-test (last-pair-test)
  (let ((l (list 23 72 149 34)))
    (let ((lst (last-pair l)) (singleton (list 32)))
      (assert-true (and 
                    (= (length lst) 1)
                    (= (car lst) 34)))
      (assert-equal (car (last-pair singleton)) 32))))

(define-test (append-test)
  (let ((l1 (list 1 2 3)) (l2 (list 4 5 6)))
    (let ((l (append l1 l2)))
      (assert-true (and
                    (= (list-ref l 0) 1)
                    (= (list-ref l 1) 2)
                    (= (list-ref l 2) 3)
                    (= (list-ref l 3) 4)
                    (= (list-ref l 4) 5)
                    (= (list-ref l 5) 6))))))

(define-test (length-test)
  (let ((l (list 1 2 3 4)))
    (assert-equal (length l) 4)
    (assert-equal (length-iter l) 4)))

(define-test (list-ref-test)
  (let ((l (list 1 2 3 4)))
    (assert-equal (list-ref l 0) 1)
    (assert-equal (list-ref l 1) 2)
    (assert-equal (list-ref l 2) 3)
    (assert-equal (list-ref l 3) 4)))
