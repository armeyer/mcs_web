;; problem 4
(define-problem
  '(
    (type short-answer)
    (title "Cut vertices")
    (intro "<strong>A vertex in a graph is a <B>cut vertex</B> if removing it and all its incident edges makes the graph disconnected.<p>"
	     "Find all the cut vertices of the graph below."
           " <br><br><img src=courseexport/images/ps4/prob4.gif>"
           "<p>"
           "Give your answer as a sequence of lower 
case letters separated by some spaces<br>
  (e.g., \"a b\"). 
Don't use commas or parentheses.</strong><p>")
;      (boxsize 5)
      (box-width 20)
;      (compare equal?)
      (questions
       (! "" (answer ( c ) (compare test-set) (rationale "Vertex c is the only cut vertex.  If it were removed, the graph would become disconnected.  This is because it joins the two parts of the graph together.  Any other vertex is part of a cycle containing c, and so removing it will keep all other vertices connected to c.")))
       );questions
;      (extro "")
      );'
);define-problem

