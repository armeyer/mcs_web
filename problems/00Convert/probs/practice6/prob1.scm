;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Integer Multiplication")
    (intro "Suppose that the following procedure is used to multiply two non-negative integers <i>a</i> and <i>b</i>.

<p> <i>x</i> ::= <i>a</i><br>
    <i>y</i> ::= <i>b</i><br> 
    <i>p</i> ::= 0.<p>

Repeat the following commands:

<ul>

<li> if <i>x</i> = 0, then output <i>p</i> and terminate, else

<li> if <i>x</i> is even, then set <i>x</i> ::= <i>x</i>/2 and <i>y</i>
::= 2<i>y</i>, else

<li>if <i>x</i> is odd, then set <i>x</i> ::= <i>x</i> - 1 and <i>p</i>
::= <i>p</i> + <i>y</i>.
</ul>")
    (questions
     (! "Which of the following predicates are <i>preserved invariants</i>
for this algorithm?
<ol>
  <li> <i>xy</i> = <i>p</i>
  <li> <i>xy</i> = <i>ab</i>
  <li> <i>xy</i> + <i>p</i> = <i>ab</i>
  <li> <i>xyp</i> = <i>ab</i>
</ol><p>
"
        (answer (3) (compare test-set)
	  (rationale"
Predicates (1), (2), and (4) are preserved by the second step of the algorithm, 
but not necessarily by the third step.  Predicate (3) is preserved by both steps: In 
the second step, the product <i>xy</i> remains the same and so does <i>p</i>; so the
sum keeps its old value. In the third step,  the product <i>xy</i>  decreases by 
<i>y</i> and <i>p</i> increases by <i>y</i>; so the sum again keeps its old value.")
     ))
     (! "Which of the following derived variables are <i>strictly decreasing</i>?
<ol>
  <li> <i>x</i>
  <li> </i>xy</i>
  <li> <i>p</i> - <i>y</i>
  <li> <i>x</i> + <i>p</i>
</ol><p>
" 
        (answer (1) (compare test-set)
(rationale"
In every step: <i>x</i> is  either halved or reduced by 1, so it is strictly decreasing;
<i>xy</i> either remains the same or reduces by <i>y</i>, so it is weakly decreasing;
<i>p-y</i> and <i>x+p</i> may decrease or increase, so they are not monotone.")))
     ) ;questions
    );
  );define-problem










































