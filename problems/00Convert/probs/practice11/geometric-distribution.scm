;;problem geometric-distribution sumsumes practice11/prob6
;first two parts should be revised to offer pull-down menu options

(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Until We Have a Girl")
      (intro "<strong>You have just been married and you both want to have
children.  Of course, any child is a blessing, but your spouse prefers
girls, so you decide to keep having children until you have a girl.  In
other words, if your 1st child is a girl, you'll stop there.  If it's a
boy, then you'll have a 2nd child, too. If that one is a girl, you'll stop
there. Otherwise, you'll have a 3rd child, and so on.  <p> Assume that you
will never abandon this ingenious plan and that every child is equally
likely to be a boy or a girl, independently of the number of its brothers
so far.  Let <em>B</em> be the <em>boys</em> that you will eventually have
to put up with to enjoy the company of your beloved daughter.</strong>")
      (box-width 5)
      (questions

	(! 
"<strong>For <em>i</em> = 0,1,2,..., what is the value of PDF<sub><em>B</em></sub> ( <em>i</em> )?<br>
<ul>
<li>
<b>a : </b>  1/2<sup><em>i</em></sup>
<li>
<b>b : </b>  1/2<em>i</em>
<li>
<b>c : </b>  1/2<sup><em>i</em>+1</sup>
<li>
<b>d : </b>  1/2<sup>2<em>i</em></sup>
<li>
<b>e : </b>  can't tell
</ul>
Enter the letter that corresponds to the correct expression:</strong>
"
        (answer (c)
          (rationale  
"By definition, PDF<sub><em>B</em></sub> ( <em>i</em> ) = Pr{ <em>B=i</em> }, namely the 
probablility that you will have to have exactly <em>i</em> boys. This happens exactly
when the first <em>i</em> children are boys and the <em>i</em>+1st one is a girl. The 
probability of this is 
<center>
(1/2)<sup><em>i</em></sup>(1/2) = (1/2)<sup><em>i+1</em></sup>.
</center>
"          );rationale
              (compare test-set)
              )  ;answer
) 

	(! 
"<strong>For <em>i</em> = 0,1,2,..., what is the value of CDF<sub><em>B</em></sub> ( <em>i</em> )?<br>
<ul>
<li>
<b>a : </b>  ( 1 - 1/2<sup><em>i</em></sup> ) / ( 1 - 1/2 )
<li>
<b>b : </b>  2<em>i</em>
<li>
<b>c : </b>  1 - 1/2<sup><em>i</em>+1</sup>
<li>
<b>d : </b>  1/2<em>i</em>
<li>
<b>e : </b>  can't tell
</ul>
Enter the letter that corresponds to the correct expression:</strong>"
        (answer (c)
          (rationale  

"By definition, CDF<sub><em>B</em></sub> ( <em>i</em> ) = Pr{
<em>B&le;i</em> }, namely the probablility that you will have to have at
most <em>i</em> boys.  To compute this probablity,
we can just add the values of PDF<sub><em>B</em></sub> ( <em>j</em> ) for  
<em>j</em>=0,1,2,...,<em>i</em>.  This is 
<center>
the sum of  1/2<sup><em>j</em>+1</sup> for <em>j</em>=0,1,2,...,<em>i</em>. 
</center>
Doing the algebra, we get 1 - 1/2<sup><em>i</em>+1</sup>.
<p>
Alternatively, the probability that we get at most <em>i</em> boys is 1 minus the 
probability that we will get <em>i+1</em> boys or more.  But we get <em>i+1</em> or more boys
if and only if the first <em>i+1</em> children are boys, which happens with probability 
1/2<sup><em>i</em>+1</sup>.  Subtracting from 1, we get the same result.
"          );rationale
              (compare test-set)
              )  ;answer
)

(! 
"<strong>How many boys should you expect to have? (<em>hint</em>: no
series, just mean time to failure) </strong>"
        (answer (1)
          (rationale  

"Since you stop when you have a girl, the number of boys in your family will be one less than the number of children.  Thinking of having a girl as a `failure,' the expected number of children is the mean time to failure, namely 1/(1/2) = 2.");rationale
              (compare test-set)
              )  ;answer
)
        );questions
      );'
);define-problem
