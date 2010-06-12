;; problem 5
(define-problem
  '(
    (type short-answer)
    (title "Magic Card Trick")
    (intro 
     "<strong>Suppose you were trying to communicate an integer between
1 and <em>n</em> to a partner by holding up three cards from a
52-card deck for her to see.  Identify all expressions that represent
the largest <em>n</em> for which you could be sure of doing this.
<p>
Give your answer as a sequence of numbers, separated by spaces, such as
<center>3 5 2</center>
<p>" (math "1.\\ \\frac{52!}{3!}")
"<p>" (math "2.\\ \\frac{52!}{49!}")
"<p>" (math "3.\\ \\frac{52!}{50!}")
"<p>" (math "4.\\ {52 \\choose 3}")
"<p>" (math "5.\\ {52 \\choose 5}")
"<p>" (math "6.\\ {49 \\choose 3}")
"<p>" (math "7.\\ {52 \\choose 3}\\cdot 3!")
"<p>" (math "8.\\ {52 \\choose 4}\\cdot 4!")
"</strong>"
     )
;      (boxsize 5)
      (box-width 15)
;      (compare equal?)
      (questions
       (! ""
          (answer  (2 7) (compare test-set)
                   (rationale "<strong>There are " (math "52 \\cdot 51 \\cdot 50")
"possible three-card sequences to show your partner.  This is equal to
both " (math "\\frac{52!}{49!}")
" and " (math "{52 \\choose 3}\\cdot 3!\\ .") "</strong>"
          )))
       );questions
      );'
  );define-problem
