;; problem 6
(define-problem
  '(
    (type short-answer)
    (title "Divisibility and Congruence")
    (intro 
     "<strong>A majority of the following statements are equivalent. 
      List all statements in this majority.  
      Assume that <em>n</em> &gt; 0 and <em>a</em> and <em>b</em> are integers.
      <ol>
       <li> <em>a</em> &equiv; <em>b</em> (<b>mod</b> <em>n</em>)
       <li> <em>a</em> = <em>b</em>
       <li> rem(<em>a</em>, <em>n</em>) = rem(<em>b</em>,<em>n</em>)
       <li> <em>n</em> | (<em>a</em> - <em>b</em>)
       <li> <em>a</em> = <em>b</em> + <em>nk</em> for some integer <em>k</em>
       <li> (<em>a</em> - <em>b</em>) is a multiple of <em>n</em>
       <li> <em>n</em> | <em>a</em> or <em>n</em> | <em>b</em>
      </ol></strong>")
    (questions
     (! "" (answer (1 3 4 5 6) (compare test-set))))
        (extro "<p><strong>Answer with a sequence of integers separated by
some spaces, for example, <center> 4 3 2 </center> Don't use commas or
periods.<br>") ;extro
        ))
