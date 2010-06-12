;; problem 1
(define-problem
  '(
    (type multiple-choice)
    (title "Properties of Relations")
    (intro "Let R and S be relations on the set A.  Check the statements below that are <B>True</B> (leave blank if <b>false</b>). <br>")
      (choices 
       (! "If R is reflexive then the complement of R is also reflexive."     (answer false))
       (! "If R is symmetric then complement of R is symmetric."     (answer true))
       (! "If R and S are reflexive then R &cap; S is also reflexive." (answer true))
       );choice
    );'
  );define-problem
