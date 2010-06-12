;; divisors.scm -- problem 1
(define-problem
  '(
    (type short-answer)
    (title "Divisors")
    (intro "")
    (box-width 10)
    (questions
     (! "<strong>How many prime divisors does 12 have?"
        (answer (2) (compare test-set)
                   (rationale "The prime divisors are 2 and 3."))
        ) ;!
     (! "How many positive divisors does 12 have?"
        (answer (6) (compare test-set)
                   (rationale "The positive divisors are 1, 2, 3, 4, 6, and 12."))
        ) ;!
     (! "How many divisors does 12 have?"
        (answer (12) (compare test-set)
                   (rationale "The divisors are 
&plusmn;1, &plusmn;2, &plusmn;3, &plusmn;4, &plusmn;6, and &plusmn;12.</strong>"))
        ) ;!
     ) ;questions
    ) ;'
  );define-problem
