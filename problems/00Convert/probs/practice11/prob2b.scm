;;problem 2b  subsumed by prob2 = great-expectations.scm
(define-problem
    '(
      (type short-answer)
      (title "Great Expectations")
      (intro "")
      (box-width 5)
      (questions

       (! "<strong>What is the expected sum of the numbers that come up when you roll
a 6-sided and a 12-sided dice?<br></strong>"
          (answer 10
          (rationale "The expectation of a sum is the sum of expectations,
                so <center>
               (1+2+...+6)/6 + (1+2+...+12)/12 = 7/2 + 13/2=10.
               </center>")))
       (! "<strong>Suppose you have two computers: Computer 1 generates a random
number in the set {1,2,...,99} with all numbers equally likely.
Similarly, Computer 2 generates a random number in {1,2,...,999}.  Given
that the two computers act independently, what is the expected product of
the numbers that both computers generate?<br></strong>"
          (answer 25000 (rationale "The Product Rule can be used because
the two random variables are independent, so
<center>
E[<em>C<sub>1</sub></em>&middot;<em>C<sub>2</sub></em>] = E[<em>C<sub>1</sub></em>]&middot;E[<em>C<sub>2</sub></em>] = 50&middot;500
</center>")))
       );questions
      );'
);define-problem
