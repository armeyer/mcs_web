;; problem 7
(define-problem
  '(
    (type short-answer)
    (title "Multiplicative Inverses")
    (intro 
     "What is the multiplicative inverse (mod 7) of 2?
(<em>Reminder</em>: by definition, your answer must be an integer between
0 and 6.)")

    (questions
     (! "" (answer 4 (rationale "2 * 4 = 8 &equiv; 1 (mod 7)"))))))

