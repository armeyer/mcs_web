(define (bin-gcd a b)                   ;a, b > 0
  (define (div2 x y e)                  ;x=a/e, y=b/e
    (if (and (even? x) (even? y))
        (div2 (/ x 2) (/ y 2) (* 2 e))
        (let ((a/e (/ a e))             ;x, y not both even
              (b/e (/ b e)))
                                        ;x = (ux, vx) dot (a/e, b/e)
                                        ;y = (uy, vy) dot (a/e, b/e)
          (define (loop x ux vx y uy vy)
            (cond
             ((even? x)
              (if (and (even? ux) (even? vx))
                  (loop (/ x 2) (/ ux 2) (/ vx 2)
                        y uy vy)
                                        ;ux-b/e and vx+a/e are even
                  (loop (/ x 2) (/ (- ux b/e) 2) (/ (+ vx a/e) 2)
                        y uy vy)))
             ((even? y)
              (if (and (even? uy) (even? vy))
                  (loop x ux vx
                        (/ y 2) (/ uy 2) (/ vy 2))
                                        ;uy-b/e and vy+a/e are even
                  (loop x ux vx
                        (/ y 2) (/ (- uy b/e) 2) (/ (+ vy a/e) 2))))
             ((> x y)
              (loop (- x y) (- ux uy) (- vx vy) y uy vy))
             ((< x y)                   ;(loop y uy vy x ux vx)
              (loop  x ux vx (- y x) (- uy ux) (- vy vx)))
             (else                      ; x = y
              (list 'gcd (* e x)  'a a  'b b  'ux ux  'vx vx  'uy uy  'vy vy))))
          (loop x 1 0 y 0 1))))
  (div2 a b 1))
;========================

(define (dot a b u v)
  (+ (* u a) (* v b)))

;(bin-gcd 3 5)
;Value 26: (gcd 1 a 3 b 5 ux 2 vx -1 uy -3 vy 2)

;(bin-gcd (* 2 2 2) (* 2 2 2 2 2) )
;Value 44: (gcd 8 a 8 b 32 ux 1 vx 0 uy -3 vy 1)

;(bin-gcd (* 2 2 2 3 3 5 7 11 11) (* 2 2 2 2))
;Value 38: (gcd 8 a 304920 b 16 ux -1 vx 19058 uy -1 vy 19058)

;(bin-gcd (* 3 3 5 7 11 11) (* 2 2 2 2 3 3 3 3 11))
;Value 21: (gcd 99 a 38115 b 14256 ux -5567 vx 14884 uy -4991 vy 13344)

;(bin-gcd (* 2 2 2 3 3 5 7 11 11) (* 2 2 2 2 3 3 3 3 11))
;Value 26: (gcd 792 a 304920 b 14256 ux -221 vx 4727 uy -1427 vy 30522)





