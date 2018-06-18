;; problem 3
(define-problem
  '(
    (type multi-part)
    (title "Chocolate bars")

    (intro "We are given a chocolate bar with <i>m</i> &times; <i>n</i>
squares of chocolate, and our task is to divide it into <i>mn</i>
individual squares.  We are only allowed to split a chocolate bar using a
vertical or a horizontal cut.

<p>For example, suppose that the chocolate bar is 3 &times; 2.  A horizontal cut between the first and second rows of squares splits it into two bars, a 1 &times; 2 bar and a 2 &times; 2 bar.  One cut of the 1 &times; 2 splits it into individual squares, and three more cuts splits the 
2 &times; 2 bar into squares.  So a total of 5 cuts splits the whole 3 &times; 2 bar into squares.

<p>At each step of the division process, let <i>s</i> be the number of
splits already performed, and <i>p</i> the number of pieces of chocolate
obtained.<br>")
    (subproblems
     (!prob 
      (type short-answer)
      (title
       "Which of the following predicates are <i>preserved invariants</i> for this process ?")

      (intro "<ol>
  <li> <i>s</i> = <i>p</i> - 1
  <li> <i>s</i> &ne; <i>p</i>
  <li> <i>s</i> = <i>mn</i> - <i>p</i>
</ol>");intro
      (questions
       (! "" (answer (1 2) (compare test-set)

	             (rationale
"At every step, each of <i>s</i> and <i>p</i> increases by 1.  So, each
side of the equation in (1) and inequation in (2) increases by the same
amount.  Therefore predicates (1) and (2) are preserved.  In contrast, the
left side of (3) increases while the right side decreases."
               )));!

       );questions
      )                                 ;prob

     (!prob 
      (type short-answer)
      (title "Which of the following derived variables are <i>strictly decreasing</i>?")
      (intro "<ol>
       <li> <i>mn</i> - <i>p</i>
       <li> <i>s</i>
       <li> <i>p</i> - <i>s</i>
             </ol>");intro
      (questions
       (! "" (answer (1) (compare test-set)
                  (rationale
"At every step, each of <i>s</i> and <i>p</i> increases by 1. So,
<i>mn-p</i> is strictly decreasing, <i>s</i> is strictly increasing, and
<i>p-s</i> is constant."
          )));!
       );questions
      );prob

     (!prob 
      (type short-answer)
      (title "What is the number of pieces of chocolate at the end of the division process?")
      (intro "<ol>
  <li> <i>p</i> = <i>mn</i> - 1
  <li> <i>p</i> = <em>s</em> - 1
  <li> <i>p</i> = <i>mn</i>
</ol>");intro
      (questions
       (! "" (answer (3) (compare test-set)
(rationale "
At the end of the process every square is separated, since otherwise, more cuts could be performed.  So <i>p=mn</i>." )));!
       );questions
      )                                 ;prob

     (!prob 
      (type short-answer)
      (title "What is the number of splits performed to reach the end of the division ?")
      (intro "<ol> 
  <li> <i>s</i> = <i>mn</i> - 1
  <li> <i>s</i> = <i>mn</i>
  <li> <i>s</i> = <i>mn</i> + 1
</ol>");intro
      (questions
       (! "" (answer (1) (compare test-set)
(rationale
"By Part 1, <i>s=p-1</i> is an invariant. Moreover, it is true at the
beginning (because then <i>s=0</i> and <i>p=1</i>.  Therefore, by the
Invariant Theorem, the predicate is true throughout the process. In
particular, it is true at the end. By Part 3, we know that at the end
<i>p=mn</i>. Substituting in the invariant, we get <i>s=mn-1</i>."
        )));!
       );questions
      );prob
     );subproblems
    );'
  );define-problem
