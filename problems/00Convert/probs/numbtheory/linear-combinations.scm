;; linear-combinations -- problem 4
(define-problem
  '(
    (type multi-part)
    (title "Linear Combinations & Inverses")
    (intro "")
    (subproblems
     (!prob
      (type short-answer)
      (box-width 20)
      (title "GCD's With Linear Combinations")
;      (compare equal?)
      (questions
       (! "<strong>Find integer coefficients, <em>x</em>,<em>y</em>, in a linear
combination 25<em>x</em>+ 32<em>y</em> = GCD(25,32).

<p>Give your answer as a parenthesized pair of integers,
for example, (1 2).</p>"
          (answer "Any pair of the form (9+32<em>k</em>,-7-25<em>k</em>)
would also be correct."
                  (compare
                   (lambda (ans response)
                     (test-condition ans response
                       (lambda (ans dummy)
                         (if (and (list? ans)
                                  (= (length ans) 2))
                             (= 1 (+ (* (car ans) 25)
                                     (* (cadr ans) 32)))
                             #f)))))
                  (rationale "GCD(25,32) = 1 = 9*25 + (-7)*32,
where these coefficients (9 -7) were obtained by applying the
Pulverizer.")
                  ) ;answer
          ) ;!
       ) ;questions
      ) ;prob!
     (!prob
      (type short-answer)
      (box-width 20)
      (title "Inverse with Linear Combinations")
      (questions
       (! "What is the inverse (mod 25) of 32?"
          (answer 18 ;compare
                  (rationale "Since 1 = 9*25 + (-7)*32, it follows that -7
    is an inverse of 32 (mod 25), and therefore so is rem(-7,25) = 18.</strong>")

                  ) ;answer
          );!
       ) ;questions
      ) ;prob!
     ) ;subproblems
    ) ;'
) ;define-problem
          
