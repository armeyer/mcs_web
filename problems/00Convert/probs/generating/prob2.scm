(define-problem
  '(
    (type short-answer)
    (title "Counting with Generating Functions")

    (intro "

Let <em>a<sub>n</sub></em> be the number of ways to make change for $<em>n</em> using $2 and $3 tokens.  For example, <em>a</em><sub>5</sub> = 1 because the only way to make change for $5 is with one $2 token and one $3 token, but <em>a</em><sub>6</sub> = 2 because there are two ways to make change for $6, namely using three $2 tokens or using two $3 tokens.
")

       (questions     (! "
<p>Identify the generating function for the sequence of <em>a<sub>n</sub></em>'s."
      (answer "1/(1-x^2)(1-x^3)"
	      (options ""
		       "1/(1-2x)(1-3x)"		       
		       "1/(1+x^2)(1+x^3)"
		       "1/(1-x^2)(1-x^3)"
		       "1/(1-x^2-x^3)"
		       "1/(1-x)(1+x)^2(1+x+x^2)"
		       "1/((1-x)^2+(1-x)^3)"		       
		       )

               (rationale "Using $2 tokens, there is only one way to make
change for $<em>n</em> when <em>n</em> is even, and no way to do it when
<em>n</em> is odd.  So the generating function for the number of ways to
make change for $<em>n</em> using only $2 tokens is<br>

1+<em>x</em><sup>2</sup>+<em>x</em><sup>4</sup>+
<em>x</em><sup>6</sup>+...

<br> = 1/(1-<em>x</em><sup>2</sup>).

<p>Similarly, the generating function for the number of ways to make change for $<em>n</em> using only $3 tokens is
1/(1-<em>x</em><sup>3</sup>).

<p>The generating function for the number of ways to make change using both kinds of tokens is the product of the generating functions for each kind of token.")
	       ;rationale
              (compare test-set)
              )  ;answer
      )   ;!


     );questions
          );'
  );define-problem

