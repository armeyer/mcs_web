;gambler-probability.scm

(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Gambling on Coin Flips") 
      (intro "")
      (box-width 5)
      (questions
(! "<strong>I have $30 and you have $90.  When the flip of a fair coin comes up
Heads, I pay you $1, and when it comes up Tails, you pay me $1.  We keep
flipping until one of us runs out of money.  What is the probability that
I run out of money first?</strong>"
          (answer 3/4
                  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions

		      ans response '() '() 1 '()))) 
		  (rationale "This is the same as the probability that the
Gambler reaches his goal in the unbiased game starting with $90 and aiming
for a goal of $(30+90), so the answer is the quotient of initial capital
and goal amount, namely, 90/(30+90)= 3/4.")))

       );questions
      );'
);define-problem
