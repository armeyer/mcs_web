;; problem 3
(define-problem
  '(
    (type short-answer)
    (title "Binomial Theorem")
    (intro "Find the coefficient of x<sup>3</sup> in the following expressions.<br>
            (You must give the exact number.)")
    (box-width 5)
    (questions
     (! "(<i>x</i>+1)<sup>9</sup> ?<br>"
        (answer 84 (rationale 
                    (math "= {9 \\choose 3}1^31^{9-3}"))))
     (! "(2<i>x</i>+3)<sup>5</sup> ?<br>"
        (answer 720 (rationale
                     (math "= {5 \\choose 3} 2^3 3^{5-3}"))))
     );questions
    );'
  );define-problem
