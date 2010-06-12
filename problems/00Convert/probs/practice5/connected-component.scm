(define-problem
  '(
    (type short-answer)
    (title "Connected Components")

    (box-width 5)
    (questions
     (! "
<strong>Let <em>G</em> be the graph whose vertices are the integers,<br>
with an edge between <em>i</em> and <em>j</em> iff |<em>i</em> - <em>j</em>| = 6.

<p>How many connected components does <em>G</em> have?</p>"

(answer (6) (compare test-set)
                   (rationale 
"<strong>The vertex sets of the 6 components are
<center>
{...-18, -12, -6, 0, 6, 12, 18,...}<br>
{...-17, -11, -5, 1, 7, 13, 19,...}<br>
{...-16, -10, -4, 2, 8, 14, 20,...}<br>
{...-15, -9, -3, 3, 9, 15, 21,...}<br>
{...-14, -8, -2, 4, 10, 16, 22,...}<br>
{...-13, -7, -1, 5, 11, 17, 23,...}
</center>"))
        ) ;!
     ) ;questions
    ) ;'
  )


