;; problem 3
(define-problem
  '(
    (type short-answer)
    (title "Graph Coloring II")
    (intro "<strong>What is the chromatic number of a tree?</strong>")
;      (boxsize 5)
      (box-width 5)
;      (compare equal?)
      (questions
       (! "" (answer 2 (rationale 
"<br>
<strong>A tree has no cycles. Therefore it is bipartite (has no cycles of odd length).
This means 2 colors are <em>sufficient</em>. Moreover, if the tree has at least one edge, 
2 colors are also <em>necessary</em>.  So the chromatic number is 2.

<p>
Note that the question assumes we are in this non-trivial case, where the tree contains 
at least one edge. In the trivial case where the tree contains no edges, we know it has 
only one vertex (since it must be connected), and its chromatic number is 1.</strong>")))
       );questions
;      (extro "")
      );'
);define-problem
