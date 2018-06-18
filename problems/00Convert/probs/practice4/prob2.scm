;; problem 2
(define-problem
  '(
    (type short-answer)
    (title "Edges and Degrees")
    (intro "")
    (box-width 10)
     (questions
      (! "<strong>How many edges does a graph have if the degrees of its vertices are 4,3,3,2,2?</strong>"
         (answer 7
                 (rationale "<strong>In every graph, the sum of the degrees equals twice the number of edges.  
                             Since 4+3+3+2+2 = 14, we have 7 edges.</strong>")) )
      );ques
    )  ;')
  )    ; define-problem

