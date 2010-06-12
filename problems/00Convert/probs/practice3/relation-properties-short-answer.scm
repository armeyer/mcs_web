;; relation-properties-short-answer
(define-problem
  '(
    (type short-answer)
    (title "Relational Properities")
    (intro "For each of the following relations on people, decide whether
the relation is
<ol>
<li> reflexive
<li> irreflexive
<li> antisymmetric
<li> transitive
</ol>

<p>Answer with a sequence of integers separated by some spaces, for
example,
            <center>4 2 3</center>
Don't use commas or periods.<p>")
    (box-width 20)
    (compare test-set)
    (questions
     (! "are the same age"
        (answer (1 4)
                );answer
        );!
     (!"is younger than"
          (answer (2 3 4)
                  (rationale
                   "actually asymmetric: different people
                    can't be younger than each other")))
     (! "have the same parents"
        (answer (1 4)
                );answer
        )
     (! "is a descendent of"
        (answer (2 3 4)
                  (rationale
                   "irreflexive since a person is not considered to be
                    their own descendent")))

     (! "have a parent in common"
        (answer (1)
                  (rationale
                   "different brothers have a parent in commom, so not antisymmetric;<br>
                   people have children from multiple marriages, so not transitive")))
     )))
