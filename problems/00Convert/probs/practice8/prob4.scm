;; problem 4
(define-problem
  '(
    (type short-answer)
    (title "Counting Questions")
    (intro 

     "<strong>I am thinking of a number between 1 and 1000. <br> What is
the least number of yes/no questions you could ask to be guaranteed of
discovering the answer?</strong>"
     )
;      (boxsize 5)
      (box-width 5)
;      (compare equal?)
      (questions
       (! ""
          (answer  10
                   (rationale 

"<strong>The best you can do with a yes/no question is to just halve the
space of remaining possibilities about what the number might be.  So,
starting with 1000 possibilities, the first question (\"Is the number
greater than 500?\") can lead you to only 500 possibilities, the second
question can lead you to only 250, etc.  The smallest <i>n</i> such that "
(math "2^n \\geq 1000") " is <i>n=10</i>, so you will need 10 questions
(in the worst case).</strong>")))  )
;      (extro "")
      )
)
