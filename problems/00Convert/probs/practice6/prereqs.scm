(define-problem
  '(
    (type short-answer)
    (title "Prerequisites")
    (intro "The prerequisites of some MIT subjects are given in the following table:
<center>
<table width = 400>
<tr>
<td>Direct Prerequisites</td>
<td>Subject</td>
</tr>
<tr>
<td>18.01</td>
<td>6.042</td>
</tr>
<tr>
<td>18.01</td>
<td>18.02</td>
</tr>
<tr>
<td>18.01</td>
<td>18.03</td>
</tr>
<tr>
<td>8.01</td>
<td>8.02</td>
</tr>
<tr>
<td>8.01</td>
<td>6.01</td>
</tr>
<tr>
<td>6.042</td>
<td>6.046</td>
</tr>
<tr>
<td>18.02, 18.03, 8.02, 6.01</td>
<td>6.02</td>
</tr>
<tr>
<td>6.01, 6.042</td>
<td>6.006</td>
</tr>
<tr>
<td>6.01</td>
<td>6.034</td>
</tr>
<tr>
<td>6.02</td>
<td>6.004</td>
</tr>
</table>
</center>
")
    (questions
     (! "What is the minimum number of terms in which all these subjects can be completed?"
        (answer 4 (rationale 
                   "Three consective subjects must be completed before 6.004 can be taken.")))
     (! "With a 3 subject limit per term,
   what is the minimum number of terms in which all these subjects can be completed?"
        (answer 5 (rationale 
                   "6.02 has four second term prerequisites, which with
a 3 subject limit forces at least one to be postponed to the third
term. So 6.02 couldn't be taken till the fourth term, pushing 6.004 to
term 5.")))
     )                                  ;questions
                                        ;      (extro "")
    )                                   ;'
  )                                     ;define-problem
