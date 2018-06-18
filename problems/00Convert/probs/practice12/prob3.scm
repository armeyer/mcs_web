(define-problem
  '(
    (type short-answer)
    (title "Random Variable Trivia")
    (intro 
"Let <em>X</em> be a random variable with uniform distribution over
the integers from -<em>n</em> to <em>n</em>.  Let <em>Y</em> ::=
<em>X</em><sup>2</sup>.  Which of the following are true?
<ol>
 <li> E[<em>X</em>] = 0
 <li> E[<em>Y</em>] = 0
 <li> E[<em>Y</em>] &gt; E[<em>X</em>]
 <li> E[<em>X</em>+<em>Y</em>] = E[<em>X</em>]+E[<em>Y</em>]
 <li> E[<em>XY</em>] = E[<em>X</em>]E[<em>Y</em>]
 <li> <em>X</em>, <em>Y</em> are independent variables 
<!--
 <li> Var[<em>X</em>] = 0
 <li> Var[<em>Y</em>] = 0
-->

</ol>
Give you answer as a sequence of numbers separated by spaces (e.g., \"6 2 4\").
")
    (questions
     (! "" (answer (1 3 4 5) (compare test-set)
                   (rationale "
1. Since the PDF of <em>X</em> is symmetric around 0, we know the mean has to be 0.
<p>
2. All values of <em>Y</em> are nonnegative and some of them are actually positive 
with non-zero probability. So, there is no way for the mean to be 0. It has to be 
some positive value. 
<p>
3. Obvious, from our answers to 1 and 2. 
<p>
4. True by linearity of expectation, no matter what <em>X</em> and <em>Y</em>  
we are actually talking about. 
<p>
5. This is tricky.  The equation does not hold in general for non-independent
<em>X</em> and <em>Y</em>. However, in this particular case, it happens to hold.
To see this, note that the right hand side is 0, by our answer to 1. At the same 
time,  the variable <em>XY</em> is simply <em>X</em><sup>3</sup>. So, its PDF is 
symmetric around 0 (the same way the PDF of <em>X</em> is).  Therefore, its mean
has to be 0, as well. 
<p>
6. This is false. For example, without any knowledge about <em>X</em>, there is 
some non-zero probability for <em>Y</em> to be  <em>n</em><sup>2</sup>.  However,
if we know that <em>X</em>=0, then the probability that <em>Y</em>=<em>n</em><sup>2</sup> 
becomes 0.
<!--
<p>
7 and 8. Zero variance is a property of random variables that are in fact constant. 
Neither <em>X</em> nor <em>Y</em> are constant.
-->
")
                   )))
    );problem
);define-problem
