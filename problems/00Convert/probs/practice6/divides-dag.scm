;; divides-dag.scm
(define-problem
  '(
    (type short-answer)
    (title "The Divisibility DAG")
      (boxsize 5)
;      (box-width 10)
      (questions
       (! "
<center>
<img src=\"courseexport/images/divi2.gif\"
     width=300 height=300 align=bottom border=0><p>
<!--
  <img src =
\"http://courses.csail.mit.edu/6.042/fall09/latex-macros/figures/divi2.gif\"width=500 height=500 align=bottom border=0>
-->
</center>

<strong>In this <a href =
\"http://courses.csail.mit.edu/6.042/spring10/mcs.pdf#divisibility.DAG\">
DAG for the divisibility relation on {1, ..., 12}</a>, there is an upward
path from <em>a</em> to <em>b</em> iff <em>a</em> | <em>b</em>.  If 24 was
added as a vertex, what is the minimum number of edges that must be added
to the DAG to represent divisibility on {1, ..., 12, 24}?</strong>"

          (answer 2
                  (rationale "Edges from 8 and 12 to 24 are all that are needed."))
          ) )                           ;questions
;      (extro "")
      );'
)
