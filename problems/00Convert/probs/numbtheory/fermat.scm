;; fermat.scm -- problem 8
(define-problem
  '(
    (type short-answer)
    (title "Fermat's Little Theorem")
    (intro
     "<strong>What is rem(24<sup>78</sup>, 79)?<br>
      <em>Hint</em>: You should not need to do any calculation!</strong>")
    (questions
     (! "" (answer 1 (rationale "<strong>Since 79 is prime and 24 is not a
multiple of 79, Fermat's Little Theorem is applicable, and it implies that
24<sup>(79-1)</sup> is congruent to 1 modulo 79.  This
means that rem(24<sup>78</sup>, 79) = 1</strong>"))))))
