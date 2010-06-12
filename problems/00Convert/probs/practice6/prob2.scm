;; problem 2
(define-problem
  '(
    (type short-answer)
    (title "Stable Marriages")
    (intro
"Having pulled through the MIT 6.042 experience together three girls and
three guys decide that the future looks brighter now and so they decide to
get married, but each one has a list of preferences:
           <p>Girls:
           <br>A: Ashley, with order of preference: Z X Y
           <br>B: Betty, with order of preference: Z Y X
           <br>C: Cathy, with order of preference: Y Z X

           <p>Guys:
           <br>X: Xavier, with order of preference: B C A
           <br>Y: Yanos, with order of preference: A C B
           <br>Z: Zachary, with order of preference: B A C

<p> You, as a marriage counselor, have to match them so that they can live
happily ever after -- that is, find a set of marriages that is
<em>stable</em>.

<p>Type in your answer in the form (A X) (B Y) (C Z), wife followed by a
husband.");intro
                                        ;      (boxsize 5)
    (box-width 20)
                                        ;      (compare equal?)
    (questions
     (! "" (answer
            ((A X) (B Z) (C Y))
            ((A Y) (B Z) (C X))
            (compare test-set)
            (rationale "
(A X) (B Z) (C Y) is the matching that we get if we run the stable marriage 
algorithm using the girls as suitors; namely, this is the girl-optimal solution.
If we run the algorithm using the boys as suitors, we get the 
matching (A Y) (B Z) (C X); this the boy-optimal solution.")))
     )                                  ;questions
    )                                   ;'
  )                                     ;define-problem

