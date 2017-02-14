
(define (cube a)
  (* a a a))

(define (sum-integers a b)
  (sum identity a inc b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2)))) a (lambda (x) (+ x 2)) b))

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a) (sum term (next a) next b))))

(define (inc a) (+ a 1))
(define (identity a) a)

(define (integral f a b dx)
  (* (sum f a (+ a (/ dx 2.0)) (lambda (x) (+ x dx)) b) dx))


;; (sum-integers 3 9)
;; (+ 3 (sum-integers 4 9))
;; (+ 3 (+ 4 (sum-integers 5 9)))
;; (+ 3 (+ 4 (+ 5 (sum-integers 6 9))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (sum-integers 7 9)))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (sum-integers 8 9))))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (+ 8 (sum-integers 9 9)))))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (+ 8 (+ 9 (sum-integers 10 9)))))))) O(n)
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (+ 8 (+ 9 0)))))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (+ 8 9))))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 17)))))
;; (+ 3 (+ 4 (+ 5 (+ 6 24))))
;; (+ 3 (+ 4 (+ 5 30)))
;; (+ 3 (+ 4 35))
;; (+ 3 39)
;; 42


;; (sum-cubes 3 7)
;; (+ (cube 3) (sum-cubes 4 7))
;; (+ (cube 3) (+ (cube 4) (sum-cubes 5 7)))
;; (+ (cube 3) (+ (cube 4) (+ (cube 5) (sum-cubes 6 7))))
;; (+ (cube 3) (+ (cube 4) (+ (cube 5) (+ (cube 6) (sum-cubes 7 7)))))
;; (+ (cube 3) (+ (cube 4) (+ (cube 5) (+ (cube 6) (sum-cubes 7 7)))))
;; (+ (cube 3) (+ (cube 4) (+ (cube 5) (+ (cube 6) (+ (cube 7) (sum-cubes 8 7))))))



(load "lib/test-manager/load.scm")

(define-test (sum-integers-test)
  (assert-= (sum-integers 3 9) 42))

