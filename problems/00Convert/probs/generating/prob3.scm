(define-problem
  '(
    (type short-answer)
    (title "Generating function of a recurrence")
    (intro "Let <em>b, c</em>, <em>a</em><sub>0</sub>,
<em>a</em><sub>1</sub>, <em>a</em><sub>2</sub>,... be real numbers such that
<center>
<em>a</em><sub><em>n</em></sub> =
<em>b</em>(<em>a</em><sub><em>n</em>-1</sub>) + <em>c</em>
</center>
for <em>n</em> &ge; 1.

<p>Let <em>G(x)</em> be the generating function for this sequence.")
    (box-width 10)
    (questions

     (! "The coefficient of <em>x<sup>n</sup></em> in the series expansion
    of <em>G(x)</em> is"
        (answer "a_n"
        (options ""
     "a_0"
    "a_(n-1)" 
    "a_n"
    "a_(n+1)"
    "b^n")))

     (! "The coefficient of <em>x<sup>n</sup></em> for <em>n</em> &ge; 1 in
    the series expansion of <em>bxG(x)</em> is"
        (answer  "b(a_(n-1))" 
        (options ""
         "ba_0"
    "b(a_(n-1))" 
    "b(a_n)"
    "b(a_(n+1))"
    "b^n")))

     (! "The coefficient of <em>x<sup>n</sup></em> for <em>n</em> &ge; 1 in
    the series expansion of <em>cx/</em>(1-<em>x</em>) is"
        (answer  "c"
        (options  ""
         "c"
        "c^2"
        "c/(n!)"
        "1/(1-c)"
        "c(-1)^n"
        "(-c)^n")))

     (! "Therefore, <em>G(x)</em> - <em>bxG(x)</em> -
     <em>cx/</em>(1-<em>x</em>) ="
        (answer  "a_0"
        (options  ""
                  "0"
                 "1"
                 "a_0"
                 "b"
                 "c"
            "a_1 - b(a_0) - c")))

    (! "Using the method of partial fractions, we can find real numbers 
        <em>d</em> and <em>e</em> such that
<center>
       <em>G(x)</em> = <em>d/L(x)</em> + <em>e/M(x)</em>
</center>
where <em> L(x)</em> and <em>M(x)</em> are"
        (answer  "(1-x) and (1-bx)"
        (options  ""
                 "(1-x) and (1-bx)"
                 "(x-1) and (x-b)"
                 "(1- a_0 x) and (x - 1)"
                 "(1-cx) and (1- x^2)"
                 "(1-cx) and (x-1)"
                 "(x-c) and (x-(1/b))")
        (rationale
          "We have
<center>
<em>G(x)</em> - <em>bxG(x)</em> - <em>cx/</em>(1-<em>x</em>) = <em>a</em>_0.
</center>
      Solving for <em>G(x)</em>, we have
<center>
<em>G(x)</em> = <em>cx/</em>(1-<em>x</em>)(1-<em>bx</em>)
                + <em>a</em>_0/(1-<em>bx</em>).
</center>
which by the method of partial fractions  can be expressed in the form
<center>
<em>d/</em>(1-<em>x</em>) + <em>e/</em>(1-<em>bx</em>).
</center>")))
     );questions
    );'
  );define-problem
