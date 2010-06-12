;; repeated-pascal
(define-problem
  '(
    (type short-answer)
    (title "Binomial Random Variable")
    (intro "<strong>Let <em>B</em> be the number of heads that come up on <em>2n</em> independent tosses of a fair coin.</strong>"
           )
    (boxsize 5)

    (questions
     (! "" (math "{Pr\\{B = n\\}") " is asymptotically equal(~) to one of the expressions given below. Which one? 
      <p>
      <ol>

      <li>" (math "\\frac{1}{\\sqrt{2 \\pi n}}")"

      <p><li>" (math "\\frac{2}{\\sqrt{\\pi n}}")"

      <p><li>" (math "\\frac{1}{\\sqrt{\\pi n}}")"

      <p><li>" (math "\\sqrt{\\frac{2}{\\pi n}}")"

      </ol>"

        (answer  (3) (compare test-set) (rationale
       "We have that " (math "{Pr\\{B = n\\} = {{2n} \\choose {n}} * 2^{-2n}")  ". Using Stirling's Formula, " (math "{{2n} \\choose {n}}") " ~ " (math "\\frac{2^{2n H(1/2)}}{\\sqrt{2 \\pi (1/2) (1 - 1/2) 2n}} = \\frac{2^{2n}}{\\sqrt{\\pi n}}") ". Thus, " (math "{Pr\\{B = n\\}") " ~ " (math "\\frac{2^{2n}}{\\sqrt{\\pi n}} * 2^{-2n} = \\frac{1}{\\sqrt{\\pi n}}") ".")))
       );questions
    );'
  );define-problem
