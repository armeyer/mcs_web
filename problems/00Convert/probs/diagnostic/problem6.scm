; problem 6
(define-problem
  '(
    (type short-answer)

    (title "Predicate Logic")

  (intro "Which of the following logical formulas are <i>valid</i>, that is, they always hold true?

<ol>

<li> &not;[<em>P</em> &or; <em>Q</em>] &equiv; [&not;<em>P</em> &and;
&not;<em>Q</em>]</li>

<p><li> [<em>P</em> &rarr; <em>Q</em>] &or; [<em>Q</em> &rarr; <em>P</em>]</li></p>

<p><li> &forall;<em>x</em>&exist;<em>y</em> [<em>P</em>(<em>x</em>) &or; &not;<em>P</em>(<em>y</em>)]</li></p>

<p><li> &exist;<em>x</em>&forall;<em>y</em> [<em>P</em>(<em>x</em>) &or; &not;<em>P</em>(<em>y</em>)]</li></p>

</ol>");intro

    (questions
     (! "Answer with a sequence of integers separated
   by some spaces, <em>e.g.</em>, \" 4 3 2\".  Don't use commas or
   parentheses."
        (answer (1 2 3 4)
                (compare test-set));answer
          );!
       )    ;questions
    )    ;'
  )  ;prob
