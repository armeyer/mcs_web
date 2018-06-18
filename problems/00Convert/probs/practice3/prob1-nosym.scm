;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Binary Relation Properties")

    (intro "For each of the following relations &#65293; the first
three are on the set {1,2,3,4} &#65293; indicate whether it is
<b>r</b>eflexive, <b>i</b>rreflexive, <b>a</b>ntisymmetric, or
<b>t</b>ransitive by entering a sequence of the letters <b>r i a t n</b>
(in any order, but without commas or quotes), where <b>n</b> means
\"<b>n</b>one of the above\".")

    (questions
     (! "{(2,2),(2,3),(2,4),(3,2),(3,3),(3,4)}"
      (answer (t)
              (compare test-set)
              (rationale
               "not <b>r</b>: no (1,1) or (4,4)<br>
                not <b>i</b>: has (2,2)<br>
                not <b>a</b>: (2,3) and (3,2) and 2 &ne; 3");rationale
#|
;THIS IS CORRECT may be useful for other examples, but there is a builtin test-set
;for this purpose
              (compare
               (lambda (student correct)
                 (equal?
                  (sort (t:string-read*-safe student) symbol<?)
                  (list correct))))
|#
       )  ;answer
      )   ;!

     (! "{(1,1),(1,2),(2,1),(2,2),(3,3),(4,4)}"
      (answer (r t)
              (rationale
               "not <b>i</b>: has (1,1)<br>
                not <b>a</b>: (1,2) and (2,1) and 1 &ne; 2");rationale
              (compare test-set)
#|
              (compare
               (lambda (student correct)
                 (equal?
                  (sort (t:string-read*-safe student) symbol<?)
                  correct)))
|#
              );answer

       );!

     (! "{(2,4),(4,2)}"
      (answer (i)
              (rationale
               "not <b>r</b>:  no (1,1)<br>
                not <b>t</b>: (2,4) and (4,2) and no (2,2)<br>
                not <b>a</b>: (2,4) and (4,2) and 2 &ne; 4");rationale
              (compare test-set)
#|
              (compare
               (lambda (student correct)
                 (equal?
                  (sort (t:string-read*-safe student) symbol<?)
                  (list correct))))
|#
              );answer
      );!

     (! "{(<em>p</em>,<em>q</em>) | <em>p</em> and <em>q</em> are different people
who speak the same language}"
      (answer (i)
              (rationale
                "not <b>t</b>: some people are bilingual<br>
                 not <b>a</b>: more than one person speaks English");rationale
              (compare test-set)
              );answer
      );!

     (! "{(A,B) | A and B are languages and more than 1,000,000 people speak both A and B}"
      (answer (n)
              (rationale
        "not <b>r</b>: some languages are spoken by fewer than 1,000,000 people<br>
         not <b>i</b>: some languages are spoken by at least 1,000,000 people<br>
         not <b>t</b>: more than 1,000,000 Czech speakers also speak English, and more than 1,000,000 English speakers also speak Chinese, but fewer than 1,000,000 Czech speakers also speak Chinese");rationale
              (compare test-set)
              );answer
      );!
     );questions
    );'
  );define-problem

