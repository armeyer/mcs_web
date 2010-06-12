;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Fun with Inclusion-Exclusion")
    (intro
     "If a positive integer <i>not</i> exceeding 100 is selected at random, what is the probability that it is divisible by 5 or 7?")
      (box-width 5)
;      (compare equal?)
      (questions
       (! "" (answer  0.32 (rationale
"Pr{divisible by 5 or by 7}= Pr{divisible by 5} + Pr{divisible by 7} - Pr{divisible by 5 and 7}<br>
= 20/100 + 14/100 - 2/100 = 32/100 = 0.32")))
       );questions
;      (extro "")
      );'
);define-problem

