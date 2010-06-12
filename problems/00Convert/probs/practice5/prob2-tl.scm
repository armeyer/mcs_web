;; problem 2
(define-problem
  '(
    (type multi-part)
    (title "Trees")
    (intro "Which of the following graphs are trees ?")
    (subproblems
     (!prob 
      (type multiple-choice)
      (title "<br><br><img height=40% width=40% src=courseexport/images/ps5/pp5prob2a.gif>")
      (choices 
       (! "Tree"     (answer false))
        );choices
      );prob
     (!prob 
      (type multiple-choice)
      (title "<br><br><img height=40% width=40% src=courseexport/images/ps5/pp5prob2b.gif>")
      (choices 
       (! "Tree"     (answer true))
       );choices
      );prob
     (!prob 
      (type multiple-choice)
      (title "<br><br><img height=40% width=40% src=courseexport/images/ps5/pp5prob2c.gif>")
      (choices 
       (! "Tree"     (answer false))
        );choices
      );prob
     (!prob 
      (type multiple-choice)
      (title "<br><br><img height=40% width=40% src=courseexport/images/ps5/pp5prob2d.gif>")
      (choices 
       (! "Tree"     (answer true))
       );choices
      );prob
     );subproblems
    );'
  );define-problem
