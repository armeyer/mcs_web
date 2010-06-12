;; problem 5
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "Counting Answers")
    (intro 
     "In how many different ways is it possible to answer 
     next week's practice problems if:
     <ul>
     <li>the first problem has four <i>true/false</i> questions,</li>
     <li>the second problem requires choosing one of four alternatives,</li>
     <li>the answer to the third problem 
     was an integer &ge; 15 and &le; 20?</li>
     </ul>
     You may answer with a formula such as <b>(3*7)^2/(3 + 7)!</b>")
                                        ;      (boxsize 5)
                                        ;      (box-width 5)
                                        ;      (compare equal?)
    (questions
     (! "" (answer "384"
                   (compare 
                    (lambda (ans response)
                      (test-infix-numerical-expressions
                       ans response '() '() 1 '()))
                    )
                   (rationale
"Each 'way' to answer the practice problems can be represented as 
a 6-long sequence in which: the first four elements are true/false 
answers,  the 5th element is in {1,2,3,4} indicating which alternative 
was chosen, and the 6th element is in {15,16,17,18,19,20}.  By the Product 
Rule, there are 2<sup>4</sup> * 4 * 6 such sequences, for a total of 
384 ways to answer.")))  )  ;questions
                                        ;      (extro "")
    )                                   ;'
  )                                     ;define-problem
