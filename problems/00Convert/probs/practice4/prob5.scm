;; problem 5
(define-problem
  '(
    (type short-answer)
    (title "Graph Coloring I")
    (intro 
;"Find the chromatic number of the given graph<br>"
;"Type the chromatic number in the box"
;          " <br><br><img src=courseexport/images/ps4/prob5.gif>")
          " <img src=courseexport/images/ps4/prob5.gif>")
;      (boxsize 5)
      (box-width 5)
;      (compare equal?)
      (questions
       (! "<strong>What is the chromatic number of the above graph?</strong>" 
            (answer 3 
                (rationale 
"
<strong><br>
The chromatic number of this graph is 3. 

First, 3 colors are <em>sufficient</em>: Two colors are enough for the
vertices of the outer rim (<em>a, b, c, d, e</em>, and <em>f</em>), if we
alternate them along the rim.  Then a third color can be used for the
vertex, <em>g</em>, in the center.

Second, 3 colors are <em>necessary</em>: Because the graph contains a triangle,
for example, the one formed by <em>a</em>, <em>b</em>, and <em>g</em>,
and every triangle needs 3 colors.</strong>")))
       );questions
;      (extro "")
      );'
);define-problem
