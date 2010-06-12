(define-problem
  '(
    (type short-answer)
    (title "Combinatorial Identity")
    (intro 
      "From a set of <em>n</em> balls, your task is to pick a group of
       <em>k</em> balls and a separate group of <em>r-k</em> balls.

      <p>You could do it by picking a group of <em>r</em> balls and then
       partitioning it into sets of <em>k</em> and <em>r-k</em>.  On the other
       hand, you could first pick <em>k</em> balls and then pick <em>r-k</em>
       balls from the remaining <em>n-k</em> balls.</p>

      <p>The equivalence of these two picking procedures directly
         translates into one of the following identities.  Which one?</p>

      <p>
      <ol>

      <li> C(n,k)C(k,r-k) = C(n,k)C(k,r)

      <li> C(n,r)C(r,k) = C(n,k)C(n-k,r-k)

      <li> C(n,r)C(r,k) = C(n,r)C(r,r-k)

      <li> C(n,k)C(n,r-k) = C(n,r)C(n-r,r-k)

      <li> C(k,n)C(n,r-k) = C(r,n)C(n-r,r-k)

      <li> C(n,r)C(r,k) = C(n,k)C(n,r-k)

      </ol>"
     )
    (boxsize 5)
                                        ;      (compare equal?)
    (questions
     (! ""
        (answer  (2) (compare test-set)))
     )  ;questions
    )   ;'
  )     ;define-problem
