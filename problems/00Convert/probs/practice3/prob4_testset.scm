(define-problem
    '(
      (type short-answer)
      (title "Composition of relations")
      (intro "Suppose A = {1,2,3}, B={4,5,6}, R={(1,4),(1,5),(2,5),(3,6)}, and S={(4,5),(4,6),(5,4)}.<br>"
             "Note that R is a relation from A to B and S is a relation from B to B."
             "<p>"
             "The expected format for the answer is the following: if you want to type S, you should type:<br>"
             "(4 5) (4 6) (5 4)<br>"
             "Note that the order in which you enter the elements does not matter."
             "<p>"
             "Find the following relations:")
;      (boxsize 5)
      (box-width 40)
;      (compare equal?)
      (questions
       (! "S o R :" (answer ( (1 5) (1 6) (1 4) (2 4) ) (compare test-set) ) )
       (! "S o S :" (answer ( (4 4) (5 5) (5 6) ) (compare test-set) ) )
       (! "S<sup>-1</sup> o R :" (answer ( (1 5) (1 4) (2 4) (3 4) ) (compare test-set) ) )
       );questions
;      (extro "")
      );'
);define-problem
