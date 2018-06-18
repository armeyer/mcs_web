;; problem 2
(define-problem
  '(
    (type short-answer)
    (title "What topics would you like to be covered this Friday (Dec 7) during the review session about probability?")
;    (intro "<font color=red>DO NOT BOTHER ABOUT THE SCORE YOU GET ON THIS PART: IT WILL NOT COUNT TOWARDS YOU FINAL SCORE. WE USE THE SCORING FEATURE TO POLL THE CLASS.</font>")
    (questions
     (! "Probability spaces?"
        (answer (options "1.No" "1.Yes")))
     (! "Conditional probability?"
        (answer (options "2.No" "2.Yes")))
     (! "Independence?"
        (answer (options "3.No" "3.Yes")))
     (! "Bernoulli random variables?"
        (answer (options "4.No" "4.Yes")))
     (! "Binomial random variables?"
        (answer (options "5.No" "5.Yes")))
     (! "Expectation?"
        (answer (options "6.No" "6.Yes")))
     (! "Variance?"
        (answer (options "7.No" "7.Yes")))
     (! "Markov's inequality?"
        (answer (options "8.No" "8.Yes")))
     (! "Chebyshev's inequality?"
        (answer (options "9.No" "9.Yes")))
     (! "Chernoff's inequality?"
        (answer (options "10.No" "10.Yes")))
     (! "Polling?"
        (answer (options "11.No" "11.Yes")))
     (! "Wald's theorem?"
        (answer (options "12.No" "12.Yes")))
     (! "Other (type in other topics or specific problems you want to review)?"
        (answer (box-width 50) (box-height 10)))
     );questions
    );problem
  );define-problem
