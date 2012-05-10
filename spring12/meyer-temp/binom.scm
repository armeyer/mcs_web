(define (falling a m)
  (define (fallp a m p)
    (cond ((< m 0) 0)
          ((= m 0) p)
          (else (fallp (- a 1) (- m 1) (* a p)))))
  (fallp a m 1))
    
(define (factorial n)
  (falling n n))

;(define (comb n m)
;  (if (< m 0) 0
;  (/ (falling n m) (factorial m))))
;  (exact->inexact (/ (falling n m) (factorial m))))
  
(define (comb n m)
  (cond ((< n m) 0)
        ((= m 0) 1)
        (else (* (/ n m) (comb (- n 1) (- m 1))))))

 
;(define multi
;  (lambda n l
;    <fill in>
;    ))

#|
(define (binom n k p)
  (* (comb n k)
     (expt p k) (expt (- 1 p) (- n k))))
|#

(define (binom n k p)
  (let ((q (- 1 p)))
    (define (iter n k r)
      (cond ((< n k) 0)
            ((= k 0) (* r (expt q n)))
            (else (iter (- n 1) (- k 1) 
             (* (/ n k) p r)))))
    (iter n k 1)))

(define (binom-between n p i j)
  (define (b l)
    (if (> l j)
	0
	(+ (binom n l p) (b (+ l 1)))))
  (list i j (b i)))

(define (central-coeff n p)
  (binom n (floor (/ n 2)) p))
  
(define (search n f)
  (binom-between n
		 0.5
		 (inexact->exact (ceiling (* n (- 0.5 f))))
		 (inexact->exact (floor (* n (+ 0.5 f))))))

(define (search2 n f)
   (binom-between n
		  1/2
		  (inexact->exact (floor (* n (- 0.5 f))))
		  (inexact->exact (ceiling (* n (+ 0.5 f))))))

(define (t n p eps)
  (binom-between n
		 p
		 (inexact->exact (ceiling (* n (- p eps))))
		 (inexact->exact (floor (* n (+ p eps))))))

(define (poisson l k)
  (* (/ (expt l k)(factorial k)) (exp ( - l))))


(define (log2 a) (/ (log a) (log 2)))

(define pi (* 4 (atan 1)))

(define (h a)
  (cond ((>= 0 a) 1)
        ((>= a 1) 1)
        (else (- (+ (* a (log2 a)) (* (- 1 a) (log2 (- 1 a))))))))

(define (approx-binom n alpha p)
  (let ((beta (- 1 alpha))
        (q (- 1 p)))
    (* (/ (expt 2 (* n (H alpha))) (sqrt (* 2 pi alpha beta n)))
       (expt p (* alpha n))
       (expt q (* beta n)))))

(define ab approx-binom)

(define (approx-binom-cum n alpha p)    ;0 < p < alpha
  (* (/ (- 1 alpha) (- 1 (/ alpha p)))
     (approx-binom n alpha p)))

(define (beta-chernoff c)
  (+ (* c (log c)) (- c) 1))

#|

(define abc approx-binom-cum)

 (+ (h 0.98) (log (expt 0.99 0.98)) (log2 (expt 0.01 0.02)))

(define e 0.04)

(let ((e 0.04))
  (/ (+ 1 (* 2 e)) (* 2 e)))

(let ((e 0.04))
  (- 1 (h (- 1/2 e))))

(sqrt (* 2 pi (- 1/4 (* e e))))

(define (g n)
  (let ((e 0.04))
    (- 1
       (* (/ (+ 1 (* 2 e)) (* 2 e)
	     (sqrt (* 2 pi (- 1/4 (* e e))))
	     (expt 2 (* n (- 1 (h (- 1/2 e)))))
	     (sqrt n))))))

(define (s n)
  (search n 0.04))

(define (search2 n f)
   (binom-between n
		  1/2
		  (inexact->exact (floor (* n (- 0.5 f))))
		  (inexact->exact (ceiling (* n (+ 0.5 f))))))

(define (s2 n)
  (search2 n 0.04))

(S2 600)

(S2 572)

(S2 573)

(map s2 '(570 571 572 573 574 575 576 577 578 579
	      580 581 582 583 584 585 586 587 588 589))

(map g '(570 571 572 573 574 575 576 577 578 579
	      580 581 582 583 584 585 586 587 588 589))

(map g '(570 571 572 573 574 575 576 577 578 579
	      580 581 582 583 584 585 586 587 588 589))

(pp (map s '(570 571 572 573 574 575 576 577 578 579
	     580 581 582 583 584 585 586 587 588 589
	     590 591 592 593 594 595 596 597 598 599
	     600 601 602 603 604 605 606 607 608 609
	     610 611 612 613 614 615 616 617 618 619
	     620 621 622 623 624 625 626 627 628 629
	     630 631 632 633 634 635 636 637 638 639
	     640 641 642 643 644 645 646 647 648 649
	     650 651 652 653 654 655 656 657 658 659
	     660 661 662 663 664 665 666 667 668 669)))


(define (g3 n)
  (let ((e 0.03))
    (- 1
       (* (/ (+ 1 (* 2 e)) (* 2 e)
	     (sqrt (* 2 pi (- 1/4 (* e e))))
	     (expt 2 (* n (- 1 (h (- 1/2 e)))))
	     (sqrt n))))))

(g3 2000)

(g3 1500)

(g3 1200)

(define (comb n m)
  (define (c n m p)
    (if (< m 1) p
	(c (- n 1) (- m 1) (* p (exact->inexact (/ n m) )))))
  (c n m 1))

(define (pr n eps)
  (* (/ (+ 1 (* 2 eps)) (* 2 eps)
	     (sqrt (* 2 pi (- 1/4 (* eps eps))))
	     (expt 2 (* n (- 1 (h (- 1/2 eps)))))
	     (sqrt n))))

(define (binom n k p)
  (let ((q (- 1 p)))
    (define (iter n k ps qs prod)
      (if (< k 1) (* prod (expt p ps) (expt q qs))
	  (let ((new-prod (* prod (/ n k))))
	    (if (< 100000000 new-prod)
		(iter (- n 1) (- k 1) ps qs new-prod)
		(if (<= 1 ps)
		    (iter (- n 1) (- k 1) (- ps 1) qs (* p new-prod))
		    (if (<= 1 qs)
			(iter (- n 1) (- k 1) 0 (- qs 1) (* q new-prod))
			(iter (- n 1) (- k 1) 0 0 new-prod)))))))
    (iter n k k (- n k) 1)))

(binom 4 1 1/2)

(beta (* 1/2 (exp 1)))

(+ 1 (* (exp 1) 1/2 (log 1/2)))

(define (chernoff mu c)
  (exp (- (* (beta c) mu))))

(chernoff 50 1.5)

(binom-between 100 0.5 75 100)

(chernoff 100 2)

(define (G n)
  (* n 1000000000))

(* (chernoff 2 12) (G 2))

(beta 12)

(log (G 1))

(exp 16)

(log (expt 10 9))

(exp 15)

(log (g 1))

(beta 1.6)
;Value: .3862943611198906

(/ 1 (exp (- 15)))

(/ 100000 

#|