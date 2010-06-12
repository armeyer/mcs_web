;; gamblers-expectation-recurrence.scm

(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "Biased Gambler's Ruin")

    (intro "<strong>Suppose that a gambler wins each $1 bet with
probability 0.49, and the gambler keeps betting until he runs out of money
or he reaches some fixed goal of <em>T</em> dollars.

<p>Let <em>t</em>(<em>n</em>) be the expected number of <i>bets</i> the
gambler makes until the game ends, where <em>n</em> is the number of
dollars the gambler has when he starts betting.  Then the function
<em>t</em> satisfies a linear recurrence of the form

<p> <center> <em>t</em>(<em>n</em>) = <em>a</em>
&middot; <em>t</em>(<em>n</em>+1) + <em>b</em> &middot;
<em>t</em>(<em>n</em>-1) + <em>c</em> </center><p>

for real constants <em>a,b,c</em> and 0 < <em>n</em> < <em>T</em>.</strong>")
    (questions 
     (! "What is the value of <em>a</em>?" (answer "0.49"
                  (compare 
                   (lambda (ans response)
                     (test-infix-numerical-expressions ans response '() '() 1 '())))
		  ))
     (! "What is the value of <em>b</em>?" (answer "0.51"
                  (compare 
                   (lambda (ans response)
                     (test-infix-numerical-expressions ans response '() '() 1 '())))
		  ))
     (! "What is the value of <em>c</em>?" (answer "1"))
     (! "What is <em>t</em>(0)?" (answer "0"))
     (! "What is <em>t</em>(<em>T</em>)?" (answer "0"))
))
)

