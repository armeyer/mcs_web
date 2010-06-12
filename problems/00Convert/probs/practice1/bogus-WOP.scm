;adapted from practice2/problem 4 Sep 09
(define-problem
'(
  (type short-answer)
  (title "A Bogus Well Ordering Principle proof")
  (intro "The Fibonacci numbers
<center>
 0, 1, 1, 2, 3, 5, 8, 13, ...
</center>
are defined as follows.  Let <em>F</em>(<em>n</em>) be the
<em>n</em>th Fibonacci number.  Then

<ul>
<li> <em>F</em>(0) ::= 0,

<li> <em>F</em>(1) ::= 1,

<li> <em>F</em>(<em>n</em>) ::= <em>F</em>(<em>n</em>-1) +
     <em>F</em>(<em>n</em>-2), &nbsp;&nbsp; for <em>n</em> &ge; 2.
     &nbsp;     &nbsp;     &nbsp; (*)
</ul> 

Now consider the following:

<p><font color=red>False Claim</font>: Every Fibonacci number is even.
      <p> <font color=red>False Proof:</font>
	 <ol>
         <li> The proof is by the WOP.

         <li> Let <em>Even</em>(<em>n</em>) mean that
<em>F</em>(<em>n</em>) is even.

<li>Let <em>C</em>  be the set of counterexamples to the assertion that <em>Even</em>(<em>n</em>) holds for all <em>n</em> &ge; 0. That is
<center>
<em>C</em> ::={<em>n</em> &ge; 0 &nbsp;|&nbsp; NOT
<em>Even</em>(<em>n</em>)}.  </center>

We prove by contradiction that <em>C</em> is empty.

<li> Assume that <em>C</em> is not empty.

<li> By WOP, there is a least nonnegative integer, <em>m</em> &isin <em>C</em>,

<li> Then <em>m</em> > 0, since <em>F</em>(<em>0</em>) = 0 is an even number.

<li> Now, suppose <em>m</em> &ge; 2 so the definition (*) of
<em>F</em>(<em>m</em>) applies.

         <li> In this case, both <em>F</em>(<em>m-1</em>) and
         <em>F</em>(<em>m-2</em>) are both even, since <em>m</em> is the minimum
         counterexample such that <em>F</em>(<em>m</em>) is not even.

         <li> But by (*) in the case that <em>n = m</em>, we see that
         <em>F</em>(<em>m</em>) is the sum of two even numbers, and so it is
         also even, that is <em>Even</em>(<em>m</em>) is true.

         <li> This contradicts the condition in the definition of
        <em>m</em> that NOT <em>Even</em>(<em>m</em>) is true.

         <li> This contradition implies that C must be empty.  Hence,
         <em>F</em>(<em>n</em>) is even for all n &ge; 0.   &nbsp;&nbsp;<b>QED</b>

        </ol>
");intro
  (questions
   (! "Which sentences in the proof contain logical errors?"
      (answer (11) (7) (7 11) (compare test-set)
              (rationale "
Steps 1 through 10 contain no logical errors.  The fatal flaw is in step
that final step 11.  The proof only shows that a minimum <em>m</em>
&isin <em>C</em> is not 0, and the assumption that <em>m</em> &ge; 2 leads
to a contradiction.

<p> However, this leaves unexamined that case that <em>m</em> = 1, and in
fact, 1 &\isin <em>C</em>.  (The supposition that \"<em>m</em> &ge; 2 so
the definition (*) of <em>F</em>(<em>m</em>) applies\" is no excuse for
ignoring the case <em>m</em> = 1.)

<p>If you said that step 7 contains a logical error, you were on the right
track.  The natural place to handle the case <em>F</em>(<em>1</em>) would
have been right after line 6.  But the the proof explicitly avoided the
case <em>m</em> = 1, by saying, \"suppose <em>m</em> &ge; 2.\"

Technically, there is no <em>logical</em> error in line 7: it is simply
the beginning of a proof for the case when <em>m</em> &ge; 2.  On the
other hand, it's reasonable to say that line 7 is the place where the
proof makes an <em>organizational</em>, or perhaps <em>strategic</em>,
error because it skips the <em>m</em> = 1 case.  So while 7 is really
<em>not</em> a correct answer, we decided to be generous, since this
distinction between logical and organizational/strategic errors hasn't
come up before.")  )))

    (extro "Give your answer as a sequence of integers separated by some
     spaces (<em>e.g.</em>, \"4 2 3\").  Don't use commas or
   parentheses.<p>")

   );question
  );prob
