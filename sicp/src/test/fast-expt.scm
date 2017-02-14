
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1)))))

;; (fast-expt 2 0)
;; 1

;; (fast-expt 2 1)
;; (* 2 (fast-expt 2 0))
;; (* 2 1)
;; 2

;; (fast-expt 2 2)
;; (square (fast-expt 2 1))
;; (square (* 2 (fast-expt 2 0)))
;; (sqaure (* 2 1))
;; (square 2)
;; 4

;; (fast-expt 2 3)
;; (* 2 (fast-expt 2 2))
;; (* 2 (square (fast-expt 2 1)))
;; (* 2 (square (* 2 (fast-expt 2 0))))
;; (* 2 (square (* 2 1)))
;; (* 2 (square 2))
;; (* 2 4)
;; 8

;; (fast-expt 2 4)
;; (square (fast-expt 2 2))
;; (square (square (fast-expt 2 1)))
;; (sqaure (square (* 2 (fast-expt 2 0))))
;; (square (square (* 2 1)))
;; (square (square 2)
;; (square 4)
;; 16

;; (fast-expt 2 8)
;; (sqaure (fast-expt 2 4))
;; (square (square (fast-expt 2 2)))
;; (sqaure (square (square (fast-expt 2 1))))
;; (square (square (square (* 2 (fast-expt 2 0)))))
;; (sqaure (square (sqaure (* 2 1))))
;; (square (square (square 2)))
;; (sqaure (square 4))
;; (sqaure 16)
;; 256

;; (fast-expt 2 9)
;; (* 2 (fast-expt 2 8))
;; (* 2 (square (fast-expt 2 4)))
;; (* 2 (square (square (fast-expt 2 2))))
;; (* 2 (square (square (square (fast-expt 2 1)))))
;; (* 2 (square (square (square (* 2 (fast-expt 2 0))))))
;; (* 2 (square (square (square (* 2 1)))))
;; (* 2 (square (square (square 2))))
;; (* 2 (square (square 4)))
;; (* 2 (square 16))
;; (* 2 256)
;; 512 (10 steps)

;; (fast-expt 2 18)
;; (square (fast-expt 2 9))
;; (square (* 2 (fast-expt 2 8)))
;; (square (* 2 (square (fast-expt 2 4))))
;; (square (* 2 (square (square (fast-expt 2 2)))))
;; (square (* 2 (square (square (square (fast-expt 2 1))))))
;; (square (* 2 (square (square (square (* 2 (fast-expt 2 0)))))))
;; (square (* 2 (square (square (square (* 2 1))))))
;; (square (* 2 (square (square (square 2)))))
;; (square (* 2 (square (square 4))))
;; (square (* 2 (square 16)))
;; (square (* 2 256))
;; (square 512)
;; 262144 (12 spes)

;; (fast-expt 2 1000)
;; (square (fast-expt 2 500))
;; (square (square (fast-expt 2 250)))
;; (square (square (sqaure (fast-expt 2 125))))
;; (square (square (sqaure (* 2 (fast-expt 2 124)))))
;; (square (square (sqaure (* 2 (square (fast-expt 2 62))))))
;; (square (square (sqaure (* 2 (square (square (fast-expt 2 31)))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (fast-expt 2 30))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (fast-expt 2 15)))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (fast-expt 2 14))))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (square (fast-expt 2 7)))))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (square (* 2 (fast-expt 2 6))))))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (square (* 2 (sqaure (fast-expt 2 3)))))))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (square (* 2 (sqaure (* 2 (fast-expt 2 2))))))))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (square (* 2 (sqaure (* 2 (square (fast-expt 2 1)))))))))))))))
;; (square (square (sqaure (* 2 (square (square (* 2 (sqaure (* 2 (square (* 2 (sqaure (* 2 (square (* 2 (fast-expt 2 0))))))))))))))))