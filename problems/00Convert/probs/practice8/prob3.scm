;; problem 3
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "Counting Functions")
    (intro 
     "How many total functions are there from set <em>A</em> to set <em>B</em>
     if |<em>A</em>|=3 and |<em>B</em>|=7?<br>
     You may answer with a formula such as <b>(3*7)^2/(3 + 7)!</b>")
    (box-width 10)
    (questions
     (! ""
        (answer "7^3"
                (compare 
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
                (rationale
                 "Each element in <em>A</em> must be mapped to an element in set <em>B</em> as the function is total. Each element in A has 7 choices. By the Product Rule, there are 7<sup>3</sup> = 343 functions.")
                ))
     )                                  ;questions
                                        ;      (extro "")
    )                                   ;'
  )                                     ;define-problem
