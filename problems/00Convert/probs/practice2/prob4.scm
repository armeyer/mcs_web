; problem 4
(define-problem
'(
  (type short-answer)
  (title "A Bogus Induction")
  (intro "The Fibonacci numbers
<center>
 0 1 1 2 3 5 8 13 ...
</center>
are defined as follows.  Let <em>F</em>(<em>n</em>) be the
<em>n</em>th Fibonacci number.  Then

<ul>
<li> <em>F</em>(0) ::= 0,

<li> <em>F</em>(1) ::= 1,

<li> <em>F</em>(<em>n</em>) ::= <em>F</em>(<em>n</em>-1) +
     <em>F</em>(<em>n</em>-2), &nbsp;&nbsp; for <em>n</em> &ge; 2.
</ul> 

Now consider the following:

<p><font color=red>False Claim</font>: Every Fibonacci number is even.
      <p> <font color=red>False Proof:</font>
	 <ol>
         <li> We use strong induction.
         <li> The induction hypothesis is that <em>F</em>(<em>n</em>) is even.
         <li> We will first show that this hypothesis holds for n = 0.
         <li> This is true, since <em>F</em>(<em>0</em>) = 0, which is an even number.
         <li> Now, suppose n &ge; 2. We will show that <em>F</em>(<em>n</em>) is even, assuming that <em>F</em>(<em>k</em>) is even for all k &lt; n.
         <li> By assumption, both <em>F</em>(<em>n-1</em>) and <em>F</em>(<em>n-2</em>) are even.
         <li> Therefore, <em>F</em>(<em>n</em>) is even, since <em>F</em>(<em>n</em>) = <em>F</em>(<em>n-1</em>) + <em>F</em>(<em>n-2</em>) and the sum of two even numbers is even.
         <li> Thus, the strong induction principle implies that <em>F</em>(<em>n</em>) is even for all n &gt; 0.
        </ol>
QED");intro
  (questions
   (! "Which sentences in the proof contain logical errors?"
      (answer (8) (5 8) (compare test-set)
              (rationale "
Steps 1 through 7 contain no logical errors.  The fatal flaw is in step 8.
Using strong induction, we can conclude that a predicate
<em>P</em>(<em>n</em>) holds for all <em>n</em> &ge; 0 provided that we
show all of the following:
<ul>
    <li> <em>P</em>(0)

    <li> <em>P</em>(0) &rarr; <em>P</em>(1)

    <li> [<em>P</em>(0) &and; <em>P</em>(1)] &rarr; <em>P</em>(2)

    <li> [<em>P</em>(0) &and; <em>P</em>(1) &and; <em>P</em>(2)] &rarr; <em>P</em>(3)
    <li> <em>etc.</em>
</ul>

The first assertion is proved on lines 3 and 4.  The third and
subsequent assertions are proved on lines 5&#65293;7.  However, the second
assertion, <em>P</em>(0) &rarr; <em>P</em>(1), is proved nowhere (and is
actually false).  Therefore, we cannot apply the strong induction
principle in step 8.
<br><br>
If you said that step 5 contains a logical error, you were on the right
track.  The natural place to prove the second assertion would have been in
lines 5&#65293;7.  But by saying, \"suppose <em>n</em> &ge; 2\" instead of
\"suppose <em>n</em> &ge; 1\", the proof explicitly avoided doing so.
<br><br>
  Technically, there is no <em>logical</em> error in line 5: it is simply
  the beginning of a proof for the case when n &ge; 2.  On the other hand,
  it's reasonable to say that line 5 is the place where the proof makes a
  <em>strategic</em> error because it skips the <em>n</em> = 1 case.  So
  while (5 8)  is really <em>not</em> a correct answer, we decided to
  be generous, since this issue hasn't come up earlier. 
")
)))

    (extro "Give your answer as a sequence of integers separated by some 
spaces, for example, <center>4 2 3</center> Don't use commas or periods.<p>")

   );question
  );prob
