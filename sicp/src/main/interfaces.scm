
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) ())
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (map fun sequence)
  (if (null? sequence) ()
      (cons (fun (car sequence)) (map fun (cdr sequence)))))

(define (even-fibs n)
  (define (next k)
    (if (> k n) ()
        (let ((f (fib k)))
          (if (even? f) (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))


(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))
