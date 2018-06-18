;; problem 5
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type multi-part)
    (title "Inside the TA's brain")
    (intro "<strong>Recent studies have shown that some small area in our
brains is sensitive to <em>nonsensical structures</em>: the 1,000,000
neurons of that area seem to be firing whenever the individual is
presented with such structures. This area is now known as the Grader's
Area.

<p> In a now famous series of experiments (Pseudoneurologica,
28(1):123-129, 1999), several 6.042 TAs have been presented with
students' solutions to exam problems. On reading a really bad
solution, the <em>expected number</em> of neurons to fire in the
Grader's Area was estimated to be 550,000.  Assume that this
estimate is indeed correct.

<p>Moreover, a TA realizes that a solution is indeed bad if the number
of neurons in his/her Grader's Area that fire is greater than the
number of neurons that do not by 200,000.<br></strong>")

    (subproblems
     (!prob
      (type short-answer)

      (title "How many neurons...?")

      (intro "<strong>What is the least number of neurons in the Grader's Area
that must fire in order for the TA to realize that a solution is bad?</strong>")

      (questions
       (! "" (answer "600,000" 600000
                     (rationale "In order for the neurons that fire to be 
at least 200,000 more than those that do not fire, they should be at least 
100,000 more than half the total number of neurons. That is: 500,000 + 100,000 = 600,000.")))))

     (!prob 
      (type short-answer)
      (title "What bound to use?")

      (intro    
"<strong>Given the information above, which of the following can we use to
bound the probability <em>p</em> that a bad solution is recognized as
such?<p> 
<ol> 
<li> Markov Bound 
<li> Chebyshev Bound 
</ol>
<p> Give your answer as a sequence of numbers separated by spaces.</strong>")

       (questions
        (! "" (answer "1"
                      (rationale "Applying the Chebyshev Bound requires bounds
            on the variance. Here we only know the expection.")))
       )
      );prob

     (!prob 
      (type short-answer)
      (title "Markov bound on <em>p</em>")
      (intro "<strong>According to Mr. Markov, <em>p</em> &le; <em>m</em>.  What
is the value of <em>m</em>?<p>
Give your answer as a fraction in lowest terms (e.g., \"10/13\").</strong>
")
      (questions
       (! ""
          (answer "11/12"
                  (rationale "Let <em>R</em> be the number of neurons that fire.
Then E[<em>R</em>]=550,000 and a bad solution is recognized iff <em>R</em>&ge;600,000.
Therefore the probability we want is Pr{<em>R</em>&ge;600,000}. By Markov's Theorem, 
<center>
Pr{<em>R</em>&ge;600,000} &le; E[<em>R</em>]/600,000 = 550,000/600,000 = 11/12.
</center>"))))
      );prob

     (!prob 
      (type short-answer)
      (title "Taking standard deviation into account")
      (intro "<strong>In a follow up study the standard
deviation of the number of neurons that fire on seeing a bad solution 
was found to be 25,000.  Applying the Chebyshev bound, <em>p</em> &le; <em>c</em>.  
What is the value of <em>c</em>?
<p>Give your answer as a fraction in lowest terms (e.g., \"10/13\").</strong>")
      (questions
       (! ""
          (answer 1/4 ;4/13
                  (compare 
                   (lambda (ans response)
                     (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale
"Let <em>R</em> be as above.  Then the new study says that Var[<em>R</em>]=(25,000)<sup>2</sup>.
According to Mr. Chebyshev, the probability that the deviation of <em>R</em> from its mean
<center>
|<em>R</em> - E[<em>R</em>]| = |<em>R</em> - 550,000|
</center>
is <em>x</em> or more is at most Var[<em>R</em>] / <em>x</em><sup>2</sup>, for any <em>x</em>.  
<p>
We want to upper bound the probability that <em>R</em> &ge; 600,000.  Equivalently, 
this is the probability that <em>R</em> - 550,000 &ge; 50,000.  The way to use Chebyshev's 
Theorem is to plug in <em>x</em>=50,000. Then, we get
<center>
Pr{|<em>R</em>-550,000| &ge; 50,000} &le; (25,000)<sup>2</sup>/(50,000)<sup>2</sup> = 1/4.
</center>
<p>
Note that this is really an upper bound for the probability that 
<center>
<em>R</em> &ge; 600,000  <b>or</b>  <em>R</em> &le; 500,000.  
</center>

(FYI, there are \"one-sided\" versions of Chebyshev Bounds, which we omit,
that give a slightly tighter bound for the probability of just
<em>R</em> &ge; 600,000.)

<!--

Therefore, although it is indeed an upper bound for the probability
that we want, it is a rather loose one.

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
