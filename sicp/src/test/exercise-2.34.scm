(load "lib/test-manager/load.scm")
(load "src/main/interfaces.scm")

(define-test (horner-eval-test)
  (define x (list 1 3 0 5 0 1))
  (define r (horner-eval 2 x))
  (assert-equal r (+ 1 (* 3 2) (* 5 8) (* 1 32))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ (car coefficient-sequence) 
                   (* x (horner-eval x (cdr coefficient-sequence))))) 
              0 
              coefficient-sequence))
