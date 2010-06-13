;; planar-faces

(define-problem
  '(
    (type short-answer)
    (title "Faces of a Planar Embedding")
    (intro
     "<strong>What are the discrete faces of the following two graphs?
     <p>(Write each cycle as a sequence of letters without spaces,
            starting with the alphabetically earliest letter in the clockwise direction,
            for example `<tt>adbfa</tt>.'  Separate the sequences with spaces.</p></strong>")
    (box-width 40)
    (questions
     (! "<p><center><img height=200 width=200 src=courseexport/images/planar-graphs/edge-twice-same-face.jpg>
        </center></p>"
        (answer (abcda efge abcefgecda) (compare test-set)
                (rationale 
                 "Don't forget the 'outside' face."))  )               ;!
     (! "<p><center><img height=200 width=200 src=courseexport/images/planar-graphs/dongle-face.jpg>
        </center></p>"
        (answer (rstvwvxyxvtur rstur) (rstvxyxvwvtur rstur) (compare test-set)
                (rationale 
                 " "))  )               ;!
     )                                  ;questions
    )                                   ;'
  )                                     ;define-problem
