(load (t:expand-ps-file-name "infix.scm"))
; problem 1
(define-problem
  '(
    (type multi-part)
    (title "Derivatives and Integrals")
    (intro "<b><font color=\"green\">Reminder: answer all the diagnostic questions on your own,
without looking at any references.</font></b><p>")
    (subproblems

     (!prob
      (type short-answer)
      (title "Derivatives")
      (intro "" )
      (questions
       (! "What is the value of the derivative of " (math "x \\ln \\frac{x}{e}")
          " at " (math "\\sqrt{e}?") "&nbsp;&nbsp;"

          (answer 0.5 "1/2" (rationale
                             "Explanation: <center>"
                             (math "\\frac{d \\left(x \\ln \\frac{x}{e}\\right)}{dx} = \\ln x,") "
</center>
and " (math "\\ln \\sqrt{e} = 1/2."))))  ) ;questions
      )                                 ;prob

     (!prob 
      (type short-answer)
      (title "Integrals")
      (intro "")
      (questions 

       (! "What is the value of <center>" (math "\\int_{e^2}^{e^3} \\ln x\\, dx?")
          "</center>
You may evaluate your answer numerically (please answer with at least 3
digits of precision after the decimal) or you may leave your answer as an
expression in infix notation using +, -, *, /, ^ (for
exponentation), for example \"(3 * 47^2)/e.\" <p>"
          (answer "2*e^3-e^2" "32.782..."
                  (compare
                   (lambda (ans response)
                     (test-infix-numerical-expressions ans response
                                                       '() '((e 2.718281828459045)) 1 '())))
                 (rationale "Explanation: <center>"
                             (math "\\int \\ln x\\,dx = x \\ln \\frac{x}{e}")
"</center>
from the  Part 1, so the answer is
<center>"
(math "e^3 \\ln \\frac{e^3}{e} - e^2 \\ln \\frac{e^2}{e}=2e^3-e^2")
"</center>The ascii notation for this last expression is \"2*e^3-e^2.\" "
                             ))))

      )                                 ;prob
    
     )                                  ;subproblems
    
    )                                   ;'
  
  )                                     ;define-problem
