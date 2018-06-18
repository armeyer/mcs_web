;; problem 3
(define-problem
  '(
    (type multi-part)
    (title "Equivalence relations")
    (intro "For each of the following relations, decide whether it is reflexive, whether it is symmetric, whether it is transitive, and whether it is an equivalence relation. Check all that apply.")
          (subproblems
                  (!prob 
                        (type multiple-choice)
                        (title "{ (a,b) | a and b are the same age }")
                        (choices 
                         (! "reflexive"     (answer true))
                         (! "symmetric"     (answer true))
                         (! "transitive"    (answer true))
                         (! "equivalence relation" (answer true))
                        )
                  );prob
                  (!prob 
                        (type multiple-choice)
                        (title "{ (a,b) | a and b have the same parents }")
                        (choices 
                         (! "reflexive"     (answer true))
                         (! "symmetric"     (answer true))
                         (! "transitive"    (answer true))
                         (! "equivalence relation" (answer true))
                        )
                  );prob
                  (!prob 
                        (type multiple-choice)
                        (title "{ (a,b) | a and b speak a common language }")
                        (choices 
                         (! "reflexive"     (answer true))
                         (! "symmetric"     (answer true))
                         (! "transitive"    (answer false))
                         (! "equivalence relation" (answer false))
                        )
                  );prob
          );subproblems
    );problem
);define-problem
