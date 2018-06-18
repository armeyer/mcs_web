;; relation-properties
(define-problem
  '(
    (type multi-part)
    (title "Relational Properities")
    (intro "For each of the following relations on people, decide whether
the relation is reflexive, irreflexive, antisymmetric, or transitive.  Check all
that apply.
<br><br>
As a reminder, a relation, R, on a set, A, is irreflexive iff NOT(a R a) for all a in A.")
          (subproblems
                  (!prob 
                        (type multiple-choice)
                        (title "are the same age")
                        (choices 
                         (! "reflexive"    (answer true))
                         (! "irreflexive"  (answer false))
                         (! "antisymmetric"
                            (answer false
                                    (rationale "different people may be the same age")))
                         (! "transitive" (answer true))
                         )
                  );prob
                  (!prob 
                        (type multiple-choice)
                        (title "is younger than")
                        (choices 
                         (! "reflexive"     (answer false))
                         (! "irreflexive"     (answer true))
                         (! "antisymmetric"
                            (answer true
                                    (rationale
                                     "actually asymmetric: 2
people can't be younger than each other")))
                         (! "transitive" (answer true))
                         )
                  );prob
                  (!prob 
                        (type multiple-choice)
                        (title "have the same parents")
                        (choices 
                         (! "reflexive"     (answer true))
                         (! "irreflexive"     (answer false))
                         (! "antisymmetric"     (answer false))
                         (! "transitive"    (answer true))
                        )
                  );prob
                  (!prob 
                        (type multiple-choice)
                        (title "is a descendent of")
                        (choices 
                         (! "reflexive"
                            (answer false
                                    (rationale
                                     "a person is not considered to be their own descendent")))
                         (! "irreflexive"
                            (answer true
                                    (rationale "same rationale")))
                         (! "antisymmetric"
                            (answer true
                                    (rationale "same rationale")))
                         (! "transitive"    (answer true))
                        )
                  );prob
                  (!prob 
                        (type multiple-choice)
                        (title "have a parent in common")
                        (choices 
                         (! "reflexive"     (answer true))
                         (! "irreflexive"     (answer false))
                         (! "antisymmetric"   (answer false
                                    (rationale
                                     "different brothers have a parent in commom")))
                         (! "transitive"
                            (answer false
                                    (rationale
                                     "people have children from multiple marriages")))
                        )
                  );prob
          );subproblems
    );problem
);define-problem
