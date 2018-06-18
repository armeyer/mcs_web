;;problem 4
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Binomial Board Breaking")
      (intro "Bruce Lee, on a movie that didn't go public, is practicing 
by breaking 5 boards with his fists.  If he is able to break a board with
probability 0.8 (he is practicing with his left fist, that's why it's 
not 1), and he breaks each board independently.")
      (box-width 50)
      (questions
       (! "What is the probability that Bruce breaks exactly 2 out of the 5 boards 
that are placed before him? <br>
(Your answer can be an infix expression such as <tt>(3! * 4!)^2 + 5</tt>.)"
          (answer "(5! / (3! * 2!)) * (8/10)^2 * (2/10)^3"
          (compare 
	      (lambda (ans response)
               (test-infix-numerical-expressions ans response '() '() 1 '())))
          (rationale "This is the standard Binomial probability: There are 5 choose 2 
ways for 2 of the 5 boards to be broken. Each one of these ways happens with probability 
(0.8)<sup>2</sup>(0.2)<sup>3</sup>. Overall, the probability is:
<center>
C(5,2) &middot; (0.8)<sup>2</sup> &middot; (0.2)<sup>3</sup>
</center>")))

       (! "What is the probability that Bruce breaks at most 3 out of the 5 boards 
that are placed before him? <br>
(Your answer can be an infix expression such as <tt>(3! * 4!)^2 + 5</tt>.)"
          (answer "1 - 5*(8/10)^4*(2/10) - (8/10)^5"
          (compare 
	      (lambda (ans response)
               (test-infix-numerical-expressions ans response '() '() 1 '())))
          (rationale "This is 1 minus the probability that 4 or 5 boards will be broken. 
There is 1 way for all 5 boards to be broken, and this happens with probability (0.8)<sup>5</sup>.  
Similarly, there are 5 choose 4 ways for 4 boards to be broken, and each happens with probability 
(0.8)<sup>4</sup>(0.2).  So, the overall probability is:
<center>
1 - C(5,4) &middot; (0.8)<sup>4</sup> &middot; (0.2) - (0.8)<sup>5</sup>
</center>")))

       (! "What is the expected number of boards Bruce will break?" 
          (answer 4
          (compare 
           (lambda (ans response)

             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "The expectation of a
                   (<em>p</em>,<em>n</em>)- binomial distribution is <em>pn</em>.
                    Here, <em>p</em> = 0.8 and <em>n</em> = 5.")))

       );questions
      );'
);define-problem
