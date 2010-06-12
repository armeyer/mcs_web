;; problem 5
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type multi-part)
    (title "Voting in Florida")
    (intro "BAD STATEMENT... MAKES LITTLE SENSE... This is the year 2004 and Bush is running against Gore again.
As usual, each of the 6,000,000 voters in Florida will randomly vote for
one of these candidates, although the probability that any particular
voter will choose Gore over Bush varies over the full range of zero to
one.  Of course the choices of different voters &#65293; neighbors for example
&#65293; are often not independent of each other.

<p>The election is close, and Gallup advises us that the expected number of
votes for Gore is actually 3,000,000.  We want to use this information to
estimate the probability, <em>p</em>, that one of the candidates winds up
with at least 6,000 votes more than the other candidate.")
    (subproblems
     (!prob
      (type short-answer)
      (title "How many votes...?")
      (intro "How many votes does Gore need to get 6,000 votes more than Bush?")
      (questions
       (! "" (answer "3,003,000" 3003000
                     (rationale "In order for Gore to get at least 6000
more votes than Bush, he needs to increase his vote total to 3000 above
his expected number of votes")))))

     (!prob 
      (type short-answer)
      (title "What bound to use?")
      (intro    "Given all the information above and nothing else, which of the following can we use to bound <em>p</em>?<p>
                <ol>
                 <li> Markov Bound
                 <li> Chebyshev Bound
                </ol><p>
Give your answer as a sequence of numbers separated by spaces.  
")
       (questions
        (! "" (answer "1"
                      (rationale "Applying the Chebyshev Bound requires bounds
            on the variance; it can't be applied knowing only the expection.")))
       )
      );prob

     (!prob 
      (type short-answer)
      (title "Markov bound on <em>p</em>")
      (intro "According to Mr. Markov, <em>p</em> &le; <em>m</em>.  What
is the value of <em>m</em>?<p>
Give your answer as a fraction in lowest terms (e.g., \"10/13\").
")
      (questions
       (! ""
          (answer "1000/1001"
                  (rationale "By Markov:
<center>
Pr{R &ge; 3,003,000} &le; E[<em>R</em>]/3,003,000 = 3,000,000/3,003,000 = 1000/1001.
</center>"))))
      );prob

     (!prob 
      (type short-answer)
      (title "Taking standard deviation into account")
      (intro "Now suppose Gallup also reports that the standard deviation,
&sigma;, of the number of Gore votes is 2,000.  Applying the Chebyshev bound,
<em>p</em> &le; <em>c</em>.  What is the value of <em>c</em>?")
      (questions
       (! ""
          (answer 4/9 ;4/13
                  (compare 
                   (lambda (ans response)
                     (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale
"According to Mr. Chebyshev,
<center>
Pr{|<em>R</em> - E[<em>R</em>]| &ge; <em>x</em> } &le; Var[<em>R</em>] / <em>x</em><sup>2</sup>.
</center>
Plugging in <em>x</em> = 3,000, E[<em>R</em>] = 3,000,000, and
Var[<em>R</em>] = &sigma;<sup>2</sup> = 4,000,000, we get:
<center>
Pr{|<em>R</em>-3,000,000| &ge; 3,000} &le; 4,000,000/3,000<sup>2</sup> = 4/9.
</center>
<!--
<p>Note that we're really interested in a bound on the variable <em>R</em>-3,000,000 without the absolute value sign.  This is called the \"one-sided\" deviation:
<center>
<em>p</em> ::= Pr{<em>R</em> &ge; 3,003,000} = Pr{<em>R</em>-3,000,000 &ge; 3,000}.
</center>
For this case, a slightly better bound, namely 4/13, can be obtained using a
\"one-sided\" version of Chebyshev's bound, which we omit.
-->"))));questions
      );prob
     );subproblems
    );'
  );define-problem
