; problem 1
(define-problem
    '(
      (type short-answer)
      (title "Partial ordering")
      (intro "We consider the \"divides\" partial order on the set<p>
             <center>
             {2,4,6,9,12,18,27,36,48,60,72}.
             </center><br>
             Here, for example, 2 is \"smaller than\" 4 because 2 divides 4.
             <p>")
;      (boxsize 5)
      (box-width 30)
;      (compare equal?)
      (questions
       (! "Which are the minimal elements?"
          (answer ( 2 9 ) (compare test-set) ) )
       (! "Which are the maximal elements?"
          (answer ( 27 48 60 72 ) (compare test-set) ) )
       (! "Which are larger than <em>both</em> 2 and 9?"
          (answer ( 18 36 72 ) (compare test-set) ) )
       );questions
      (extro "For each part, give your answer as a sequence of 
             numbers separated by some spaces (e.g., \"6 9\"). 
             Don't use commas or parentheses.<p>")
      );'
);define-problem
