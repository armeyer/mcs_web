(define-problem
  '(
    (type short-answer)
    (title "Equivalence relations & Partial Orders")

    (intro "For each of the following relations, indicate
whether it is an <b>e</b>quivalence relation, a <b>p</b>artial but
<em>not</em> a total order, a <b>t</b>otal order, or <b>n</b>one of the
above by entering one of the letters <b>e p t n</b>.")

          (questions
     (! "{(<em>p</em>,<em>q</em>) | <em>p</em> and <em>q</em> are people
   of the same age}"
      (answer (e)
              (compare test-set)
              )  ;answer
      )   ;!

     (! "{(<em>a</em>,<em>b</em>) | <em>a</em> is the age of someone who is not younger than anyone of age <em>b</em>}"
      (answer (t)

              (rationale
               "ages can be translated into days or similar numerical
units, and revealing this to be an somewhat awkward description of the
relation greater-or-equal relation on these numbers."  );rationale
              (compare test-set)
              )  ;answer
      )   ;!

     (! "{(<em>p</em>,<em>q</em>) | <em>p</em> is a person whose age is an
integer multiple of person <em>q</em>'s age}"
        (answer (n)
                (rationale "Two different people can be the same age, so
the relation is not antisymmetric, ruling out <b>p</b> and <b>t</b>.  It
is not symmetric, since a 4-year-old is related to a 2-year-old, but not
conversely, ruling out<b>e</b>.  Note that as a relation on their
<em>ages</em>, this would be the same as the divisibility relation on
natural numbers, for which <b>p</b> would have been correct.  Yes, this
was a bit of a trick question.")
;rationale
                (compare test-set)
                ) ;answer
        ) ;!
     );questions
          );'
  );define-problem

