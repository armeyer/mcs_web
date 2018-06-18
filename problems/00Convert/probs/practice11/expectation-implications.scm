;; problem expectation-implications same as  practice11/prob1

;REVISE to remove pull-down options, replace with "list which re true" and add some
;further alternatives that are true,

(define-problem
  '(
    (type short-answer)
    (title "Suppose 5 is Expected")
    (intro 
"<strong>Suppose <em>X</em> is a nonnegative integer random variable for
which you know that E[<em>X</em>]=5.  However, you know nothing else about
it.

<p> Complete the following statements so that they are guaranteed to be
true.</strong>")

    (questions
     (! "At least one of the values of <em>X</em> is "
        (answer "at most 5"
                (options "" "equal to 0" "at most 2.5 = (0+5)/2" "less
                  than 5" "at most 5" "at least 10 = 2&middot;5")
                (rationale 

                 "If all values of <em>X</em> were &gt; 5, then we would
have E[<em>X</em>] &gt;5.  So, at least one of the values must be at most
5.

<p> The rest of the options are disproved by the following counterexample:
let <em>X</em> be the constant random variable equal to 5.  Then
E[<em>X</em>]=5, and the other statements are obviously false."
                 )                      ;rationale
                )                       ;answer
        )                               ;!

     (! "The expectation E[<em>X</em><sup>2</sup>] "
        (answer "could be 100"

                (options "" "is 25" "is not 25" "is at most 25"
 "could be 100" "is at most E[<em>X</em>]")
                        ;what about "&ge;E[<em>X</em>]"?  too tricky
                        ; "is at least <em>X</em>&middot;E[<em>X</em>]"
                (rationale 

                 "<em>X</em> could be 20 with probability 1/4 and 0 with
probability 3/4.  Then its expectation would be 5, but the expectation of
its square would be 100= (3/4)&middot;0<sup>2</sup> +
(1/4)&middot;20<sup>2</sup>.

On the other hand:
<ul>
<li>  <em>X</em> could be 0 with probability 1/2 and
10 with probability 1/2.  Then the expectation of <em>X</em><sup>2</sup>
would be 50.  So, the 1st, the 3rd, and the last answers are wrong.

<p> <li> <em>X</em> could be 5 with probability 1.  Then the expectation of
<em>X</em><sup>2</sup> would be 25. So, the 2nd answer is wrong, too.
</ul>"
                 )                      ;rationale
                )                       ;answer
        )                               ;!

#|(! "The probability Pr{<em>X</em> &ge; 1000} is "
        (answer "at most 1/200"

                (options "" "less than 1/1000" "at most 1/1000" "at most
1/500" "at most 1/200" "at most Pr{<em>X</em> &ge; 5&middot;1000}")
                (rationale

                 "A direct application of Markov's Theorem. Since
<em>X</em> is a nonnegative variable, we know that <center> Pr{<em>X</em>
&ge; <em>a</em>} &le; E[<em>X</em>]/<em>a</em> </center> for any
<em>a</em>.  In this case, we have <center> Pr{<em>X</em> &ge; 1000} &le;
5/1000 = 1/200 </center> On the other hand, <em>X</em> could be 1000 with
probability 1/200 and 0 otherwise, in which case the smaller bounds would
not hold."
                 )                      ;rationale 
                )                       ;answer 
        )
|#
                               ;!
);questions 
);' 
);define-problem
