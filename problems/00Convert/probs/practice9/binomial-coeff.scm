;; binomial coefficients

(define-problem
  '(
    (type short-answer)
    (title "Binomial Coefficients")
    (intro "Find the coefficient of x<sup>4</sup> in the following expressions.<br>
            (You must give the exact number.)")
    (box-width 5)
    (questions
     (! "(<i>x</i>+1)<sup>9</sup> ?<br>"
        (answer 126 (rationale (math "= {9 \\choose 4}1^31^{9-3}"))))
     (! "(3<i>x</i>+2)<sup>6</sup> ?<br>"
        (answer 4860 (rationale (math "= {6 \\choose 4}3^4 2^{6-4}"))))
     );questions
    );'
  );define-problem

