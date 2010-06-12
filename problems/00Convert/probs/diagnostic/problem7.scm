(load (t:expand-ps-file-name "infix.scm"))

(define-problem 
  '(
    (type short-answer)
    (title "Summations")
    (intro "")
    (box-width 10)
    (questions
     (! "Evaluate <b>2 + 4 + 6 + 8 + &middot;&middot;&middot; + 2&middot;2001 + 2&middot;2002.</b>"
        (answer "4010006"
                (compare
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response
                                                     '() '() 1 '())))))
     (! "Evaluate the sum of the terms 2<sup><em>n</em></sup> from <em>n</em>=0 to 19."
        (answer "1048575"
                (compare 
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
                ))
     )                                  ;questions
    )                                   ;'
  )                                     ;define-problem




