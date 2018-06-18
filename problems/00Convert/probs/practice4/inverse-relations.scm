;; inverse_relation_table.scm
(define-problem 
  '((type short-answer)
      (title "Inverse Relations")
        (intro "The inverse, <em>R<sup>-1</sup></em>, of a binary relation, <em>R</em>: A&rarr;B is the relation from B&rarr;A defined by 
<center>b<em>R<sup>-1</sup></em>a &harr; a<em>R</em>b.</center>
In other words, you get the diagram for <em>R<sup>-1</sup></em> from <em>R</em> by \"reversing the arrows\" in the diagram describing <em>R</em>. Now many of the relational properties of <em>R<sup>-1</sup></em> correspond to different properties of <em>R</em>. For example, <em>R</em> is total iff <em>R<sup>-1</sup></em> is a surjection.")
          (questions 
           (! "<em>R</em> is a function iff <em>R<sup>-1</sup></em> is"
              (answer "an injection"
                      (options "" 
                               "a function" 
                               "a surjection" 
                               "an injection"
                               "a bijection"
                               "total" 
                               "none of the above")))
           (! "<em>R</em> is a surjection iff <em>R<sup>-1</sup></em> is"
              (answer "total"
                      (options "" 
                               "a function" 
                               "a surjection" 
                               "an injection"
                               "a bijection"
                               "total" 
                               "none of the above")))
           (! "<em>R</em> is an injection iff <em>R<sup>-1</sup></em> is"
              (answer "a function"
                      (options "" 
                               "a function" 
                               "a surjection" 
                               "an injection"
                               "a bijection"
                               "total" 
                               "none of the above")))
           (! "<em>R</em> is a bijection iff <em>R<sup>-1</sup></em> is"
              (answer "a bijection"
                      (options "" 
                               "a function" 
                               "a surjection" 
                               "an injection"
                               "a bijection"
                               "total" 
                               "none of the above")))
           )))

