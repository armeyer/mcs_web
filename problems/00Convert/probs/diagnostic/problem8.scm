; problem 8
(define-problem
  '(
    (type short-answer)

    (title "Combinatorics")

    (intro "Which of the following expressions correctly describe
            the number of size-3 subsets of the set {1,2, ..., 6}?

<ol>

<p><li> <b>3 &middot; 6</b></li></p>

<p><li> <b>6 &middot; 5 &middot; 4</b></li></p>

<p><li> <b>5 &middot; 4</b> </li></p>

<p><li> <b>6!/3!</b> </li></p>

<p><li> <b>3! &middot; 3!</b></li></p>

<p><li> <b>6! / (3! &middot; 3!)</b> </li></p>

<p><li> <b>" (math "\\mathbf{6\\choose 3}") "</b> &nbsp;&nbsp;&#65293;the binomial coefficient </li></p>

<p><li> <b>(6)<sub>3</sub></b> &nbsp;&nbsp;&#65293;falling factorial </li></p>

</ol>")                                 ;intro

    (questions
     (! "Answer with a sequence of integers separated
   by some spaces, for example, \" 4 3 2\".  Don't use commas or
   parentheses."
        (answer (3 6 7)
                (compare test-set))))))
