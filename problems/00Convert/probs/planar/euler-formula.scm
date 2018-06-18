;; euler-formula

(define-problem
  '(
    (type short-answer)
    (title "Planar Graphs")
    (box-width 20)
    (questions
     (! "<strong>A planar graph has 7 more edges than vertices.  How many faces
does it have?</strong>"
 (answer (9) (compare test-set)
          (rationale 
"<em>v</em> - <em>e</em> + <em>f</em> = 2, so
<em>f</em>=(<em>e</em>-<em>v</em>)+2=7+2."))  ) ;!
     ) ;questions
    ) ;'
  );define-problem
