(load (t:expand-ps-file-name "infix.scm"))

;;problem 2
(define-problem
  '(
    (type short-answer)
    (title "Great Expectations")
    (intro "")
    (box-width 5)
    (questions

     (! "<strong>What is the expected sum of the numbers that come up when you roll
a 6-sided and a 12-sided dice?</strong><br>"
        (answer 10
                (compare 
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
                (rationale "The expectation of a sum is the sum of the individual
	  expectations, so
<center>
(1+2+...+6)/6 + (1+2+...+12)/12 = 7/2 + 13/2=10.
</center>")))

;        (! "What is the expected value of the number that comes up
; when you roll a 6-sided die, given that you don't roll a 1?<br>"
;           (answer 4 (rationale 
; "Easily, for <em>n</em>=1,2,...,6:
; <center>
; P{roll <em>n</em> | <em>n</em> &ne; 1} = 0, if <em>n</em>=1; whereas

; P{roll <em>n</em> | <em>n</em> &ne; 1} = 1/5, if <em>n</em>&ne;1.
; </center>
; Therefore, E[<em>n</em> | <em>n</em> &ne; 1] = 1&middot;0 + (2+3+...+6)&middot;1/5=4"
; )))

     (! "<strong>Suppose you have two computers: Computer 1 generates a
random number in the set {1,2,...,99} with all numbers equally likely.
Similarly, Computer 2 generates a random number in {1,2,...,999} with all
numbers equally likely.

<p>You roll a fair die, and if a 5 comes up, you generate a random number
using Computer 1, otherwise you generate a random number using Computer 2.
What is the expected value of the number you generate?</strong><br>"

        (answer 2550/6
                (compare 
                 (lambda (ans response)
                   (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
                (rationale 
                 "By the law of Total Expectation,
<center>
E[generated number] = 
P{roll <em>5</em>} &middot; E[Computer 1 number]
+ P{<small>NOT</small> (roll <em>5</em>)} &middot; E[Computer 2 number]<br>
= (1/6)50+(5/6)500 = 2550/6."
                 )))

     (! "<strong>Assuming that Computers 1 & 2 act independently, what is the
expected value of the product of the numbers they generate?</strong><br>"

        (answer 25000 (rationale "The Product Rule can be used because
the two random variables are independent, so
<center>
E[<em>C<sub>1</sub></em>&middot;<em>C<sub>2</sub></em>] = 
E[<em>C<sub>1</sub></em>]&middot;E[<em>C<sub>2</sub></em>] = 
50&middot;500 = 25000.
</center>"
                                 )))
     )                                  ;questions
    )                                   ;'
  )                                     ;define-problem
