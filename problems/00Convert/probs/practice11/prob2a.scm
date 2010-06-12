;;problem 2a
(define-problem
    '(
      (type short-answer)
      (title "Great Expectations")
      (intro "")
      (box-width 5)
      (questions
       (! "What is the expected value of the number that come up
when you roll a 6-sided dice, given that you don't roll a 1?<br>"
          (answer 4 (rationale "P{roll <em>n</em> | <em>n</em> &ne; 1} =
            1/5, so E[<em>n</em> | <em>n</em> &ne; 1] = (2+3+...+6)/5")))

       );questions
      );'
);define-problem
