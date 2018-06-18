;; problem 8  subsumed by numbtheory/fermat.scm
(define-problem
  '(
    (type short-answer)
    (title "Fermat's Little Theorem")
    (intro
      "What is rem(24<sup>78</sup>, 79)? (Hint: 79 is prime.
      You should not need to do any calculation!)")
    (questions
     (! "" (answer 1 (rationale "Fermat's Little Theorem 
            says that <em>n</em><sup>(<em>p</em>-1)</sup>
            is congruent to 1 modulo <em>p</em>,
            when <em>p</em> is a prime, as 79 is."))))))
