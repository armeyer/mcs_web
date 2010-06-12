;; relative-prime -- problem 5
(define-problem
  '(
    (type short-answer)
    (title "Relative Primality")
    (intro "")
    (box-width 8)
    (questions 
     (! "<strong>How many numbers between 1 and 3780 (inclusive) are relatively 
            prime to 3780?" 
        (answer 864
                (rationale "3780 = 2^2 * 3^3 * 5 * 7, so using the
formula for Euler's phi function, there are <br>(4-2) * (27-9) * (5-1)
* (7-1) = 864 such numbers.</strong>")) ) ;!
  ) ;questions
 ) ;'
);define-problem
