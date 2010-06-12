; prob3
(define-problem
  '((type short-answer)
    (title "Predicate Logic")
    (intro "<strong>Which of the following are <i>valid</i>?

<ol>

<li> &exist;<em>x</em>&exist;<em>y</em> <em>P</em>(<em>x</em>, <em>y</em>)
<small>IMPLIES</small> &exist;<em>y</em>&exist;<em>x</em> <em>P</em>(<em>x</em>,
<em>y</em>)</p>

<li> &forall;<em>x</em>&exist;<em>y</em> <em>Q</em>(<em>x</em>,
<em>y</em>) <small>IMPLIES</small> &exist;<em>y</em>&forall;<em>x</em>
<em>Q</em>(<em>x</em>, <em>y</em>)</p>

<li> &exist;<em>x</em>&forall;<em>y</em> <em>R</em>(<em>x</em>,
<em>y</em>) <small>IMPLIES</small> &forall;<em>y</em>&exist;<em>x</em>
<em>R</em>(<em>x</em>, <em>y</em>)</p>

<li> <small>NOT</small>(&exist;<em>x</em> <em>S</em>(<em>x</em>)) &nbsp;&nbsp;<small>IFF</small>&nbsp;&nbsp;
&forall;<em>x</em> <small>NOT</small>(<em>S</em>(<em>x</em>))

</ol></strong>");intro

    (questions
     (! "<strong>Answer with a sequence of integers separated
   by some spaces, for example,
<center>
4 3 2 
</center>
Don't use commas or periods."
        (answer (1 3 4)
                (compare test-set)
                (rationale
                 "<p>1. Quantifiers of the <em>same</em> type
(existential or universal) can be reordered without altering the meaning
of the statement.</p>

<p>2. For example, let <em>Q</em>(<em>x</em>, <em>y</em>) be (<em>y >
x</em>) and suppose the domain is nonnegative integers.  Then the left
side asserts that for every natural number, there is a larger natural
number, which is true.  The right side asserts that there exists a natural
number greater than every other natural number, which is false.
Therefore, the implication as a whole is false, and the statement is not
valid.</p>

<p>3.  Suppose that the left side is true.  Then there
exists an <em>x</em><sub><em>0</em></sub> such that for all <em>y</em>,
<em>R</em>(<em>x</em><sub><em>0</em></sub>, <em>y</em>) is true.  Thus,
for all <em>y</em>, there exists an <em>x</em> (namely,
<em>x</em><sub><em>0</em></sub>), such that <em>R</em>(<em>x</em>,
<em>y</em>) is true.  Therefore, the right side is also true, and the
statement is valid.</p>

<p>4. If it's not true that there is an element in the domain with
property <em>S</em>, then <em>every</em> element in the domain must
<em>not</em> have property <em>S</em>.  Conversely, if <em>every</em>
element in the domain does <em>not</em> have property <em>S</em>, it can't
be true that some element in the domain has property <em>S</em>.
");rationale
                );answer
          );!
       )    ;questions
    )    ;'
  )  ;define-prob
