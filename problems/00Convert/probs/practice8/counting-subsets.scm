;; problem 3
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "Counting Subsets")
    (intro 
     "Consider a 6 element set <em>X</em> with elements {x<sub>1</sub>, x<sub>2</sub>, x<sub>3</sub>, x<sub>4</sub>, x<sub>5</sub>, x<sub>6</sub>}. <br>
     You may answer with a formula such as <b>(3*7)^2/(3 + 7)!</b>")
    (box-width 10)
    (questions
     (! "How many subsets of <em>X</em> contain x<sub>1</sub>?"
        (answer "2^5"
                (compare 
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
                (rationale
                 "We showed in the lecture notes that there is a bijection between the subsets of <em>X</em> and binary strings of length 6. In the binary string, one of the positions is now fixed - namely, the first position must be 1 as we are only interested in subsets that have x<sub>1</sub>. We still have 2 choices for all the other positions and by the product rule, we get that the number of subsets is 2^5.")
                ))
     (! "How many subsets of <em>X</em> contain x<sub>2</sub> and x<sub>3</sub> but do not contain x<sub>6</sub>?"
        (answer "2^3"
                (compare 
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
                (rationale
                 "Same logic - a bijection between the answer to this question and the number of binary strings of length 6 with 3 positions fixed. There are 2^3 subsets.")
                ))
     )                                  ;questions
                                        ;      (extro "")
    )                                   ;'
  )                                     ;define-problem
