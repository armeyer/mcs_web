;linear-recurrence-congruence

(define (nth n l)
  (if (= n 0)
      (car l)
      (nth (- n 1) (cdr l))))

(define (reverse l)
  (define (aux l1 l2)
    (if (null? l1) l2
	(aux (cdr l1) (cons (car l1) l2))))
  (aux l '()))

(define (shift f l)
  (cons f (reverse (cdr (reverse l)))))
  

(define (make-lin coeff-list init-list)
  (let ((d (length coeff-list)))
    (if (not (= d (length init-list)))
	(list "different lengths:" coeff-list init-list)
	(letrec ((aux
		  (lambda (k l)
		    (if (< k 0)
			l
			(aux (- k 1)
			     (shift
			      (apply + (map * coeff-list l))
			      l))))))
	  (lambda (n)
	    (if (< n d)
		(nth (- d (+ n 1)) init-list)
		(car (aux (- n d) init-list))))))))

(define fib (make-lin '(1 1) '(1 0)))
(define pm (make-lin '(1 1 -1) '(2 1 0)))
(define pm2 (make-lin '(1 -1 1 -1) '(5 3 1 0)))
(define pm3 (make-lin '(1 1 1 -1) '(5 7 3 0)))
(define pm4 (make-lin '(1 -1 1 1 -1) '(5 7 3 0 0)))

(define zto100
'(00 01 02 03 04 05 06 07 08 09 
  10 11 12 13 14 15 16 17 18 19
  20 21 22 23 24 25 26 27 28 29
  30 31 32 33 34 35 36 37 38 39
  40 41 42 43 44 45 46 47 48 49
  50 51 52 53 54 55 56 57 58 59
  60 61 62 63 64 65 66 67 68 69
  70 71 72 73 74 75 76 77 78 79
  80 81 82 83 84 85 86 87 88 89
  90 91 92 93 94 95 96 97 98 99))

(define zto200 (append zto100
		       (map (lambda (n) (+ 100 n)) zto100)))

(define zto300 (append zto100
		       (map (lambda (n) (+ 100 n)) zto200)))

;(map (lambda (n) (modulo n 67)) (map pm4 zto300))
