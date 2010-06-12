(define-problem
  '(
    (type short-answer)
    (title "Generating Functions and Sequences")

    (intro "
Consider the following generating functions:<p>
<ul>
<li><b>a:</b>
x<sup>2</sup>/(1-x)
<li><b>b:</b>
e<sup>x</sup>
<li><b>c:</b>
(1+x)<sup>4</sup>
<li><b>d:</b>
(1+x)(1-x)<sup>-3</sup>
<li><b>e:</b>
1/(1-x)<sup>2</sup>
<li><b>f:</b>
1+x
<li><b>g:</b>
1/(1-x<sup>2</sup>)
</ul>

For each of the following sequences, indicate
the corresponding generating function 
by entering one of the letters <b>a b c d e f g</b>.
")

          (questions
     (! "0, 0, 1, 1, 1,  ...<br>"
      (answer (a)
              (compare test-set)
              )  ;answer
      )   ;!

     (! "1, 1, 0, 0, 0, ...<br>"
      (answer (f)
;            (rationale  ""          );rationale
              (compare test-set)
              )  ;answer
      )   ;!

     (! "1, 0, 1, 0, 1, 0, 1, ... <br>"
        (answer (g)
;               (rationale "") ;rationale
                (compare test-set)
                ) ;answer
        ) ;!
     (! "1, 4, 6, 4, 1, 0, 0, 0, ... <br>"
        (answer (c)
;               (rationale "") ;rationale
                (compare test-set)
                ) ;answer
        ) ;!

     (! "1, 1, 1/2, 1/6, 1/24, 1/120, ... <br>"
        (answer (b)
;               (rationale "") ;rationale
                (compare test-set)
                ) ;answer
        ) ;!

     (! "1, 2, 3, 4, 5, ... <br>"
        (answer (e)
               (rationale "Derivative of 1/(1-x)") ;rationale
                (compare test-set)
                ) ;answer
        ) ;!

     (! "1, 4, 9, 16, 25, ... <br>"
        (answer (d)
               (rationale "Derivative of x(1-x)<sup>-2</sup>") ;rationale
                (compare test-set)
                ) ;answer
        ) ;!



     );questions
          );'
  );define-problem
