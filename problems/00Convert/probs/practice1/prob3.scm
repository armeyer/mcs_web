;; problem 3 SUBSUMED BY "set-operations.scm"
(define-problem 
  '((type short-answer)
      (title "Set Theory")
      (intro "Let A = {a,b,c,d,e} and B = {a,b,c,d,e,f,g,h}.  Find:")
      (box-width 20)
      (questions 
       (! "A &cup; B: "
          (answer (a b c d e f g h) (compare test-set)))
       (! "A &cap; B: "
          (answer (a b c d e) (compare test-set)))
       (! "A - B: "
          (answer "null"))
       (! "B - A: "
          (answer (f g h) (compare test-set)))
       )
      (extro "Give your answer as a sequence of lower case letters
              separated by some spaces <br>(<em>e.g.</em>, \"a f b\").
              Don't use commas or parentheses.  Write \"<tt>null</tt>\"
              for the empty set.<p>")
      )
  )
