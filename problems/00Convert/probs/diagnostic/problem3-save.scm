(load (t:expand-ps-file-name "infix.scm"))
;; problem 3
(define-problem
  '(
    (type short-answer)
    (title "Set Theory")
    (intro "For any set <em>A</em>, let P(<em>A</em>) be its <i>power
set</i>, the set of all its subsets; note that <em>A</em> is itself a member of
P(<em>A</em>). Let &Oslash; denote the empty set." )
    (box-width 25)
    (questions
      (! "The elements of <b>P({1,2})</b> are:"
         (answer "{1,2},{1},{2}, &Oslash;"
                 (options "{1,2},{1},{2}"
                  "{1,2},1,2,&Oslash;" 
                  "{1},{2}, &Oslash;"
                  "{1,2},{1},{2}, &Oslash;" ;TRUE
                  "{1,2},{1},{2}, {&Oslash;}"
                  "{{1,2}},{1},{2}, &Oslash;")))
     (! "The elements of <b>P({&Oslash;,{&Oslash;}})</b> are:"
        (answer "{&Oslash;,{&Oslash;}},{&Oslash;},{{&Oslash;}}, &Oslash;"
                (options
        "{&Oslash;,{&Oslash;}},{&Oslash;},{{&Oslash;}}"
        "{&Oslash;,{&Oslash;}},&Oslash;,{&Oslash;},&Oslash;"
        "{&Oslash;},{{&Oslash;}}, &Oslash;"
        "{&Oslash;,{&Oslash;}},{&Oslash;},{{&Oslash;}}, {&Oslash;}"
        "{&Oslash;,{&Oslash;}},{&Oslash;},{{&Oslash;}}, &Oslash;" ;TRUE
        "{{&Oslash;,{&Oslash;}}},{&Oslash;},{{&Oslash;}}, &Oslash;")))

     (! "How many elements are there in <b>P({1, 2, ... , 8})</b>?<br>
         (You may answer with an integer or an infix expression like `5 * 7^3')"
         (answer "2^8"
                 (compare 
                  (lambda (ans response)
                    (test-infix-numerical-expressions ans response '() '() 1 '()))
                  )))

      );questions
     );'
    );define-problem

