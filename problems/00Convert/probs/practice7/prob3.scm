(define-problem
    '(
      (type short-answer)
      (title "Practice with Big O")

      (intro "Find the least natural number, <i>n</i>, such that
<em>f</em>(<em>x</em>) is O(<em>x<sup>n</sup></em>) when <i>f</i> is
defined by each of the expressions below.  If there is none, enter
``none''.")

      (box-width 5)
      (questions
       (! "2<em>x</em><sup>3</sup>
            + (log <em>x</em>)<em>x</em><sup>2</sup>"
          (answer 3 (rationale "
2<em>x</em><sup>3</sup> grows as fast as <em>x</em><sup>3</sup> <br>
(log <em>x</em>)<em>x</em><sup>2</sup> grows strictly slower than <em>x</em><sup>3</sup>.
")       
          ))

       (! "2<em>x</em><sup>2</sup> + (log <em>x</em>)<em>x</em><sup>3</sup>"
          (answer 4 (rationale "
2<em>x</em><sup>2</sup> grows as fast as <em>x</em><sup>2</sup> <br>
(log <em>x</em>)<em>x</em><sup>3</sup> grows 
strictly faster than <em>x</em><sup>3</sup> but
strictly slower than <em>x</em><sup>4</sup>.
")       
          ))

       (! "(1.1)<sup><em>x</em></sup>"
          (answer "none" (rationale "
(1.1)<sup><em>x</em></sup> grows strictly faster than any polynomial
")       
          (compare string-ci=?)))

       (! "(0.1)<sup><em>x</em></sup>" (answer 0 (rationale "
As <em>x</em> goes to infinity, (0.1)<sup><em>x</em></sup> goes to 0. 
So it grows strictly slower than any constant (same as a polynomial
of degree 0).
")))

       (! "(<em>x</em><sup>4</sup> + <em>x</em><sup>2</sup> + 1) /
           (<em>x</em><sup>3</sup> + 1)" (answer 1 (rationale "
This fraction grows  as fast as <em>x</em><sup>4</sup>/<em>x</em><sup>3</sup>.
")        
         ))

       (! "(<em>x</em><sup>4</sup> + 5 log <em>x</em>)
                  / (<em>x</em><sup>4</sup> + 1)"
          (answer 0 (rationale "
This fraction grows  as fast as <em>x</em><sup>4</sup>/<em>x</em><sup>4</sup>.
")
          ))

       (! "2<sup> (3 log<sub>2</sub> <em>x</em><sup>2</sup>)</sup>"
          (answer 6
                  (rationale
                "2<sup> (3 log<sub>2</sub> <em>x</em><sup>2</sup>)</sup>
                 = 2<sup> (log<sub>2</sub>
                             (<em>x</em><sup>2</sup>)<sup>3</sup>)</sup>
                 = 2<sup> (log<sub>2</sub> (<em>x</em><sup>2&middot;3</sup>))</sup>
                 = 2<sup> (log<sub>2</sub>(<em>x</em><sup>6</sup>))</sup>
                 = <i>x<sup>6</sup></i>")))

       );questions
      );'
);define-problem
