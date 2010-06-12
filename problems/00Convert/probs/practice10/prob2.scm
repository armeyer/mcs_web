(define-problem
    '(
      (type short-answer)
      (title "Fun with coins")
      (intro "<strong>Answer these following questions about flipping a fair coin.</strong>")
      (box-width 5)
      (questions
       (! "<strong>What is the probability that you will throw Tails <i>forever</i> with a fair coin?</strong>"
          (answer 0 (rationale "The probablity that you will throw
<em>n</em> Tails in a row is (1/2)<sup><em>n</em></sup>.  As <em>n</em>
approaches infinity, this goes to 0.")))
       (! "<strong>What is the probability that you will throw at least one Head when you keep throwing a fair coin <i>forever</i>?</strong>"
          (answer 1 (rationale "This event happens exactly when you don't
throw Tails forever.  Since we know the probability of throwing Tails
forever is 0 from the previous part, the probability of at least one head
is 1-0 = 1.")))
       );questions
      );'
    );define-problem
