;; problem 2
(define-problem
  '(
    (type multi-part)
    (title "Summation")

    (intro "There is a number <i>a</i> such that
<center>"
(math "\\sum_{i=1}^\\infty i^p")
"</center>
converges to a finite value iff <i>p</i> &lt; <i>a</i>.")
    (subproblems
     (!prob 
      (type short-answer)
      (box-width 5)
      (title "Value of <em>a</em>")
      (questions 
       (! "What is the value of <i>a</i>?" (answer -1))
       );questions
      );prob

     (!prob 
      (type short-answer)
      (title "Proof")
      (intro "Which of the following would be good approaches as part of a proof
that this value of <i>a</i> is correct ?

<ol>
<li> find a closed form for 
<center>"
(math "\\int_1^\\infty x^p\\: dx")
"</center>

<li> find a closed form for 
<center>"
(math "\\int_1^\\infty i^x\\: dx")
"</center>

<li> induction on <i>p</i>

<li> induction on <em>n</em> using the following sum 
<center>"
(math "\\sum_{i=1}^n i^p")
"</center>

<li> compare the series term-by-term with the Harmonic series

</ol>")
      (questions
       (! "" (answer (1 5) (compare test-set) 
                    (rationale "<p>1 is correct: the sum is "
(math "\\Theta\\left(\\int_1^\\infty x^p \\: dx \\right).")

"<br>For "(math "p \\neq -1,") " the indefinite integral is
<center>"
    (math "{\\frac{x^{p+1}}{p+1}.")
"</center>
<ul>

<li>If <i>p</i> &lt; -1, then <i>p</i>+1 &lt 0, so lim<sub><i>x</i>&rarr;&infin;</sub> <i>x</i> <sup><i>p</i>+1</sup> = 0, and the
definite integral from 1 to &infin; evaluates to -1 / (<i>p</i>+1).  Hence
the sum is bounded from above, and since it is increasing, it has a finite
limit, that is, it converges. </li>

<li>If <i>p</i> &gt; -1, then <i>p</i>+1 &gt
0, so lim<sub><i>x</i>&rarr;&infin;</sub> <i>x</i> <sup><i>p</i>+1</sup> =
&infin;, and
the definite integral diverges. </li> 

<li> For <i>p</i> = -1 the
indefinite integral is log <em>x</em> which also approaches &infin; as <i>x</i>
approaches &infin;, so the the definite integral also diverges.</li>
</ul>

<p>4 is incorrect:<br>

This would need the ideas from the good approaches to handle the induction
step anyway, at which point the induction would be moot.

<p>5 is correct:<br>For <i>p</i> = -1, the sum is the harmonic series
              which we know does not converge. Since the term <i>i <sup>p</sup></i>
              is increasing in <i>p</i> for <i>i</i> &gt; 1, the sum will
              be larger, and hence also diverge for <i>p</i> &gt; -1."))))
      );prob
     );subproblems
    );'
  );define-problem
