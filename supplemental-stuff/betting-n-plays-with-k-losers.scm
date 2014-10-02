;betting-n-plays-with-k-losers.scm
;           Earning multiple using n plays with m losers


(define (v0 n) (expt 2 n)) ;in n plays with no losers, double your stake n times

(define (v m n)           ;guaranteed earning multiple using n plays with m losers
  (cond ((< n m) (v n m))
	((= m 0) (v0 n))
	((= m n) (v (- n 1) n))
	(else (* (+ 1 (alpha m n))
		 (v m (- n 1))))))

(define (alpha m n)           ;fraction of stake to bet so win/lose return is constant
  (let ((hitm (v (- m 1) n))
	(hitn (v m (- n 1))))
    (/ (- hitm hitn)
       (+ hitm hitn))))

(define (v1 n)
  (/ (v0 (+ n 1)) (+ n 1)))

(define (alpha2 n)
  (/ (- n 2) (+ n 2)))

(define (v2 n)
  (/ (expt 2 (+ n 3))
     (* (+ n 1) (+ n 2))))

(define (alpha3 n)
  (/ (- n 3) (+ n 3)))

(define (vnk n k)
  (/ (* (fact k) (fact n) (expt 2 (+ n k)))
     (fact (+ n k)))) 

;================  utilities

(define (fact n)
  (define (faux n m)
    (if (< n 1) m
	(faux (- n 1) (* n m))))
    (faux n 1))

(define e-nat (exp 1))

(define pi (* 4 (atan 1)))

(define (stirling n)
  (* (sqrt (* 2 pi n))
     (expt (/ n e-nat) n)))

;(/ (stirling 10) (fact 10))  ;;99% accurate

(define (stir-vnk n k)    ;approx vnk using stirling
  (/ (* (stirling k) (stirling n) (expt 2 (+ n k)))
     (stirling (+ n k))))

;(/ (stir-vnk 15 15) (vnk 15 15))   ;;99% accurate

(define (estimate-vnn n)  ;vnk(n, n) asymp n*pi
  (sqrt (* n pi)))

;(/ (estimate-vnn 15) (vnk 15 15))  ;;99% accurate

