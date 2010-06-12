;; problem 1
(load (t:expand-ps-file-name "logic-infix.scm"))      
(load (t:expand-ps-file-name "prop-sat.scm")) 

(define-problem 
  '((type short-answer)
      (title "Basic Propositions")
        (intro "<p> <b>A word on notation</b>:  In all of the HTML pages 
(problems  and exercises) we
are using the following notation for propositional logic:
<ul>
<li> <tt>^</tt> (caret) for and,
<li> <tt>v</tt> (<b>lower case</b> v) for or,
<li> <tt>~</tt> for not,
<li> <tt>-></tt> (hyphen, &gt;) for implication, and
<li> <tt><-></tt> (&lt;, hyphen, &gt;) for biconditionals.
<li> Propositional variables are upper case letters (and
possibly numbers).
<li> The symbols <tt>true</tt> and <tt>false</tt> are written out in  lower case.
</ul>
When you are asked to enter an expression in propositional logic syntax,
you should use these conventions as well.<hr><p>
Let the propositional variables P, Q, and R have the following meanings:
<ul>
<li>P = You get an A on the final exam.
<li>Q = You do every exercise in the book.
<li>R = You get an A in this class.
</ul>
Write the following propositions using P, Q, and R and logical connectives.")
        (compare (lambda (x y) (test-logical-equiv x y '(p q r))))
          (box-width 20)
          (questions 
           (! "You get an A in this class, but you do not do every 
exercise in the book.<br>"
               (answer "R ^ ~Q"))
           (! "You get an A on the final, you do every exercise in this
book, and you get an A in this class.<br>"
               (answer "P ^ Q ^ R"))
           (! "To get an A in this class, it is necessary for you to get
an A on the final.<br>"
               (answer "R -> P"))
           (! "You get an A on the final, but you don't do every exercise
in this book; nevertheless, you get an A in this class.<br>"
               (answer "P ^ ~Q ^ R"))
             )
))
