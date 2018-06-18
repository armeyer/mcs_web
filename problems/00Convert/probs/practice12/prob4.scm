(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "Wald's Theorem") 
      (intro "Suppose we roll a fair, 6-sided dice and get a number <i>t</i>.  Then we flip an unbiased coin <i>t</i> times.  What is the expected number of heads?")
      (box-width 5)
      (questions
       (! ""
          (answer 7/4
                  (compare 
                   (lambda (ans response)
                     (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "The expected value of <i>t</i> is (1+6)/2
= 7/2.  For each flip, the expected number of heads is 1/2.  Therefore,
using Wald's Theorem, the total number of heads expected is 7/2 &middot;
1/2 = 7/4")))
       );questions
      );'
    );define-problem


