;; problem 4
(define-problem
  '(
    (type short-answer)
    (title "Spanning Trees")
    (intro "<strong>Find a spanning tree for the following graph by removing edges.
  <p><img src=courseexport/images/ps5/pp5prob4.gif><p>
   Type in the box the edges you remove.
  <br>For each edge, you have to write the first letter in the pair first.
<br>For instance, you should write (a b) and not (b a).
<p>You should enter the edges separated by spaces: for example, if you want to answer (g k) and (u w), you should type
<center>(g k) (u w)</center>
The order in which you enter the edges does not matter.
<p>")
;      (boxsize 5)
      (box-width 20)
;      (compare equal?)
      (questions
       (! "" (answer
;              (or
               ((a b) (b c))
               ((a b) (c e))
               ((a b) (b e))
               ((a d) (b c))
               ((a d) (c e))
               ((a d) (b e))
               ((b d) (b c))
               ((b d) (c e))
               ((b d) (b e))
	       (rationale "<br>
<strong>Since the graph is connected, to make it a tree we need to break all cycles.
There are only two cycles, and removing one edge from each is enough to break them.</strong>")
;                 )
                     (compare test-set) ) )
       );questions
;      (extro "")
      );'
);define-problem

