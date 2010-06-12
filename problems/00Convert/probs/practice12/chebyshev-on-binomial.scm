;; chebyshev-on-binomial
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Flipping coins")
      (intro "<strong>Suppose you flip a fair coin 100 times.  The coin flips are all mutually independent.</strong>")
      (box-width 5)
      (questions

       (! "<strong>What is the expected number of heads?<br></strong>" (answer 50
		  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '()))) 
		  (rationale "Let <em>X</em> denote the number of heads.  Let <em>X</em><sub><em>i</em></sub> be 
the indicator variable that is 1 when the <em>i</em>th coin flip is heads. Then 
<center>
<em>X</em> = <em>X</em><sub>1</sub>+<em>X</em><sub>2</sub>+...+<em>X</em><sub>100</sub>.
</center>
Hence, by linearity of expectation, 
<center>
E[<em>X</em>] = 
E[<em>X</em><sub>1</sub>+<em>X</em><sub>2</sub>+...+<em>X</em><sub>100</sub>] = 
E[<em>X</em><sub>1</sub>]+...+E[<em>X</em><sub>100</sub>] 
</center>
and we need to find the expectation of each individual indicator. We compute:
<center>
E[<em>X<sub>i</sub></em>]= 1 &middot; Pr{flip head} + 0 &middot; P{flip tail} = 1/2.  
</center>
Putting everything together, we conclude that E[<em>X</em>] = 100 &middot; 1/2 = 50.")))   

       (! "<strong>What is an upper bound on the probability that the number of heads is at least 70 according to Markov's Theorem? <br></strong>"
          (answer 5/7
		  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '()))) 
		  (rationale "The expected number of heads is 50.  So the probability that the number of heads is at least 70 is at most 50/70 = 5/7.")))

       (! "<strong>What is the variance of the number of heads?<br>"  ;<i>(hint: read section 4.4)</i><br></strong>" 
	  (answer 25 
		  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '())))
		  (rationale "Let <em>X</em> and <em>X<sub>i</sub></em> be as in Question 1.  Then, by the 
independence of the <em>X<sub>i</sub></em>, we know  
<center>
Var[<em>X</em>] = 
Var[<em>X</em><sub>1</sub> + ... + <em>X</em><sub>100</sub>] = 
Var[<em>X</em><sub>1</sub>]+ ... + Var[<em>X</em><sub>100</sub>]
</center>
and we need to find the variance of each indicator. We compute:
<center>
Var[<em>X<sub>i</sub></em>] =  
E[<em>X</em><sup>2</sup>] - E[<em>X</em>]<sup>2</sup>  =  
1/2 - (1/2)<sup>2</sup> = 1/4.
</center>
Putting everything together, we have Var[<em>X</em>] = 100&middot;(1/4) = 25."
)))
       (! "<strong>What is an upper bound on probability that the number of heads is less than 30 or greater than 70 according to Chebyshev's Theorem?<br></strong>"
          (answer 0.0625
		  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '())))
		  (rationale "The mean is 50.  So, the variable is less than 30 and more than 70
iff it deviates from its mean by 20=|30-50|=|70-50| or more. How big is this deviation in comparison 
to the <em>standard deviation</em>?  Since the variance of the number of heads is 25, its standard 
deviation is 5.  So, deviation by 20  is 4 times the standard one. 
<p>

Now, Chebyshev's Theorem says that the probability of the number of heads
deviating from its mean by 4 times the standard deviation is &le;
1/(4<sup>2</sup>) = 1/16."
                             )))
       );questions
      );'
);define-problem
