;; problem 8
(define-problem
  '((type short-answer)
    (title "Postage by Induction")
    (intro "")
    (box-width 20)
    (compare string=?)
    (questions
     (! "Choose the best of the following comments about approaches to proving that
         every amount of postage of 12 cents or more can be formed using just
         4-cent and 5-cent stamps."
        (answer "Any of the above, but Strong induction or Well ordering are easier in this case"
               (rationale

               "The three principles, Simple/Strong Induction and Well
Ordering, are equivalent: a proof of a theorem using one of them can be
transformed into a proof using either of the others without need for
additional insight.  But Simple induction requires including an extra
quantifier in the induction hypothesis, which makes it a little more
awkward.

<p>In particular, Strong Induction is a good choice for this problem,
using the straightforward induction hypothesis
<center>
 <em>P</em>(<em>n</em>)::= 
[4-cent and 5-cent stamps can form <em>n</em>-cent postage]
</center><br>
with base cases <em>n</em> = 12, 13, 14, and 15.

<p> 
Well ordering works fine too.  A proof would start 
with the set of all <em>counterexamples</em>, namely, 
<center>
{<em>n</em> &ge; 12 | <em>n</em>-cent postage can<em>not</em>
 be formed with 4-cent and 5-cent stamps}
</center><br>

Assuming that this set is not empty, Well ordering implies it has a
minimum element.  Using this, a contradiction can be proved using the same
base cases as the Strong Induction proof and exactly the same reasoning
as in the Inductive Step of the Strong Induction proof.  This implies the
set of counterexamples must be empty, which implies the claim about
postage.

<p>Finally, Simple Induction would work using the same proof as Strong
Induction, but with an induction hypothesis, <em>Q(n)</em>, cluttered up
with an extra FORALL: 

<center> <em>Q</em>(<em>n</em>)::= FORALL
<em>k</em>. IF 12 &le; <em>k</em> &le; <em>n</em>, THEN [4-cent and 5-cent
stamps can form <em>k</em>-cent postage]
</center>

<p>Having proved FORALL <em>n</em>.<em>Q</em>(<em>n</em>) by Simple
Induction, the desired assertion about postage: FORALL <em>n</em>&ge;
12.<em>P</em>(<em>n</em>) would then be an immediate corollary.")  ;rationale

(options  ""
          "Induction --either kind --would be simpler than Well ordering"
          "Ordinary induction would be best because it is easiest to justify" 
          "Any of the above, but Ordinary induction is simplest in this case"
          "Any of the above, but Strong induction or Well ordering are easier in this case"
          "Any of the above, but Well-ordering would be least desirable, since proof by contradiction should be avoided"
          ) ;options
                )                       ;answer
        ))))
          "The Well-ordering Principle"
