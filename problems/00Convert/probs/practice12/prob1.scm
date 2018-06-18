;;problem markov = practice12/prob1

(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Practice with Bounds") 
      (intro "<strong>Suppose 120 students take the 6.042 final exam and the
mean of their grades is 90.  However, you have no other information
about the students and the exam, <i>e.g.</i> you should not assume
that the final is worth 100 points.</strong>")
      (box-width 5)
      (questions
       (! "<strong>State the best possible upper bound on the number of students who scored at least 180.<br></strong>"
          (answer 60 
		  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '()))) 
		  (rationale "Let <em>R</em> be the score of a student chosen at random.  
According to Markov's Theorem: 
<center>
Pr{<em>R</em> &ge; 180} &le;  E[<em>R</em>]/180 = 90/180 = 1/2.
</center>
So at most (1/2)&middot;120 = 60 students scored greater than or equal to 180.")))

       (! "<strong>Now suppose somebody tells you that the lowest score on the
exam is 30.  Compute the new best possible upper bound on the number
of students who scored at least 180.<br></strong>"
          (answer 48 
		  (compare
		   (lambda (ans response)
		     (test-infix-numerical-expressions
		      ans response '() '() 1 '()))) 
		  (rationale "Let <em>R</em> be as in Question 1. We can apply Markov's 
Theorem to the variable <em>R</em>-30:
<center>
Pr{<em>R</em> &ge; 180} = Pr{<em>R</em>-30 &ge; 150} &le;  E[<em>R</em>-30]/150 = 60/150 = 2/5. 
</center>
So at most (2/5)&middot;120 = 48 students scored greater than or equal to 180.")))
       );questions
      );'
);define-problem
