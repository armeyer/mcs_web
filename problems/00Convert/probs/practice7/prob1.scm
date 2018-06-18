;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Annuities")
    (intro 
           "Assuming you could be sure of getting a 4% return 
forever on money you invest, what would be a proper price to pay for 
an annuity that paid you $10,000 a year forever starting a year from 
now?
<p>
Answer without commas or dollar signs. For example, if you want to 
enter $140,000, you should type 
<center>
140000
</center>")
;      (boxsize 5)
      (box-width 15)
;      (compare equal?)
      (questions
       (! "" (answer 250000 (rationale 
"The current value of $10,000 paid out <em>i</em> years from now is 10,000/(1.04)<sup>i</sup>.  
Summing this for <em>i=1,2,...</em> we get $250,000.  
<p>
Alternatively, $250,000 put in the bank today, will allow us to collect 
0.04($250,000) = $10,000 every year, starting a year from now.")))
       );questions
;      (extro "")
      );'
);define-problem
