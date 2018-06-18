(define-problem
  '(
    (type short-answer)
    (title "Prerequisites")
    (intro "The prerequisites of some MIT subjects are given in the following table:
<center>
<pre>
Direct Prerequisites        Subject
 18.01                       6.042 
 18.01                       18.02 
 18.01                       18.03 
 8.01                        8.02 
 8.01                        6.01 
 6.042                       6.046 
 18.02, 18.03, 8.02, 6.01    6.02 
 6.01, 6.042                 6.006
 6.01                        6.034 
 6.02                        6.004
</pre>                      
</center>
")
    (questions
     (! "What is the minimum number of terms in which all these subjects can be completed?"
        (answer 4 (rationale 
                   "Three consective subjects must be completed before 6.004 can be taken.")))
     (! "With a 3 subject limit per term,
   what is the minimum number of terms in which all these subjects can be completed?"
        (answer 5 (rationale 
                   "6.02 has four second term prerequisites, which with
a 3 subject limit forces at least one to be postponed to the third
term. So 6.02 couldn't be taken till the fourth term, pushing 6.004 to
term 5.")))
     )                                  ;questions
                                        ;      (extro "")
    )                                   ;'
  )                                     ;define-problem
