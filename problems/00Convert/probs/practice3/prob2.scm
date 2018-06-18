;; relation-matrix
(define-problem
  '(
    (type short-answer)
    (title "Matrix representation of relations")
    (intro "Let R be the relation represented by the matrix"
           "<p><center>"
           "<table><tr>"
           "  <td>M<sub>R</sub> =</td>"
           "  <td><table>"
           "    <tr><td>0</td><td>1</td><td>1</td></tr>"
           "    <tr><td>1</td><td>1</td><td>0</td></tr>"
           "    <tr><td>1</td><td>0</td><td>1</td></tr>"
           "  </table></td>"
           "</tr></table>"
           "</center>"
           "Find the matrix representing:")
    (box-width 3)
    (questions
     (! "R<sup>-1</sup>"
        "<br>" (answer 0) (answer 1) (answer 1)
        "<br>" (answer 1) (answer 1) (answer 0)
        "<br>" (answer 1) (answer 0) (answer 1))
     (! "complement(R)"
        "<br>" (answer 1) (answer 0) (answer 0)
        "<br>" (answer 0) (answer 0) (answer 1)
        "<br>" (answer 0) (answer 1) (answer 0))
     (! "R<sup>2</sup>"
        "<br>" (answer 1) (answer 1) (answer 1)
        "<br>" (answer 1) (answer 1) (answer 1)
        "<br>" (answer 1) (answer 1) (answer 1))
    );; questions
  );; top-level problem
);; define-problem

