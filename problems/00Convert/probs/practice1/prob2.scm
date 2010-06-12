;; prob2
(define-problem
  '((type short-answer)
    (title "Quantifiers")
    (intro "Let <em>Q</em>(<em>x</em>,<em>y</em>) be the statement 
<p>&nbsp;&nbsp;&nbsp;\"<em>x</em> has been a contestant on television show <em>y</em>.\"  
<p>The universe of discourse for <em>x</em> is the
set of all students at your school and for <em>y</em> is the set of
all quiz shows on television.
<p>Which of the following expressions is logically equivalent to
the sentence<p>

<center>\"No student at your school has ever been a contestant on a television quiz show.\"
</center>"
        )                       ;intro

    (questions
     (! "<ol>
<li> &forall;<em>x</em> &forall;<em>y</em> .
 <small>NOT</small>(<em>Q</em>(<em>x</em>,<em>y</em>))

<li> &exist;<em>x</em> &exist;<em>y</em>. <small>NOT</small>(<em>Q</em>(<em>x</em>,<em>y</em>))

<li><small>NOT</small>(&forall;<em>x</em> &forall;<em>y</em> . <em>Q</em>(<em>x</em>,<em>y</em>))

<li> <small>NOT</small>(&exist;<em>x</em> &exist;<em>y</em> . <em>Q</em>(<em>x</em>,<em>y</em>)) 
</ol><p>"
        (answer (1 4)
                (compare test-set)
;                (rationale "")
                );answer
        );!                               ;!
     )                                  ;questions
    (extro "Answer with a sequence of integers separated
   by some spaces, for example,
          <center>4  3 2</center>
 Don't use commas or periods.<p>")
    );'
  );prob
