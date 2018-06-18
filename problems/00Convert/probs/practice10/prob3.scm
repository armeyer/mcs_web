;; problem 3
(define-problem
  '(
    (type short-answer)
    (title "Conditional Probability")
    (intro
     "<strong>Let
<center> 
<table>
<tr><td><strong><em>A</em> ::= the event that Albert is giving the lecture,</strong></td></tr>
<tr><td><strong><em>L</em> ::= the event that Louis Reasoner goes to lecture,</strong></td></tr>
</table>
</center>
where
<center>
<table>
<tr><td><strong>Pr{<em>A</em>} = 0.8,</strong></td></tr>
<tr><td><strong>Pr{<em>L</em>} = 0.4.</strong></td></tr>
</table>
</center>
Also, the probability that Louis goes to lecture, given that Albert is
          giving the lecture, is 0.3.
     <br>What is the probability that Albert is giving the
     lecture, given that Louis Reasoner goes to lecture?</strong>")
;      (boxsize 5)
      (box-width 5)
;      (compare equal?)
      (questions
       (! "" (answer  0.6 (rationale
"Straightforward use of the <i>a posteriori</i> probability formula.  By definition
<center>Pr{<em>A</em> | <em>L</em>}&middot;Pr{<em>L</em>} =
Pr{<em>A</em> &cap; <em>L</em>} =
Pr{<em>L</em> | <em>A</em>}&middot;Pr{<em>A</em>}.</center>
Solving for Pr{<em>A</em> | <em>L</em>} gives
<center>Pr{<em>A</em> | <em>L</em>} = Pr{<em>L</em> | <em>A</em>}&middot;Pr{<em>A</em>}/Pr{<em>L</em>} = (0.3 &middot; 0.8)/0.4 = 0.6.
</center>"
)))
       );questions
;      (extro "")
      );'
);define-problem
