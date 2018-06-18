(1
 (title "Feb 3&#65293;6: Registration")
                                        ; (due (month 9) (day 5))
; (released staff)

 (intro "<h4>To finish registering for 6.042J/18.062J and be assigned
to a team table, please complete the forms below by <font color =
#990000;>Saturday, Feb 6, 9AM</font>.</h4>

<h4>You may register after February 6 (until ADD DATE, Friday, March 5) by
completing this Tutor Problem Set, but then please send notice to:

<center> <a href =
mailto:6042-webmaster@csail.mit.edu?subject=late%20registration>
6042-webmaster(at)csail(dot)mit.edu</a>
</center>

<h3>After completing these problems, you should read Text Chapters 1 on
proofs, and begin Tutor Problem Set 2 which lists further reading due
Monday, Feb 8 through Friday, Feb 12.</h3>
")

 (parts
  (!
   (title "<h3>6.042 Registration</h3>")
   (problems
    ("registration/regform-with-course" (weight 0))
    ))
  (!
   (title "<h3>Related Subject Grades</h3>")
   (problems
    ("registration/subjects" (weight 0))
    ))
  (! 
   (title "<h3>Team Assignment</h3>")
   (intro "We try to assign students to problem solving teams so that
teams contain a mix of genders, years, majors, average grades, and
ethnicity (as best we can tell).  After that, we try to respect the
teammate preferences you indicate here.")
   (problems 
    ("registration/team-no-sessions-assign" (weight 0))
    ))
  (!
   (title "<h3>Diagnostic Questionnaire</h3>")
   (intro "This questionnaire helps us assess students' prior
knowledge of the course material, allowing us to tune the course material
during the term and to measure the effectiveness of the course when it is
over.  Your score will not be counted in your grade.

<p>Please answer these questions <font color = green> on your own</font>,
<font color = red>without</font> looking at any references.

<p><b>Note</b>: Use the <font color = blue> Submit
</font> button, <em>not the return</em> key when submitting
answers.</em>")
   (problems
    ("diagnostic/problem1" (weight 0))
    ("diagnostic/remainder-arith" (weight 0))
    ("diagnostic/problem3" (weight 0))
    ("diagnostic/problem4" (weight 0))
    ("diagnostic/problem5" (weight 0))
    ("diagnostic/predicate-vailidity" (weight 0))
;    ("diagnostic/problem6" (weight 0))
    ("diagnostic/problem7" (weight 0))
    ("diagnostic/problem8" (weight 0))
    ("diagnostic/problem9" (weight 0))
    ))
  );parts
 )

(2

 (title "Feb 8&#65293;12: Proofs, Propositions, Sets")

;  (released staff)
 
 (intro "<h4>
<font color = blue> Assigned Readings from the Text do <font color = red
>not</font> include the Problem sections.</font> (Many of these problems
will appear as class or assigned homework problems.)

<p>Comments on the reading using the <em>NB online annotation system</em> are due
at the times indicated.  Reading Comments count for 5% of the final
grade.

<p><font color = blue>Reading Assignment</font>: complete by <font color =
#990000;>9AM</font> on the indicated day,

<ul>
<li> Text <a href=\"http://courses.csail.mit.edu/6.042/spring10/proofs.pdf\">Ch. 1</a> &
  <a href=\"http://courses.csail.mit.edu/6.042/spring10/well_ordering.pdf\">Ch. 2</a> due Monday, Feb 8.</li>

<li> <a
href=\"http://courses.csail.mit.edu/6.042/spring10/propositions.pdf\">Ch. 3</a>
due Wednesday, Feb 10.

<li> <a href=\"http://courses.csail.mit.edu/6.042/spring10/sets.pdf\">Ch. 4.1 &#65293;4.7</a> due Friday, Feb 12.
</ul>

<p><font color = blue>Tutor Assignment</font>: complete before class on
the indicated day,

<ul>
<li> TP.2.1 & 2.2 by Monday,
<li> TP.2.3 by Wednesday, and
<li> the remaining problems TP.2.4&#65293;2.8 by Friday.
</ul>


<p>Reminder: Use the <font color = blue> Submit
</font> button, <em>not the return</em> key when submitting
answers.</em></h4>" )

 (parts
  (! 
   (title "Tutor Problems 2")
   (problems 
    "practice1/41-polynomial"
    "practice1/bogus-WOP"
    "practice1/prob1"   ;propositional
;    "practice1/prob2"  ;quantifiers
    "practice1/set-operations"   ;sets
    "practice1/powerset"   ;sets
;    "practice1/prob4"  ;quantifiers over number domains
;    "practice1/prob5"   ;jections and finite cardinality
;    "practice2/prob3"  ;predicate validities
    "practice1/jections.scm"
    "practice4/inverse-relations" ;jections
    "practice4/images" ;images and inverse images
    )))
 )


(3
 (title "Feb 16&#65293;19: Cardinality, Predicate Calculus")

;  (released staff)
 
 (intro "<h4>

<p>Comments on the reading using the <em>NB online annotation system</em> are due
at the times indicated. 

<p>Reminders: 
<ul>
<li> Assigned Readings from the Text do <font color =
red>not</font> include the Problem sections.</li>

<li>Reading Comments count for 5% of the final grade.</li>
</ul>

<p><font color = blue>Reading Assignment</font>: complete by <font color =
#990000;>9AM</font> on the indicated day,

   <ul>
   <li> <a href=\"http://courses.csail.mit.edu/6.042/spring10/sets.pdf#mapping.rule\">Ch. 4.8 & 4.9</a> due Tuesday, Feb 16,

   <li> <a href=\"http://courses.csail.mit.edu/6.042/spring10/logic.pdf\">Ch. 5.1</a> due Wednesday, Feb 17,

   <li> <a href=\"http://courses.csail.mit.edu/6.042/spring10/logic.pdf#logic.sets\">Ch. 5.2</a> due Friday, Feb 19.
   </ul>

<p><font color = blue>Tutor Assignment</font>: complete before class on
the indicated day,
   <ul>
   <li> TP.3.1 by Monday,
   <li> TP.3.2&#65293;3.4 by Wednesday.
   </ul>
</ul>

</h4>" )  

 (parts
  (! 
   (title "Tutor Problems 3")
   (problems 
    "practice1/mapping-lemma"  ;jections and finite cardinality
    "practice1/prob2"  ;quantifiers
    "practice1/prob4"  ;quantifiers over number domains
    "practice2/prob3"  ;predicate validities
 
;    "practice3/prob1-nosym" ;reflex, trans, antisymm
;    "practice3/prob6-noeq"  ;equiv, total, partial
;    "practice4/prob1"       ;poset: upper/lower bounds, maximal/minimal
    )))
 )


(4
 (title "Feb. 22&#65293;Feb. 26: Induction and Partial Orders")

; (released staff)
 
 (intro 
  "<strong>

<p>Comments on the reading using the <em>NB online annotation system</em> are due
by <font color = #990000;>9AM</font> on the indicated day,

<p>   Reading assignment:   Text <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/induction.pdf\">Chapter 6</a>
      due <font color = #990000;>Mon, Feb. 22</font>;
     <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/partial_orders.pdf\">Chapter 7</a>
      due <font color = #990000;>Wed, Feb. 24</font>

<p><font color = blue>TP.4</font> due
<font color = #990000;> Wed, Feb. 24</font> before class.
</strong>"
  )

 (parts
  (! 
   (title "Tutor Problems 4")
   (problems 
;    "practice6/well-founded"
;    "practice2/prob5"      ;Ackermann function
    "practice2/prob1"      ;induction by +3
    "practice2/prob2"      ;Induction Rules
    "practice2/prob2-postage"
    "practice2/prob4"      ;bogus induction
    "practice6/prereqs"    ;course scheduling
    "practice3/relation-properties-short-answer"
    )))
 )

(5
 (title "Mar. 1&#65293;5: Digraphs, State Machines")

; (released staff)

 (intro
  "<strong>
<p>Comments on the reading using the <em>NB online annotation system</em> are due
by <font color = #990000;>9AM</font> on the indicated day.

<p>   Reading assignment: Text <a href = \"http://courses.csail.mit.edu/6.042/spring10/digraphs.pdf\">Chapter 8</a> due <font color = #990000;>Mon, Mar. 1</font>;
   <a href = \"http://courses.csail.mit.edu/6.042/spring10/state_machines.pdf\">Chapter 9, &sect;1</a> due <font color = #990000;>Wed, Mar. 3</font>
</strong>")

(parts
  (!
   (title "Tutor Problems 5")
   (problems
    "practice6/divides-dag"
    "practice6/prob1"                   ; multiplication of integers
    "practice6/prob3"                   ; chocolate bars
    )))
 )


(6
 (title "Mar. 8&#65293;12: Simple Graphs, Connectivity")

; (released staff)

 (intro 
  "<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>

<li> <a href = \"http://courses.csail.mit.edu/6.042/spring10/stable_marriage.pdf\">
Ch. 9.2</a>, <em>Stable Marrriage</em> due <font color = #990000;>Mon, Mar. 8</font>

<li>
<a href =
    \"http://courses.csail.mit.edu/6.042/spring10/simple_graphs.pdf\">Ch. 10.1--3</a>,
<em>Simple Graphs: Isomorphism, Connectivity</em>
<font color = #990000;>due Wed, Mar. 10</font>.

</ul>

</strong>")

 (parts
  (!
   (title "Tutor Problems 6")
   (problems
    "practice6/prob2"                   ; stable marriages
    "practice4/prob2"                   ;handshake lemma
    "practice4/prob3"                   ;properties preserved under isomorphism
    "practice5/prob2"                   ;trees: multiple choice version
    "practice5/prob4"                   ;spanning tree
    "practice5/connected-component"
    "practice5/prob5-short"             ;invariants on a graph algorithm
    )))
 )


(7
 (title "Mar. 15&#65293;19: Graph Coloring & Matching, Recursive Data, Planar Graphs")

;  (released staff)
 (intro 
  "<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/simple_graphs.pdf#graph.coloring\">Ch. 10.3--5</a>, <em>Graph Coloring</em> due <font color = #990000;>Mon, Mar. 15</font>.

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/recursive_data.pdf\">Ch. 11</a>, <em>Recursive Data Types</em> due <font color = #990000;>Wed, Mar. 17</font>.

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/planar_graphs.pdf\">Ch. 12</a>,
<em>Planar Graphs</em>
<font color = #990000;>due Fri, Mar. 19</font>.

</ul>

</strong>")

 (parts
  (!
   (title "Tutor Problems 7")
   (problems
    "practice4/prob5"                   ;chromatic number of some graph
    "practice5/prob3"                   ;chromatic number of a tree
    "practice4/prob6"                   ;bipartite
    "practice5/matching"                ;improvement of practice5/prob6
;    "practice6/divides-dag"             ;DAG
;    "practice2/prob5"                   ;Ackermann function
    "practice5/recursive-sequence"      ;recursive function defs
    "practice5/recursive-stringset"     ;recursive set of strings
;    "practice5/environment-model"
;    "practice6/prob4"                   ;game trees
    "planar/euler-formula"              ;counting faces
    "planar/planar-faces"               ;defining faces
    )))
 )


(8

 (title "Mar. 29&#65293;Apr. 2: GCD, Modular Arithmetic, Euler's Theorem")

; (released staff)

 (intro 
"<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>

<li> <em>Number Theory: GCD & Congruences</em>, <a href = \"http://courses.csail.mit.edu/6.042/spring10/number_theory.pdf\">
Ch.14.1&#65293;5</a> due <font color = #990000;>Mon, Mar. 29</font><br>

<em>Number Theory: Inverses, Euler's Theorem</em>,
<a href = \"http://courses.csail.mit.edu/6.042/spring10/number_theory.pdf#mod.n\">
Ch.14.6&7</a> due <font color = #990000;>Wed, Mar. 31</font>
</ul>

</strong>"
)

 (parts
  (!
   (title "Tutor Problems 8")
   (problems
;    "communication-nets/comm-net"
;    "communication-nets/benes-size.scm"
    "numbtheory/divisors.scm"
    "numbtheory/gcd-1.scm"
    "numbtheory/gcd-2.scm"
;    "practice8/prob7"       ;multiplicative inverses--subsumed by linear-combinations
;    "numbtheory/multiplicative-inverse.scm"  ;subsumed by linear-combinations
    "numbtheory/linear-combinations.scm"  ;& inverses
    "numbtheory/divisibility-congruence.scm"
    "numbtheory/fermat.scm"       ;Fermat Thm
    "numbtheory/relative-prime.scm"  ;euler's phi function
    "numbtheory/euler-theorem.scm"  ;draft
     )))
 )


(9
 (title "Apr. 5&#65293;9: Series, Asymptotics, Bijections") 

; (released staff)

 (intro 
" <strong><font color = blue>Reading Assignment</font>: complete on the indicated day
  with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/asymptotics.pdf\">Ch. 15</a>, <em>Sums and Asymptotics</em> due <font color = #990000;>Mon, Apr. 5</font>.

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/counting.pdf\">Ch. 16.1&#65293;2</a>, <em>Counting with Bijections</em> due <font color = #990000;> Fri, Apr. 9</font>.

</ul>

</strong>")

 (parts
  (!
   (title "Tutor Problems 9")
   (problems
    "practice7/prob1"                   ;Annuties
    "practice7/summation"               ;summation
    "practice7/stirling.scm"
    "practice7/prob4"                   ;integral method -was commented out
    "practice7/prob3"                   ;Big Oh
    "practice8/prob3"      ;counting B^A
    "practice8/prob5"      ;sum & product rules ;cut Fall 02
    "practice8/counting-subsets"   ;should not be heere; belongs on next TP10
    )))
 )


(10
 (title "Apr. 12&#65293;16: Counting, Inclusion/Exclusion, Card Tricks")

;  (released staff)

 (intro 
"<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
  with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/counting.pdf#pigeon_hole_sec\">Ch. 16.3&#65293;6</a>, <em>Counting Rules</em> due <font color = #990000;> Mon., Apr. 12</font>.

<li> <a href =
\"http://courses.csail.mit.edu/6.042/spring10/counting.pdf#book.keeper\">Ch. 16.7&#65293;9</a>,
<em>Division Rules, Bookkeeper Rule, Counting subsets</em> due <font color
= #990000;> Wed., Apr. 14</font>.

<li> <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/counting.pdf#inclusion.exclusion\">Ch. 16.10</a>, <em>Inclusion-exclusion</em> due <font color = #990000;> Fri., Apr. 16</font>.

</ul>

<p> Problem 2 (\"Counting Subsets\") has been repeated intentionally from TP9.

</strong>")

  (parts
   (!
    (title "Tutor Problems 10")
    (problems
    "practice8/prob1"      ;pigeonhole
    "practice8/counting-subsets"  ;repeated from TP9
;    "practice8/prob4"      ;search tree depth ;cut Fall 02
    "practice9/prob4"      ;multinomial (Bookkeeper)
    "practice9/prob5"      ;magic card trick problem
    "practice9/prob1"      ;poker hands
;     "practice9/prob2"      ;Magic card trick solution    ;cut Fall 02
    "practice8/inclusion-exclusion"
    "practice9/round-table" ;inclusion-exclusion
     )))
 )


(11
 (title "Apr. 21&#65293;23: Binomial Theorem, Combinatorial Proofs, Generating Functions")

; (released staff)

 (intro 
  "<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
  with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>
<li>  <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/counting-complete.pdf#binomial\">
          Ch. 16.11&#65293;12</a>,
     <em>Binomial Thm, Combinatorial Proofs</em> due <font color = #990000;>
       Wed., Apr. 21</font>,

<li>  <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/generating_functions.pdf\">
     Ch. 17</a>, <em>Generating Functions for Counting</em>
    due <font color = #990000;>Fri., Apr. 23</font>
</ul>

</strong>")

 (parts
  (!
   (title "Tutor Problems 12")
   (problems
    "practice9/comb-identity" ;combinatorial identity
    "practice9/repeated-pascal"
;    "practice10/prob1"
    "practice9/binomial-coeff"
    "generating/prob1"
    "generating/gen-make-change"
    )))
 )


(12
 (title "Apr. 26&#65293;30: Generating Functions; Intro to Probability")

;  (released staff)

   (intro 
"<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
  with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>
<li>  <a href =
    \"http://courses.csail.mit.edu/6.042/spring10/generating_functions.pdf\">
    Ch. 17</a>, <em>Generating Functions for Recurrences</em>
     due <font color = #990000;>Mon., Apr. 26</font>

<li><a href=
\"http://courses.csail.mit.edu/6.042/spring10/probability.pdf\">
Ch. 18</a>, <em>Introduction to Probability</em> due <font
color = #990000;>Wed., Apr. 28</font>.  You may skip optional subsections
18.3.5&#65293;18.3.7 </ul>
</strong>")

 (parts
  (!
   (title "Tutor Problems 13")
   (problems
    "generating/prob3"
    "practice10/prob1" ;probability; inclusion-exclusion
    "practice10/prob4" ;addition rule
    "practice10/prob2" ;coin flips forever
    "practice10/prob3" ;a posteriori conditional
;    "practice10/prob5" ;independent events should have been used; appears in TP13
    )))
 )


(13
 (title "May 3&#65293;May 7: Random Variables, Deviation")

;  (released staff)

   (intro 
"<strong><font color = blue>Reading Assignment</font>: complete on the indicated day
  with comments entered in the <a href=\"http://nb.csail.mit.edu\">
  NB annotation system</a> by <font color = #990000;>9AM</font> 
<ul>
         
<li><a href=
\"http://courses.csail.mit.edu/6.042/spring10/random_variables.pdf\">
Ch. 20.1&#65293;20.2</a>, <em>Random Variables: Distributions</em>, due <font color =
#990000;>Mon., May 3</font>

<li><a href=
\"http://courses.csail.mit.edu/6.042/spring10/random_variables.pdf\">
Ch. 20.3</a>, <em>Random Variables: Expectation</em>, due <font color =
#990000;>Wed., May 5</font>

<li><a href=
\"http://courses.csail.mit.edu/6.042/spring10/deviation.pdf\">
Ch. 21</a>, <em>Deviation from the Mean</em>, due <font color =
#990000;>Fri., May 7</font>

<li> <a href=
\"http://courses.csail.mit.edu/6.042/spring10/random_processes.pdf\">Ch.19</a>,
<em>Random Processes</em>, will be covered in lecture on due <font color =
#990000;>Wed., May 12</font>.  It is not covered by the problems below.

</ul>

</strong>")

 (parts
  (!
   (title "Tutor Problems 13")
   (problems
;    "practice11/prob4ab" ; Binomial Board Breaking 
;    "practice11/pre-random-var" ;subsumes 11/prob5
    "practice10/prob5" ;independent events
;    "practice11/binomial-random-variable"  ;asymptotics
     "practice11/great-expectations"
     "practice11/geometric-distribution" ;sumsumes practice11/prob6
     "practice11/expectation-implications"  ;expection conceptual
     "practice12/above-average-fingers"     ;expection conceptual
     "practice12/uniform-mean-var" ;subsumes 11/prob3, 12/prob 3
;      "practice11/prob2a" ; subsumed by 11/great-expectations
;      "practice11/prob2b" ; subsumed by 11/great-expectations
     "practice12/markov" ; same as prob1
     "practice12/prob2" ; markov & Chebyshev
   ;  "practice12/prob4" ; Wald's theorem
   ;  "practice12/prob5" ; unfinished prob re Chebyshev sampling
;     "practice12/prob6" ; markov & Chebyshev
     "practice13/sampling-conceptual" ;sampling & confidence
;     "average_number_of_fingers"
   )))
 )


(14
 (title "May 12: Random Processes
   <font color=#990000;> optional</font>")

;(due (month 12) (day 04))

;(released staff)

 (intro 
  "<strong>This set of tutor problems is not required.

<font color = blue>Reading Assignment</font>: <li> <a href=
\"http://courses.csail.mit.edu/6.042/spring10/random_processes.pdf\">Ch.19</a>,
<em>Random Processes</em> due <font color = #990000;>Wed., May 12</font>.

<p>We encourage you to comment on these readings as usual using the <a
href=\"http://nb.csail.mit.edu\"> NB annotation system</a>, but <font
color=\"green\">Reading Comments are not required.</font>.</strong>")

 (parts
  (!
   (title "Tutor Problems 14")
   (problems
    "practice13/gambler-probability"
    "practice13/unbiased-ruin-S10"
    "practice13/gamblers-expectation-recurrence.scm"
    "practice13/random-walks.scm"
;    "practice13/prob1-spiders"          ; Chernoff bound
    )))
 )


(15
 (title "May 12: Exit Questionnaire 
   <font color=#990000;> optional</font>")

; (due (month 12) (day 04))

  (released staff)

   (intro
"<strong>This survey asks for your feedback on how well 6.042J/18.062J worked for
you.  Comparing student self-assessments given in this survey to student
grades helps us determine how to improve the course.

<p>We would also be grateful for any improvements you care to suggest.</strong>")

 (parts
  (!
   (title "Tutor Problems 15")
   (problems
;     "survey/objectives"
     "survey/learning"
;     "survey/learning-short-a"
     "survey/activities"
     "survey/effort"
     "survey/comments"
     )))
 )
