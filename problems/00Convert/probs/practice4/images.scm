;; problem 7

(define-problem
  '(
    (type multi-part)
    (title "Images & Inverse Images")
    (intro "")
    (subproblems
     (!prob 
      (type short-answer)
      (title "Divisibility Images")
    (intro "Let <em>V</em> be the relation with the integers from 7 to 15,
      and codomain the integers from 2 to 30, such that <em>mVn</em> is true
      iff <em>m</em> is a divisor of <em>n</em>.")

      (questions

       (! "List the elements of {10,14}<em>V</em>, the image of the
set {10,14} under <em>V</em>.
<br>Answer with a sequence of integers in any
order separated by spaces.  For example,
<br> 9 7 11<br>"
          (answer (10 20 30 14 28) (compare test-set)
;                  (rationale "These are the multiples of 10 and 14 less than 30.")
                  )  ;answer
          )   ;!
      (! "List the elements of <em>V</em>{10,14},
          the inverse image of {10,14} under <em>V</em>."
          (answer (7 10 14) (compare test-set)
;                  (rationale "These are the integers from 7 to 15 that divide 10 or 14.")
                  )  ;answer
          )   ;!
       );questions
      );prob

     (!prob 
      (type multiple-choice)
      (title "Total Relations")
      (intro "A relation <em>R</em> from a set <em>A</em> to a set <em>B</em> is <b>total</b> iff (check all that apply):")
      (choices 
       (! "<em>RA</em>=<em>B</em>" (answer false))
       (! "<em>RB</em>=<em>A</em>" (answer true
                                           (rationale "See Section 4.6 of the
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
                                           (rationale "See Section 4.6 of the
                                                       lecture notes.")))
       (! "<em>BR</em>=<em>A</em>" (answer false))
       );choice 
      );prob
     );subproblems
    );'
  );define-problem

