;; problem 6
(define-problem
  '(
    (type short-answer)
    (title "Bipartite Graphs")
    (intro "<center>
 <br><br><img src=courseexport/images/ps4/prob6a.GIF>
 <br><br><img src=courseexport/images/ps4/prob6b.GIF>
 <img src=courseexport/images/ps4/prob6c.GIF>
</center>
")
    (questions
     (! "<strong>Which of the graphs above are bipartite?  Give your
answer as a sequence of the labels separated by some spaces in any order
such as
<center>b a</center>
Don't use commas or parentheses.</strong>"
        (answer (a)
                (compare test-set)
                (rationale
"<strong><br>
Graph a is bipartite: The first color is assigned to the top-left, bottom-middle, 
and top-right vertices; the second color is assigned to the other three vertices.
<br><br>
Graphs b and c are not bipartite, as they contain cycles of odd length.</strong>")
                )
        )
     )
    )
  )
