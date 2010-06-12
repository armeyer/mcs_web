;unbiased-ruin.scm

(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Unbiased Gambler's Ruin") 
      (intro "")
      (box-width 5)
      (questions
       (! "<strong>In the unbiased Gambler's ruin game, if the Gambler's
initial capital is $40, what is the probability that his capital at some
point grows to be $100?</strong>"
          (answer 2/5
                  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '()))) 
		  (rationale "The answer is the
quotient of capital and goal amount, namely, 40/100.")))

       (! "<strong>What is the expected number of bets made until the game
ends?</strong>"
          (answer 2400 
		  (rationale "The expected number of bets is the product
of initial capital and intended profit, namely, 40&middot;(100-40).")))
       );questions
      );'
    );define-problem
