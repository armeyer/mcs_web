;; problem 8
(define-problem
  '((type short-answer)
    (title "Induction Rules")
    (intro "Consider the following three fundamental principles for
reasoning about nonegative integers:
<ul>
<li>The Induction Principle,
<li>the Strong Induction Principle,
<li>the Well-ordering Principle.
</ul>
Listed below are some inference rules, each of which is a 
formulation of one or none of the above.")
    (box-width 20)
    (questions

;part 1:

     (! "
<center>
<em>P</em>(0), &forall; <em>m</em>. (&forall; <em>k</em> &le;
m. <em>P</em>(<em>k</em>)) &rarr; <em>P</em>(<em>m</em>+1) <br>
<hr size=1 width=270 noshade>
&forall; <em>n</em>. <em>P</em>(<em>n</em>) 
</center><br>
This is a formulation of: &nbsp;&nbsp; 
"
        (answer "Strong Induction"
                (options  " " 
                          "Simple Induction"
                          "Strong Induction"
                          "The Well-ordering Principle"
                          "None of the above")
                (rationale "This is a straightforward translation 
into logical language of the recipe for strong induction in Week 3 Notes.")
                )                       ;answer
"<p>"
        )

;part 2:

     (! "
<br><center>
<em>P</em>(<em>b</em>), &forall; <em>k</em> &ge; <em>b</em>.
<em>P</em>(<em>k</em>) &rarr; <em>P</em>(<em>k</em>+1)<br>
<hr size=1 width=210 noshade>
&forall; <em>k</em> &ge; <em>b</em>. <em>P</em>(<em>k</em>) 
</center><br>
This is a formulation of: &nbsp;&nbsp; 
"
        (answer "Simple Induction"
                (options  " " 
                          "Simple Induction"
                          "Strong Induction"
                          "The Well-ordering Principle"
                          "None of the above")
                (rationale "This is just the rule for simple
induction adjusted to start with base case <em>b</em> instead of 0. ")
                )                       ;answer

"<p>"
        )

;part 3:

     (! "
<br><center>
&exist; <em>n</em>. <em>P</em>(<em>n</em>)
<hr size=1 width=250 noshade>
&exist; <em>m</em>. [<em>P</em>(<em>m</em>) ^ 
(&forall; <em>k</em>. <em>P</em>(<em>k</em>) &rarr; <em>k</em> &ge; <em>m</em>)]
</center><br>
This is a formulation of: &nbsp;&nbsp; 
"
        (answer "The Well-ordering Principle"
                (options  " " 
                          "Simple Induction"
                          "Strong Induction"
                          "The Well-ordering Principle"
                          "None of the above")
                (rationale "If we let <em>S</em> be the set 
{ <em>k</em> | <em>P</em>(<em>k</em>) }, then &exist; <em>n</em>. 
<em>P</em>(<em>n</em>) says that
<em>S</em> is nonempty, and [<em>P</em>(<em>m</em>) ^ 
(&forall; <em>k</em>. <em>P</em>(<em>k</em>) &rarr; 
<em>k</em> &ge; <em>m</em>)]
says that <em>m</em> is the least number in <em>S</em>.")

                )                       ;answer
"<p>"
        )

;part 4:

     (! "
<br><center>
<em>P</em>(<em>0</em>), &forall; <em>k</em> > <em>0</em>.
<em>P</em>(<em>k</em>) &rarr; <em>P</em>(<em>k</em>+1)<br>
<hr size=1 width=210 noshade>
&forall; <em>n</em>. <em>P</em>(<em>n</em>) 
</center><br>
This is a formulation of: &nbsp;&nbsp; 
"
        (answer "None of the above"
                (options  " " 
                          "Simple Induction"
                          "Strong Induction"
                          "The Well-ordering Principle"
                          "None of the above")
                (rationale "This looks like the rule for simple induction,
but in the antecedent <em>k</em> is strictly greater than 0.  This leaves
the possibility that <em>P(0)</em> does not imply <em>P(1)</em>, so the
property <em>P</em> may not propagate from 0 to the rest of the numbers.")
)  ;answer

"<p>"
        )

;part 5:

     (! "
<br><center>
&forall; <em>m</em>. 
(&forall; <em>k</em> < m. <em>P</em>(<em>k</em>)) 
&rarr; <em>P</em>(<em>m</em>) <br>
<hr size=1 width=270 noshade>
&forall; <em>n</em>. <em>P</em>(<em>n</em>) 
</center><br>
This is a formulation of: &nbsp;&nbsp; 
"
        (answer "Strong Induction"
                (options  " " 
                          "Simple Induction"
                          "Strong Induction"
                          "The Well-ordering Principle"
                          "None of the above")
                (rationale "This looks identical to the rule for strong
induction, as in Part 1, but with the base case missing.  Still, the base
case is provided: when <em>m</em> is 0, the assumption of the implication
is ``vacuously'' true, and the conclusion in this case is precisely that
<em>P(0)</em> is true.")  )  ;answer
"<p>"
        )

)))



