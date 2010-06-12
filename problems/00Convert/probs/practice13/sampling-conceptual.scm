;; problem sampling-conceptual, was practice13/prob1

(define-problem
  '(
    (type multi-part)
    (title "Random Sampling")
    (intro "<strong>You work for the president and you want to estimate the
fraction <em>p</em> of voters in the entire nation that will prefer
him in the upcoming elections.  You do this by random sampling.
Specifically, you select <em>n</em> voters independently and randomly,
ask them who they are going to vote for, and use the fraction
<em>P</em> of those that say they will vote for the President as an
estimate for <em>p</em>.</strong>")

    (subproblems

     (!prob
      (type short-answer)
      (title "Facts")
      (intro "<strong>Our theorems about sampling and distributions allow us to
calculate how confident we can be that the random variable <em>P</em> 
takes a value near the constant <em>p</em>.  This calculation uses some 
facts about voters and the way they are chosen.  Which of the following 
facts are true?</strong>")

      (questions
       (! "<strong><ol>
<!-- 1 --> <li> Given a particular voter, the probability of that voter preferring
            the President is <em>p</em>.
<!-- 2 --> <li> Given a particular voter, the probability of that voter preferring
            the President is 1 or 0.
<!-- 3 --> <li> The probability that some voter is chosen more than once in the
           sequence goes to zero as <em>n</em> increases.
<!-- 4 --> <li> All voters are equally likely to be selected as the third in our
           sequence of <em>n</em> choices of voters (assuming <em>n</em> &ge; 3).
<!-- 5 --> <li> The probability that the second voter chosen will favor the President, 
           given that the first voter chosen prefers the President, is greater 
           than <em>p</em>.
<!-- 6 --> <li> The probability that the second voter chosen will favor the President, 
           given that the second voter chosen is from the same state as the first, may
           not equal <em>p</em>.
</ol></strong>"
          (answer (2 4 6) (compare test-set) 
                  (rationale "The preference of any 
particular voter is a constant: either \"the President\" or \"not the President\", so 
(1) is false and  (2) is true. (3) is false; in fact, the Birthday \"paradox\" implies 
the probability  of some voter being chosen more than once rapidly approaches 1 as
<em>n</em> grows beyond 100.  (4) holds by definition of randomly
choosing an item from a set.  (5) is false because successive voters in 
the sequence are chosen independently.  (6) is true because, for example, 
the fraction of voters who prefer the President in the largest states may 
all be < <em>p</em>."
                             ))
          )))

     (!prob
      (type short-answer)
      (title "What do you say?")
      (intro "
<strong>Suppose that, according to your calculations the following is true about your polling: 
<center>
Pr{ |<em>P</em>-<em>p</em>| &le; 0.04 } &ge; 0.95
</center></strong>")

      (questions
       (! "<strong>You do the asking, you count how many said they will vote for the 
President, you divide by <em>n</em>, and find 0.53.  You call the President, 
and ...what do you say?
<ol>
<!-- 1 --> <li> Mr. President, <em>p</em>=0.53!
<!-- 2 --> <li> Mr. President, with probability at least 95%, 
                <em>p</em> is within 0.04 of 0.53. 
<!-- 3 --> <li> Mr. President, either <em>p</em> is within 0.04 of 0.53 
                or something very strange (5-in-100) has happened. 
<!-- 4 --> <li> Mr. President, we can be 95% confident that <em>p</em> is within 0.04 of 0.53.
</ol>
Give the list of numbers that correspond to statements that you are justified to say.<br></strong>"

          (answer (3 4) 

                  (rationale "
You cannot say (1): the only way to know the exact value of the constant <em>p</em> is to 
ask all 250,000,000 voters. 

<p>
You cannot say (2) either: <em>p</em> is a <em>constant</em> which can either be or not be 
within 0.04 of 0.53.  If it is, then the probability that it is is 1, and thus at least 0.95, 
and therefore (2) will be true. If it is not, then the probability that it is is 0, and thus
smaller than 0.95, and therefore (2) will be false.

<p>
You can say (3): To see why, start with the statement 
<center>
either |0.53 - <em>p</em>| &le; 0.04
or   |0.53 - <em>p</em>| > 0.04
</center>
which is obviously true.
Now read it as follows: <em>Either</em> <em>p</em> is within 0.04 of 0.53
<em>or</em> it is not and therefore my random variable <em>P</em> took a
value from a set that is hit only 5 times in 100.  So, clearly,
<em>either</em> <em>p</em> is within 0.04 of 0.53 <em>or</em> something
strange has happened.

<p> You can say (4): by rephrasing (2) as `confidence' rather than
probability, you are correctly indicating that you are talking about the
probable behavior of your methodology for sampling <em>p</em>, not the
actual value of <em>p</em>")
                             (compare test-set)
                  ))))
     )                                  ; subproblems
    )                                   ;'
  )                                     ;define-problem


;   3       <li> Let <em>G</em> be the indicator variable for the event
;           that a random voter prefers Gore; the variance of <em>G</em> is
;           <em>p</em>(1-<em>p</em>).  (<em>Variance will be covered next week;
;           meanwhile mark this statement</em> <b>true</b>.)
;
;   6        <li> The expectation of the indicator variable for the first
;           voter in the sequence preferring Gore is <em>p</em>.

;   (3) holds because <em>G</em> is an indicator variable with
;    expectation <em>p</em>, so var[<em>G</em>] = <em>pq</em>.  
;   (6) follows from (4).  
