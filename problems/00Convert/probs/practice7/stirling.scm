;; stirling

(define-problem
  '(
    (type short-answer)
    (title "Stirling's Formula")
    (intro 
    "The quantity
<center>" (math "\\Large \\frac{(2n)!}{2^{2n}(n!)^2} \\qquad\\qquad (*)") 

"</center>

will come up later in the course (it is the probability that in
2<sup>2<em>n</em></sup> flips of a fair coin, exactly <em>n</em> will be
Heads).  Which of the following simplified formulas is asymptotically
equal to (*)?  (To find the final formula, you will probably need to write
out a short sequence of successively simpler formulas.)")

    (boxsize 1)
    (questions
     (! "a. " (math "\\frac{1}{\\sqrt{\\pi n}}") "<p>
           b. " (math "\\frac{1}{\\sqrt{2 \\pi n}}") "<p>
           c. " (math "\\sqrt{\\frac{2}{ \\pi n}}") "<p>
           d. " (math "2^n\\sqrt{2 \\pi n}") "<p>
           e. " (math "\sqrt{2 \\pi n}") "<p>"
        (answer a (rationale
                   (math
"\\begin{array}{rlc}
\\frac{(2n)!}{ 2^{2n}(n!)^2}
  & \\sim \\frac{(2n/e)^{2n}\\sqrt{2 \\pi 2n}}
                 {2^{2n}\\left[(n/e)^n\\sqrt{2 \\pi n}\\right]^2} &
\\text{(by Stirling's Formula)}\\\\
  &  =  \\frac{2^{2n}(n/e)^{2n}\\sqrt{2 \\pi 2n}}{2^{2n} (n/e)^{2n} \\left[\\sqrt{2 \\pi n}\\right]^2}\\\\
  &  =   \\frac{\\sqrt{2 \\pi 2n}}
                 {\\left[sqrt(2 \\pi n)\\right]^2}\\\\
  &  = \\frac{\\sqrt{2} \\sqrt{2 \\pi n}}{\\left[\\sqrt{2 \\pi n}\\right]^2}\\\\
  &  = \\frac{\\sqrt{2}}{\\sqrt{2 \\pi n}} = \\frac{1}{\\sqrt{\\pi n}}
\\end{array}
")
                   )))
     )                                  ;questions
                                        ;      (extro "")
    )                                   ;'
  )                                     ;define-problem
