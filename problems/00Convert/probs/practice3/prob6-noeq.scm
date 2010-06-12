(define-problem
  '(
    (type short-answer)
    (title "Partial & Total Orders")

    (intro "For each of the following relations, indicate whether it
is a <b>p</b>artial but <em>not</em> a total order, a <b>t</b>otal
order, or <b>n</b>either by entering one of the letters <b>p t
n</b>.")

          (questions
     (! "{(<em>p</em>,<em>q</em>) | <em>p</em> and  <em>q</em> are people of the same age}"
      (answer (n)
              (rationale
               "This relation is reflexive and transitive, but not antisymmetric.
Therefore it is not a partial order, let alone a total one."  );rationale
              (compare test-set)
              )  ;answer
      )   ;!

     (! "{(<em>a</em>,<em>b</em>) | <em>a</em> is the age of someone who is not younger than anyone of age <em>b</em>}"
      (answer (t)
              (rationale
               "Ages can be translated into days or similar numerical
units, and revealing this to be an somewhat awkward description of the
relation greater-or-equal relation on these numbers."  );rationale
              (compare test-set)
              )  ;answer
      )   ;!

     (! "{(<em>p</em>,<em>q</em>) | <em>p</em> is a person whose age is an
integer multiple of person <em>q</em>'s age}"
        (answer (n)
                (rationale "Two different people can be the same age,
so the relation is not antisymmetric, ruling out both <b>p</b> and
<b>t</b>.  Note that as a relation on the <em>ages</em> (as opposed to
the <em>persons</em>) would be the same as the divisibility relation
on natural numbers, for which <b>p</b> would have been the correct
answer.  Yes, this was a bit of a trick question.")
;rationale
                (compare test-set)
                ) ;answer
        ) ;!
     );questions
          );'
  );define-problem

