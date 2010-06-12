;; problem 1
(define-problem
  '(
    (type multi-part)
    (title "Spiders and Flies")
    (intro "The spider is expecting guests and wants to catch 500 flies for her
 dinner.  100 flies pass by her web every hour.  60 of these flies are
 quite small and are caught with probability 1/6 each.  40 of the flies
 are big and are caught with probability 3/4 each.  Assume all fly
 interceptions are mutually independent.  Using this information, the
 methods from lecture can show
 that the poor spider has only about 1 chance in 100,000 of catching 500
 flies within 10 hours.")
    (subproblems
     (!prob
      (type multiple-choice)
      (title "Which of the following of our methods for bounding the spider's
probability of catching 500 flies in 10 hours will provide useful
information?")
      (choices 
       (! "Estimation of the binomial density F<sub>n,p</sub>"
          (answer false
                  (rationale "(i) does NOT apply because the sum of binomial distributions with different p's is not binomial.  We're considering a random variable that is the sum of
1000 Bernoulli variables, 600 with p = 1/6 and 400 with p = .75.")))
       (! "Markov's bound"
          (answer false
                  (rationale "(ii) implies that the probability is at most 0.8, an absurd overestimate.")))
       (! "Chebyshev's bound"
          (answer true))
       (! "Chernoff's bound"
          (answer true))
       );choices
      );prob
     (!prob
      (type multiple-choice)
      (title "Which of the methods should yield the best upper bound?")
      (choices 
       (! "Estimation of the binomial density F<sub>n,p</sub>"
          (answer false))
       (! "Markov's bound"
          (answer false))
       (! "Chebyshev's bound"
          (answer false))
       (! "Chernoff's bound"
          (answer true))
       );choices
      );prob
     (!prob
      (type multiple-choice)
      (title "To verify the claim that the spider's chances are dim, write the
formula using the notation exp(x) for e to the xth power, and ln(x) for
natural logarithm that bounds the spider's chances.")
      (choices 
       (! "e<sup>-(4/5 ln(4/5) - 4/5 + 1)400</sup>"
          (answer false))
       (! "e<sup>-(5/4 ln(5/4) - 5/4 + 1)400</sup>"
          (answer true
                  (rationale "This is the Chernoff bound.  The expected number of flies caught every hour is (1/6)60+(3/4)40 = 40, so the expected number of flies in 10 hours is
400.  So, <br>
  Pr{X >= 500} <= Pr{X >= 5/4 400} <= e<sup>-(5/4 ln(5/4) - 5/4 + 1)400</sup>")))
       (! "e<sup>-(50/4 ln(50/4) - 50/4 + 1)40</sup>"
          (answer false))
       );choices
      );prob
     );subproblems
    (extro "</font>")
    );'
  );define-problem
