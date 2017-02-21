(load "lib/test-manager/load.scm")
(load "src/interfaces.scm")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) <???>) 0 coefficient-sequence))
