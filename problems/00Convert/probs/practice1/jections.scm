;; jections.scm
(define-problem 
  '((type short-answer)
      (title "In- ,Sur-, and Bijections")
        (intro "For each of the following real-valued functions on the
real numbers, indicate whether it is a <b>B</b>ijection, a
<b>S</b>urjection but not a bijection, an <b>I</b>njection but not a
bijection, or <b>N</b>either an injection nor a surjection.")
          (questions 
           (! (math "x+2")
              (answer "B"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")))
           (! (math "2x")
              (answer "B"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")))
           (! (math "x^2")
              (answer "N"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")
                      (rationale "not a surjection, since negative numbers are not squares of reals, and not an injection since " (math "(-1)^2=1^2."))))
           (! (math "x^3")
              (answer "B"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")))
           (! (math "\\sin\\, x")
              (answer "N"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")

                     (rationale "not a surjection, since " (math "-1 \\leq
                  \\sin x \\leq 1,") "and not an injection, since "
                  (math "\\sin\\, 0 = \\sin\\, 2\\pi."))))
           (! (math "x\\sin\\, x")
              (answer "S"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")
                      (rationale "not an injection, since "
                                 (math "0\\,\\sin\\, 0 = 2\\pi\\, \\sin\\, 2\\pi.")"")))
           (! (math "e^x")
              (answer "I"
                      (options "" 
                               "B" 
                               "S" 
                               "I"
                               "N")
                      (rationale "not a surjection, since " (math "e^x") "
      is always positive for real values of " (math "x."))))
           )))
