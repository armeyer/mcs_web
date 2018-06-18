;; problem 1
(define-problem
  '(
    (type multi-part)
    (title "Recursive String Set")
    
(intro "Let <b> W </b> be a set of strings.  The set
<b>W</b><sup>+</sup> is another set of strings defined recursively as
follows: <br>

<b>Base case:</b>  If <em>w</em>&isin;<b>W</b>, then <em>w</em>&isin;<b>W</b><sup>+</sup>.<br>

<b>Constructor case:</b>  If <em>w</em>&isin;<b>W</b> and <em>x</em>&isin;<b>W</b><sup>+</sup>,
then <em>xw</em>&isin;<b>W</b><sup>+</sup>
(here <em>xw</em> is the <em>concatenation</em> of 
the words <em>x</em> and <em>w</em>).

<p>Write your answer as a sequence of digits in any order, such as <center> <tt>1 4 3</tt> </center>"
)

    (subproblems
     (!prob
      (type short-answer)
      (title "")
      (intro "Suppose <b>W</b> = {ab, abba, a}. <br><br> Which of the following strings are in <b>W</b><sup>+</sup>?<br>
<ol>
  <li> abababba
  <li> abbab
  <li> babba
  <li> aaaaaab
</ol>");intro

      (questions
       (! "" 
         (answer (1 4) (compare test-set)
          (rationale "
<ol>
  <li> ((ab)ab)abba
  <li> every possible start (\"a\", \"ab\", \"abba\") is followed by \"b\"
  <li> cannot start with \"b\"
  <li> (((((a)a)a)a)a)ab
</ol>")
         ));!
       );questions
     ) ;prob


     (!prob
      (type short-answer)
      (title "")
      (intro "Suppose <b>W</b> is as in Part 1. <br>

<p>Which of the 
predicates <em>P</em>(<em>x</em>) below satisfy BOTH of the following 
conditions:  <br> 
(a) <em>P</em>(<em>x</em>) 
holds for all <em>x</em>&isin;<b>W</b><sup>+</sup> <br>

(b) <em>P</em>(<em>x</em>) leads to an <em>easy, direct proof</em> when
used as a <em>structural induction</em> hypothesis in a proof of condition
(a).

<p> For example, one of the predicates below, call it <em>Q</em>, has another
of the predicates, call it <em>R</em>, as its base case.  <em>R</em>
itself has an easy induction proof, but <em>Q</em> is not considered to
have such a proof since it requires a subproof of <em>R</em>.

<p>
(<font color = green size = +1>Note</font>: A string <em>y</em> is a
<i>prefix</i> of string <em>x</em> iff <em>yz</em> = <em>x</em> for some
string <em>z</em>.  Because <em>z</em> may be the empty string, every
string is considered to be a prefix of itself.)
</p>

<ol>
  <li> <em>x</em> has at least as many a's as b's
  <li> every prefix of <em>x</em> has at least as many a's as b's
  <li> every prefix of <em>x</em> has at most one more b than a's
  <li> <em>ax</em>&isin;<b>W</b><sup>+</sup>
  <li> <em>xy</em>&isin;<b>W</b><sup>+</sup> for all y&isin;<b>W</b><sup>+</sup>
  <li> <em>wx</em>&isin;<b>W</b><sup>+</sup> for all w&isin;<b>W</b>
</ol>");intro

      (questions
       (! "" (answer (1 4 6) (compare test-set)
          (rationale 

"Intuitively, a string is in <b>W</b><sup>+</sup> iff it can be written as the
concatenation of &ge;1 strings of <b>W</b>.  So, it is easy to see that (1), (3), (4),
(5), and (6) are all true for all <em>x</em>&isin;<b>W</b><sup>+</sup>.
Only (2) is false: a counterexample is abba&isin;<b>W</b><sup>+</sup>,
which has the prefix abb with more b's than a's.<br> 

<p> Predicates (1), (4), and (6) lead to easy, direct proofs by structural
induction.  There isn't room to include these proofs here, but we expected
you to have thought through how these simple proofs would go in order to
figure out these answers.  (If you didn't do this already, it's a valuable
exercise to do it now.)

<p> (3) does not lead to an easy direct proof.  The base case goes through
smoothly, but in the constructor case we also need to know that (1) is
true, and the induction hypothesis is not any help in proving this.  (By
the way, a strengthening of
(3) does have to an easy proof: <center> <em>x</em> has at least as many
a's as b's AND<br> every prefix of <em>x</em> has at most one more b than
a's.)</center>

<p> (5) also does not lead to an easy direct proof because the <em>base
case</em> of (5) is precisely statement (6) which requires its own
inductive proof.  That is,
(5) is the <em>Q</em> and (6) is the <em>R</em> indicated in the problem
description above.

(On the other hand, once (6) is proved (by a separate inductive proof),
then (5) <em> does</em> have an easy, direct proof by structural
induction, since the constructor step, namely, proving that

<center>
<em>(xw)y</em> &isin;<b>W</b><sup>+</sup> for all
<em>y</em>&isin;<b>W</b><sup>+</sup>, assuming that <em>xz</em>
&isin;<b>W</b><sup>+</sup> <br>for all <em>z</em>&isin;<b>W</b><sup>+</sup>
</center><br>
is easy, using (6) again.)"
        )
        ));!
       );questions
      );prob
);subproblem
);'
);define-problem
