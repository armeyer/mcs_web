;; repeated-pascal
(define-problem
  '(
    (type short-answer)
    (title "Pascal's Theorem on Crack")
    (intro "Pascal's Theorem gives us that
<img valign = \"top\" src=\"http://courses.csail.mit.edu/6.042/spring09/Eqn001.gif\" alt=\"Mathematics for Computer Science\">"
 (math "\\quad {{n-1} \\choose {k}} + {{n-1} \\choose {k-1}} = {{n} \\choose {k}}") ". We will try and apply this result repeatedly to get a cool identity. For each of the parts, your answer should be a single number corresponding to the appropriate expression among the list of choices for that part."
           )
    (boxsize 5)

    (questions
     (! "As a start, " (math "{{n} \\choose {n}}") " is equal to one of the expressions given below. Which one? 
      <p>
      <ol>

      <li>" (math "{{n+1} \\choose {n}}")"

      <p><li>" (math "{{n+1} \\choose {n+1}}")"

      <p><li>" (math "{{n} \\choose {1}}")"

      <p><li>" (math "{{n} \\choose {n-1}}")"

      </ol>"

        (answer  (2) (compare test-set) (rationale
       "This is because " (math "{{n} \\choose {n}} = {{n+1} \\choose {n+1}} = 1") ".")))
     (! "Now, which expression below is equivalent to " (math "{{n} \\choose {n}} + {{n+1} \\choose n}") "?
      <p> <em>Hint:</em> Substitute in the answer from the previous part for " (math "{{n} \\choose {n}}") " and then apply Pascal's Theorem.

      <p>
      <ol>

      <li>" (math "{{n+2} \\choose {n}}")"

      <p><li>" (math "{{n+2} \\choose {n+1}}")"

      <p><li>" (math "{{n+1} \\choose {n-1}}")"

      <p><li>" (math "{{n+1} \\choose {n}}")"

      </ol>"

        (answer  (2) (compare test-set) (rationale
       "This is because " (math "{{n} \\choose {n}} + {{n+1} \\choose {n}} = {{n+1} \\choose {n+1}} + {{n+1} \\choose {n}} = {{n+2} \\choose {n+1}}") ".")))
     (! "Given that, which expression below is equivalent to " (math "{{n} \\choose {n}} + {{n+1} \\choose {n}} + {{n+2} \\choose {n}}") "?
      <p> <em>Hint:</em> Substitute in the answer from the previous part for the first two terms in the sum and then apply Pascal's Theorem.

      <p>
      <ol>

      <li>" (math "{{n+2} \\choose {n-1}}")"

      <p><li>" (math "{{n+2} \\choose {n+1}}")"

      <p><li>" (math "{{n+3} \\choose {n}}")"

      <p><li>" (math "{{n+3} \\choose {n+1}}")"

      </ol>"

        (answer  (4) (compare test-set) (rationale
       "This is because " (math "{{n} \\choose {n}} + {{n+1} \\choose {n}} + {{n+2} \\choose {n}} = {{n+2} \\choose {n+1}} + {{n+2} \\choose {n}} = {{n+3} \\choose {n+1}}") ".")))
     (! "Now to put it all together, which of the expressions below does this sum evaluate to: " (math "{{n} \\choose {n}} + {{n+1} \\choose {n}} + {{n+2} \\choose {n}} + \\cdots +  {{n+k} \\choose {n}}") "
      <p>
      <ol>

      <li>" (math "{{n+k} \\choose {n-1}}")"

      <p><li>" (math "{{n+k} \\choose {n+1}}")"

      <p><li>" (math "{{n+k+1} \\choose {n}}")"

      <p><li>" (math "{{n+k+1} \\choose {n+1}}")"

      </ol>"

        (answer  (4) (compare test-set) (rationale
       "Following the same steps as before, we get " (math "{{n+k+1} \\choose {n+1}}") " is the correct answer. If you would like to be rigorous, try and prove this result using induction on <em>k</em> or come up with an elegant combinatorial argument. Here is a not so elegant combinatorial argument but it is still important to understand: <p> The number of solutions to the equation " (math "x_1 + x_2 + \\ldots + x_k + x_{k+1} = n+1") " is " (math "{{n+k+1} \\choose {n+1}}") " as there is a bijection between solutions to this equation and bit sequenes of length <em>(n+k+1)</em> with exactly <em>(n+1)</em> zeros.

<p> Now, let's count these solutions in another way:-

<p> The number of solutions to " (math "x_1 = n+1") " is " (math "{{n+1} \\choose {n+1}} = {{n} \\choose {n}}") ".

<p> The number of solutions to " (math "x_1 + x_2 = n+1") " with " (math "x_2 \\ge 1") " is " (math "{{n+1} \\choose {n}}") ". At least 1 zero must follow the last one to ensure that x<sub>2</sub> >= 1. We can group the last one with a zero to form 10. Thus, we need to pick the positions of <em>n</em> remaining zeros (out of <em>(n+1)</em> possible positions) and insert the 10 in the remaining position.

<p> The number of solutions to " (math "x_1 + x_2 \\ldots x_k + x_{k+1} = n+1") " with  " (math "x_{k+1} \\ge 1") " is " (math "{{n+k} \\choose {n}}") ". This is because at least 1 zero must follow the last one and so, we can group them together. Thus, we need to pick the positions of <em>n</em> remaining zeros (out of <em>(n+k)</em> possible positions). We then insert a one in the empty positions except for the last empty position where we insert a 10.

<p> Note that we have not double counted anywhere and have accounted for all the solutions to the original equation by requiring that the last of the x<sub>i</sub>'s be non-zero in each of the equations. Counting the solutions in these two ways yields the identity that we proved using Pascal's Theorem.")))

      );questions
    );'
  );define-problem
