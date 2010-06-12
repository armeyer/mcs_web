;; Euler-Theorem (problem 5)
(define-problem
  '(
    (type short-answer)
    (title "Euler's Theorem")
;    (intro "INTRO TO APPEAR.")
    (box-width 8)
    (questions 
     (! "<strong>What is the value of phi(175), where phi is Euler's function?</strong>" 
        (answer 120
                (rationale "<strong>Noting that 175 = 5<sup>2</sup> &middot; 7.
         It follows that phi(175)=(5<sup>2</sup> - 5<sup>1</sup>)(7-1)
          = 20 &middot; 6 = 120.</strong>"))
        ) ;!
     (! "<strong>What is the remainder of 22<sup>12001</sup> divided by 175?</strong>"
        (answer 22
                (rationale "<strong>22<sup>12001</sup> = 22<sup>(120 &middot 100) +1</sup>
          = (22<sup>120</sup>)<sup>100</sup> &middot; 22
         &equiv; 1<sup>100</sup> &middot; 22
         &equiv; 22 mod 175.</strong>"))
        )
     ) ;questions
    ) ;'
  );define-problem
