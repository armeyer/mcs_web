 ;d days in year, n people in class

 #|
(define d 365)

(define n 73)

(define ei exact->inexact)

(define expected-pairs (/ (comb n 2) d))

(ei expected-pairs)
 ;Value: 14.95890410958904 

(define std-dev-pairs (sqrt (/ (* (comb n 2) (- d 1)) (* d d))))

 std-dev-pairs
 ;Value: 2.6796033237407992

(define (devs-interval k)
  (list 'from  (- expected-pairs (* k std-dev-pairs))
	'to (+ expected-pairs (* k std-dev-pairs))
	'prob (- 1 (/ 1 (* k k)))))
|#
