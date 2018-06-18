(load (t:expand-ps-file-name "infix.scm"))
;; problem 3
(define-problem
  '(
    (type short-answer)
    (title "Set Theory")
    (intro "For any set <em>A</em>, let <b>P</b>(<em>A</em>) be its <i>power
set</i>, the set of all its subsets; note that <em>A</em> is itself a member of
<b>P</b>(<em>A</em>). Let O denote the empty set." )
;    (box-width 25)
    (questions
      (! "The elements of <b>P</b>({1,2}) are:"
         (answer "{1,2}, {1}, {2}, O"
                 (options
                  ""
                  "{1,2}, {1}, {2}"
                  "{1,2}, 1, 2, O" 
                  "{1}, {2}, O"
                  "{1,2}, {1}, {2}, O" ;TRUE
                  "{1,2}, {1}, {2}, {O}"
                  "{{1,2}}, {1}, {2}, O")))
     (! "The elements of <b>P</b>({O,{O}}) are:"
        (answer "{O,{O}}, {O}, {{O}}, O"
                (options
                 ""
                 "{O,{O}}, {O}, {{O}}"
                 "{O,{O}}, {{{O}}}, {{O}}, {O}"
                 "{{{O}}}, {{O}}, {O}, O"
                 "{{{{O}}}}, {{{O}}}, {{O}}, {O}"
                 "{O,{O}}, {O}, {{O}}, O" ;TRUE
                 "{{O,{O}}}, {O}, {{O}}, O")))

     (! "How many elements are there in <b>P</b>({1, 2, ... , 8})?<br>
         (You may answer with an integer or an infix expression like ``5 * 7^3'')"
         (answer "2^8"
                 (compare 
                  (lambda (ans response)
                    (test-infix-numerical-expressions ans response '() '() 1 '()))
                  )))

      );questions
     );'
    );define-problem

