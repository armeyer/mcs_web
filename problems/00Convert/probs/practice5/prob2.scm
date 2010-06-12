;; problem 2
(define-problem
  '(
    (type short-answer)
    (title "Trees")
    (intro "<strong>
<center>
<table>
<tr>
<td>1.  <img height=200 width=200 src=courseexport/images/ps5/pp5prob2a.gif> </td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>2.  <img height=200 width=200 src=courseexport/images/ps5/pp5prob2b.gif> </td>
</tr>
<tr>
<td>3.  <img height=200 width=200 src=courseexport/images/ps5/pp5prob2c.gif> </td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>4.  <img height=200 width=200 src=courseexport/images/ps5/pp5prob2d.gif> </td>
</tr>
</table>
</center><p>
Which of the graphs above are trees?
</strong>")
    (box-width 20)
    (questions
     (! "" (answer (2 4) (compare test-set)
                   (rationale 
"<strong>Graphs 2 and 4 are trees, since they are both connected and acyclic. In contrast, 
graphs 1 and 3 are not trees: graph 1 is disconnected, while graph 3 contains a cycle.</strong>"))
        ) ;!
     )                                        ;questions
    (extro "<p><strong>Answer with a sequence of integers separated
   by some spaces, for example,
<center>
4 3 2 
</center>
Don't use commas or periods.<br>")          ;extro
    ) ;'
  );define-problem
