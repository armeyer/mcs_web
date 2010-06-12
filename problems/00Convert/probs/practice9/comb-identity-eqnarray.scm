(define-problem
  '(
    (type short-answer)
    (title "Combinatorial Identity")
    (intro 
     "From a set of <em>n</em> balls, your task is to pick a group of
       <em>k</em> balls and a separate group of <em>(r - k)</em> balls.

      <p>You could do it by picking a group of <em>r</em> balls and then
partitioning it into sets of <em>k</em> and <em>(r - k)</em>.  On the
other hand, you could first pick <em>k</em> balls and then pick
<em>(r - k)</em> balls from the remaining <em>(n - k)</em> balls.</p>

      <p>The equivalence of these two picking procedures directly
         translates into one of the following identities.  Which one?</p>

      <p>"

     (math "\\begin{eqnarray}
{n \\choose k} {k \\choose r-k} & = & {n \\choose k}{k \\choose r}\\\\
{n \\choose r}{r \\choose k} & = & {n \\choose k}{n-k \\choose r-k}\\\\
{n \\choose r}{r \\choose k} & = & {n \\choose r}{r \\choose r-k}\\\\
{n \\choose k}{n \\choose r-k} & = & {n \\choose r}{n-r \\choose r-k}\\\\
{k \\choose n}{n \\choose r-k} & = & {r \\choose n}{n-r \\choose r-k}\\\\
{n \\choose r}{r \\choose k} & = & {n \\choose k}{n \\choose r-k}
\\end{eqnarray}")
     )
    (boxsize 5)
                                        ;      (compare equal?)
    (questions
     (! ""
        (answer  (2) (compare test-set)))
     )                                  ;questions
    )                                   ;'
  )                                     ;define-problem
