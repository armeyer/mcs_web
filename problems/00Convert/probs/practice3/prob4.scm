(define-problem
    '(
      (type short-answer)
      (title "Composition of relations")
      (intro "Let
              <center>
              <table>
              <tr><td><em>A</em> ::= {1,2,3},</td></tr>

              <tr><td><em>B</em> ::= {4,5,6},</td></tr>

              <tr><td><em>R</em> ::= {(1,4),(1,5),(2,5),(3,6)}, and</td></tr>

              <tr><td><em>S</em> ::= {(4,5),(4,6),(5,4)}.</td></tr>
              </table>
              </center>

              <p> Note that <em>R</em> is a relation from <em>A</em> to
<em>B</em> and <em>S</em> is a relation from <em>B</em> to <em>B</em>.

<p> List the pairs in the relations below.
    (For example, to list the pairs in <em>S</em>, you should type:
     <center>(4 5) (4 6) (5 4)</center>
     without commas or outer parens.)")
;      (boxsize 5)
      (box-width 40)
;      (compare equal?)
      (questions
       (! "<em>S</em> &#65518; <em>R</em> :" (answer ( (1 5) (1 6) (1 4) (2 4) ) (compare test-set) ) )
       (! "<em>S</em> &#65518; <em>S</em> :" (answer ( (4 4) (5 5) (5 6) ) (compare test-set) ) )
       (! "<em>S</em> <sup>-1</sup> &#65518; <em>R</em> :" (answer ( (1 5) (1 4) (2 4) (3 4) ) (compare test-set) ) )
       );questions
;      (extro "")
      );'
);define-problem
