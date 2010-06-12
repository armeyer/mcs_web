; problem 1
(define-problem
  '((type short-answer)
    (title "Induction by <em>n</em>+3")
    (intro "Alice wants to prove by induction that a predicate,
<em>P</em>, holds for certain natural numbers.
She has proven that for all nonnegative integers <em>n</em> = 0,1,&#133; 
<br><br><center>
<em>P</em>(<em>n</em>) <small>IMPLIES</small> <em>P</em>(<em>n</em>+3).
</center>
")

    (questions
       (! "Suppose Alice also proves that <em>P</em>(5) holds.  Which of the
following propositions can she infer?  The universe of discourse for <em>n</em>
is the nonnegative integers.

<p><ol>
<li> <em>P</em>(<em>n</em>) holds for all <em>n</em> &ge; 5
<li> <em>P</em>(<em>3n</em>) holds for all <em>n</em> &ge; 5
<li> <em>P</em>(<em>n</em>) holds for <em>n</em> = 8, 11, 14, &#133;
<li> <em>P</em>(<em>n</em>) does not hold for <em>n</em> < 5
<li> &forall;<em>n</em>. <em>P</em>(3<em>n</em> + 5)
<li> &forall;<em>n</em> &gt; 2. <em>P</em>(3<em>n</em> - 1)
<li> P(0) <small>IMPLIES</small> &forall;<em>n</em>. <em>P</em>(3<em>n</em> + 2)
<li> P(0) <small>IMPLIES</small> &forall;<em>n</em>. <em>P</em>(3<em>n</em>)

</ol><br>
Give your answer as a sequence of integers separated by some
     spaces (<em>e.g.</em>, \"4 2 3\").  Don't use commas or
   parentheses.<p>"
           
(answer (box-width 12) (3 5 6 8) (compare test-set)
(rationale "<em>P</em> will be true on 5 and all numbers that are greater by a multiple of 3. That is, 5, 8, 11, 14, etc. 
            This is exactly what answer (5) says. Answers (3) and (6) talk of the same sequence except number 5, so they are still 
            propositions that Alice can infer, although not the strongest possible. Answer (8) is also a valid conclusion: if Alice 
            knows <em>P</em> is true on 0, she knows it will also be true on 3, 6, 9, etc.; so, it will be true on all multiples of 3 
            (note that the truth of <em>P</em> on 5 is irrelevant here)."))
      )                                 ;prob
       (! "Which of the following could Alice prove in order to conclude that <em>P</em>(<em>n</em>) holds for all <em>n</em> &ge; 5?
<p><ol>
<li> <em>P</em>(0)</li>
<li> <em>P</em>(5)</li>
<li> <em>P</em>(5) and P</em>(6)</li>
<li> <em>P</em>(0), <em>P</em>(1), and <em>P</em>(2)</li>
<li> <em>P</em>(5), <em>P</em>(6), and <em>P</em>(7)</li>
<li> <em>P</em>(2), <em>P</em>(4), and <em>P</em>(5)</li>
<li> <em>P</em>(2), <em>P</em>(4), and <em>P</em>(6)</li>
<li> <em>P</em>(3), <em>P</em>(5), and <em>P</em>(7)</li>
</ol>
</p><br>
Give your answer as a sequence of integers separated by some
spaces.  Don't use commas or parentheses. <p>"
           (answer (4 5 7 8) (compare test-set)
(rationale "Once Alice proves <em>P</em>(5), <em>P</em>(6), and <em>P</em>(7)</em>, she can conclude that <em>P</em>(<em>n</em>) holds for all <em>n</em> &ge; 5. 
But <em>P</em>(5), <em>P</em>(6), and <em>P</em>(7)</em> can also follow from proving <em>P</em> of any three natural numbers up to 7 that leave remainders on division by 3 equal to each of 0, 1, and 2."))))
    );'
  );define-problem








