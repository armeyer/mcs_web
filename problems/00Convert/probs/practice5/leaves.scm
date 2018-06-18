;; leaves.scm
(define-problem
  '(
    (type short-answer)
    (title "Leaves")
;      (boxsize 5)
      (box-width 10)
      (questions
       (! "What are the possible numbers of vertices in a tree whose vertices are all leaves?" (answer (1 2) (compare test-set)) )
       (! "What is the smallest possible number of leaves in a tree with 99 vertices?" (answer 2) (compare =))
       (! "What is the largest possible number of leaves in a tree with 99 vertices?" (answer 98) (compare =))
       );questions
;      (extro "")
      );'
)
