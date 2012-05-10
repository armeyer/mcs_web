;chernoff.scm

(define (beta c)
  (+ (* c (log c)) (- c) 1))

(define (ebeta c)
  (exp (- (beta c))))

;(expt (ebeta 3/2) 111/4)
;Value: .04966349489083584