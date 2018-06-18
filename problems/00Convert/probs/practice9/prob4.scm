;; problem 4
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "MISSISSIPPI")
    (intro "How many different permutations are there of the sequence of letters in `MISSISSIPPI'?<br>
(You may answer with an expression such as <b>(5!^2)/(3!*4!)</b>.")
      (questions 
       (! ""
          (answer "11! / (1! * 4! * 4! * 2!)."
                  (compare 
                   (lambda (ans response)
                     (test-infix-numerical-expressions
                      ans response '() '() 1 '()))
                   )
                  (rationale
                   "There are 11 letters consisting of 1 M, 4 I's, 4 S's, 2 P's, so the multinomial coefficient
                   <table><tr>
                   <td><font size='6'>(</font></td>
                   <td><table><tr><td align='center'>11</td></tr>
                   <tr><td align='center'>1 , 4 , 4 , 2</td></tr></table></td>
                   <td><font size='6'>)</font></td>
                   </tr></table>
                   gives the answer.  It's value is  11! / (1! * 4! * 4! * 2!) = 34650.")))
       );questions
      )
  );define-problem


