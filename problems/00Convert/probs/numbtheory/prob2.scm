;; problem 2
(define-problem
  '(
    (type short-answer)
    (title "GCD's I")
    (intro "<strong>Consider the two integers:
<center>
<em>x</em> = 21212121,<br>
<em>y</em> = 12121212.
</center>")
    (box-width 14)
    (questions
     (! "What is the GCD of <em>x</em> and <em>y</em>? (Hint: Looks scary, but it's not.)" 
(answer 3030303
(rationale "<p>We run the algorithm: 
<p>
GCD(21212121,12121212)  <br>
= GCD(12121212,9090909) <br>
= GCD(9090909,3030303)  <br>
= GCD(3030303,0).")
                                                                ) "<p>"
        ) ;!
     (! 
"How many iterations of the Euclidean algorithm are needed to compute
this GCD?  <br> 
(An iteration of the Euclidean algorithm is defined as an application of the equation 
<center>
GCD(<em>a</em>,<em>b</em>) = GCD(<em>b</em>,<em>a</em> rem <em>b</em>).  
</center>
The algorithm begins with GCD(<em>x</em>,<em>y</em>) and ends with GCD(<em>d</em>,0) 
for some <em>d</em>.)<p>"
(answer 3
(rationale "In the execution of the algorithm in Part 1 we needed 3 applications of the equation.</strong>")
                           )
         
        ) ;!
     ) ;questions
    ) ;'
  );define-problem
