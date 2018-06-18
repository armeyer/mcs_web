(define-problem 
  '((type short-answer)
    (title "Propositions with Quantifiers")
    (intro "Consider the following propositions:<p>
<ol>

<li>&forall;<em>x</em> &exist;<em>y</em> . 2<em>x</em>-<em>y</em>=0
<li>&forall;<em>x</em> &exist;<em>y</em> . <em>x</em>-2<em>y</em>=0
<li>&forall;<em>x</em> . <em>x</em>&lt;10 &rArr; (&forall;<em>y</em> . 
    <em>y</em>&lt;<em>x</em> &rArr; <em>y</em>&lt;9)
<li>&forall;<em>x</em> &exist;<em>y</em> . <em>y</em>&gt;<em>x</em> && 
    (&exist; <em>z</em> . <em>y</em>+<em>z</em>=100)
</ol>

Determine which propositions are true when the variables range over:
")

    (questions 
     (! "the natural numbers. " (answer (1 3)
                                        (compare test-set)
                                        (rationale
       "Counterexample for 2:  let <em>x</em>=1.<br>
        Counterexample for 4:  let <em>x</em>=100.")))
     (! "the integers. " (answer (1 3 4)
                                        (compare test-set)
                                        (rationale
       "Counterexample for 2:  let <em>x</em>=1.")))
     (! "the real numbers. " (answer (1 2 4)
                                        (compare test-set)
                                        (rationale
       "Counterexample for 3:  let <em>x</em>=9.5.")))
    )

    (extro "Give your answer as a sequence of integers separated by some
     spaces (<em>e.g.</em>, \"4 2 3\").  Don't use commas or
   parentheses.<p>")
))
