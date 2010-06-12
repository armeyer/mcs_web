; problem 6
(define-problem
  '(
    (type short-answer)

    (title "Predicate Logic")

  (intro "Which of the following logical formulas are <i>valid</i>, that is, they always hold true?

<ol>

<li> <small>NOT</small>[<em>P</em> <small>OR</small> <em>Q</em>] &equiv; [(<small>NOT</small> <em>P)</em> <small>AND</small>
(<small>NOT</small> <em>Q</em>)]</li>

<p><li> [<em>P</em> <small>IMPLIES</small> <em>Q</em>] <small>OR</small> [<em>Q</em> <small>IMPLIES</small> <em>P</em>]</li></p>

<p><li> <small>FOR-ALL </small><em>x</em>. <small>THERE-EXISTS</small> <em>y</em> [<em>P</em>(<em>x</em>) <small>OR</small> (<small>NOT</small> <em>P</em>(<em>y</em>))]</li></p>

<p><li> <small>THERE-EXISTS</small> <em>x</em>. <small>FOR-ALL</small> <em>y</em> [<em>P</em>(<em>x</em>) <small>OR</small> (<small>NOT</small> <em>P</em>(<em>y</em>))]</li></p>

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
