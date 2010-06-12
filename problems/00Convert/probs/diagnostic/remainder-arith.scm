;; problem remainder-arith
(define-problem
  '(
    (type short-answer)
    (title "Modular/Remainder arithmetic")
    (intro "" )
;      (boxsize 5)
     (box-width 40)
;      (compare equal?)
      (questions
       (! "What is the remainder on division by 5 of the product of
4,199,001 and 3,777,778?" (answer 3 (rationale "(4199001 * 3777778) mod 5
=(4199001 mod 5) * (3777778 mod 5) = (1 mod 5) * (8 mod 5) = 1 * 3 = 3")))

       );questions
;      (extro "")
      );'
);define-problem

