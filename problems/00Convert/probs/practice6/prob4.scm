(load (t:expand-ps-file-name "infix.scm"))

;; problem 4
(define-problem
  '(
    (type short-answer)
    (title "Game trees")

    (intro "In the game tree for the game Tic-Tac-Toe,
<!--
(discussed in <a href =
\"http://courses.lcs.mit.edu/6.042/fall07/ln4.pdf#game.tree\"> Week 4
Notes</a>, section 4)
-->
the root has nine children corresponding to the nine boxes that the first
player could mark with an \"X\".

Each of these nine nodes will have eight children each in the second level
of the tree, indicating where the second player can mark with an \"O\",
giving a total of 72 nodes.

<p>Answer the following questions about the game tree for Tic-Tac-Toe.")
      (box-width 20)
      (questions
       (! "How many nodes will be in the third level of the tree? <br>" (answer 504
             (compare 
	      (lambda (ans response)
               (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
             (rationale
              "Each of the 72 nodes in the second level will have 7
               children giving a total of 504") ))
       (! "What is the first level where this simple pattern of calculating
           nodes stops working? <br>"
          (answer 6
                  (rationale "At the fifth level, it's possible that
                  player 1 has won and so the number of nodes on
                  the 6th level will not simply be 4 times the number"
                          ))));questions
;      (extro "")
      );'
  );define-problem

