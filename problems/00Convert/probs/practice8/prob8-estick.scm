;; problem 8
(define-problem
  '(
    (type short-answer)
    (title "Fermat's Little Theorem")
    (intro
     "<font color=red>Note: This problem doesn't need to be completed until Wednesday, Nov. 4!</font><br>
      What is rem(24<sup>78</sup>, 79)? (Hint: 79 is prime.
      You should not need to do any calculation!)")
    (questions
     (! "" (answer 1 (rationale "Fermat's Little Theorem 
            says that <em>n</em><sup>(<em>p</em>-1)</sup>
            is congruent to 1 modulo <em>p</em>,
            when <em>p</em> is a prime. As 79 is prime,
            <em>n</em><sup>(<em>78</em>)</sup> is
            congruent to 1."))))))