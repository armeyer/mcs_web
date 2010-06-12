(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "Test")
    (intro "This is a test")
    (box-width 30)
    (questions

     (! "Enter an infix expression that evaluates to 120, using +, -, *, /, ^, !
and any Scheme function in f(.,.) style:"
	(answer 120
		(compare
		 (lambda (ans response)
		   (test-infix-numerical-expressions ans response '() '() 1 '()))
		 )
		))

     (! "Enter an infix expression that is equivalent to sin(x)^2, using +, -, *, /, ^, !
and any Scheme function in f(.,.) style:"
	(answer "sin(x)^2"
		(compare
		 (lambda (ans response)
		   (test-infix-numerical-expressions
		    ans response '(x) '() 10 '(0 5)))
		 )
		))

     (! "Enter an infix expression that evaluates to 2e^3-e^2, using +, -, *, /, ^, !
and any Scheme function in f(.,.) style:"
	(answer "2*e^3-e^2"
		(compare
		 (lambda (ans response)
		   (test-infix-numerical-expressions ans response '() '((e 2.718281828459045)) 1 '()))
		 )
		))
     )					;questions
    )					;'
  )
