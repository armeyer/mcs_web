;;problem 3
(define-problem
    '(
      (type short-answer)
      (title "Greater Expectations")
      (intro "Let <em>X</em> be a random variable with uniform distribution over the integers from -<em>n</em> to <em>n</em>.  Let <em>Y</em> ::= <em>X</em><sup>2</sup>.")
      (box-width 5)
      (questions

       (! "What is E[<em>XY</em>]?"
          (answer 0 (rationale "<em>XY</em> = <em>X</em><sup>3</sup>, and
since <em>X</em> and therefore <em>X</em><sup>3</sup> are symmetric about
0 (that is, <em>i</em> and -<em>i</em> are equally likely)
<br>E[<em>X</em><sup>3</sup>] = E[<em>X</em>] = 0.")))

       (! "What is E[<em>X</em>]&middot;E[<em>Y</em>]?"
          (answer 0 (rationale "Because E[<em>X</em>] = 0")))

       (! "Are <em>X</em> and <em>Y</em> independent? Answer <em>y</em>, <em>n</em> or <em>u</em> for `<em>y</em>es,' `<em>n</em>o,' or `<em>u</em>ndetermined.'"
          (answer "n" (rationale "<em>X</em> and <em>Y</em> are obviously
dependent, since <em>Y</em> = <em>X</em><sup>2</sup>, even though
<br>E[<em>XY</em>] = E[<em>X</em>]E[<em>Y</em>].")))

       );questions
      );'
);define-problem
