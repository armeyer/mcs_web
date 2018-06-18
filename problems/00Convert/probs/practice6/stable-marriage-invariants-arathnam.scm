;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Stable Marriage Invariants")
    (intro "Recall the boy-optimal and girl-optimal stable marriage problems from the lecture notes:-")
    (questions
     (! "Which of the following predicates are <i>invariants</i> for the boy-optimal stable marriage algorithm?
<ol>
  <li> For every girl, <i>G</i>, and every boy, <i>B</i>, if <i>G</i>   is crossed off <i>B</i>'s list, then <i>G</i> has a suitor who she prefers over <i>B</i>.
  <li> For every boy, <i>B</i>, and every girl, <i>G</i>, if <i>G</i>   is crossed off <i>B</i>'s list, then <i>B</i> has a girl to suit who he prefers over <i>G</i>.
</ol><p>
"
        (answer (1) (compare test-set)
	  (rationale "Predicate(1) is true - <i>G</i>'s favorite tomorrow will be at least as desirable to her as her favorite today, and since her favorite today is more desirable than <i>B</i>, her favorite tomorrow will be more desirable than <i>B</i> as well. Since this is true on the first day, it will hold till the algorithm terminates and all stable matings are assigned. Predicate(2) is false - if <i>G</i> is crossed off <i>B</i>'s list, <i>B</i> is now suiting a girl he prefers less than <i>G</i> as <i>B</i>'s list is ordered from most preferred girl to least preferred girl.")))
    (! "Which of the following predicates are <i>invariants</i> for the girl-optimal stable marriage algorithm?
<ol>
  <li> For every girl, <i>G</i>, and every boy, <i>B</i>, if <i>B</i>   is crossed off <i>G</i>'s list, then <i>B</i> has a suitor who he prefers over <i>G</i>.
  <li> For every boy, <i>B</i>, and every girl, <i>G</i>, if <i>B</i>   is crossed off <i>G</i>'s list, then <i>G</i> has a boy to suit who she prefers over <i>B</i>.
</ol><p>
"
        (answer (1) (compare test-set)
	  (rationale "Predicate(1) is true - <i>B</i>'s favorite tomorrow will be at least as desirable to him as his favorite today, and since his favorite today is more desirable than <i>G</i>, his favorite tomorrow will be more desirable than <i>G</i> as well. Since this is true on the first day, it will hold till the algorithm terminates and all stable matings are assigned. Predicate(2) is false - if <i>B</i> is crossed off <i>G</i>'s list, <i>G</i> is now suiting a boy she prefers less than <i>B</i> as <i>G</i>'s list is ordered from most preferred boy to least preferred boy.")))) ;questions
    );
  );define-problem










































