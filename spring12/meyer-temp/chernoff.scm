;chernoff.scm

(define (beta c)
  (+ (* c (log c)) (- c) 1))

(define (ebeta c)
  (exp (- (beta c))))

;(pp (map (lambda (x) (list (cons 'beta x) (beta x)))
;	 '(1 1.01 1.02 1.05 1.1 1.2 1.3 1.5 1.6 1.9 2 2.2 2.7 3 4 8 20 50 100)))

;(pp (map (lambda (x) (list (cons 'ebeta x) (ebeta x)))
;	 '(1 1.01 1.02 1.05 1.1 1.2 1.3 1.5 1.6 1.9 2 2.2 2.7 3 4 8 20 50 100)))