;; problem 7

(define-problem
  '(
    (type multi-part)
    (title "Images & Inverse Images")
    (intro "")
    (subproblems
     (!prob 
      (type multiple-choice)
      (title "Total Relations")
      (intro "A relation <em>R</em> from a set <em>A</em> to a set <em>B</em> is <b>total</b> iff (check all that apply):")
      (choices 
       (! "<em>RA</em>=<em>B</em>" (answer false))
       (! "<em>RB</em>=<em>A</em>" (answer true
                                           (rationale "See Section 1.3 of the
                                                       lecture notes.")))
       (! "<em>AR</em>=<em>B</em>" (answer false))
       (! "<em>BR</em>=<em>A</em>" (answer false))
       );choice 
      );prob

     (!prob 
      (type multiple-choice)
      (title "Surjective Relations")
      (intro "A relation <em>R</em> is <b>surjective</b> iff 
              (check all that apply):")
      (choices 
       (! "<em>RA</em>=<em>B</em>" (answer false))
       (! "<em>RB</em>=<em>A</em>" (answer false))
       (! "<em>AR</em>=<em>B</em>" (answer true
                                           (rationale "See Section 1.3 of the
                                                       lecture notes.")))
       (! "<em>BR</em>=<em>A</em>" (answer false))
       );choice 
      );prob
     );subproblems
    );'
  );define-problem

