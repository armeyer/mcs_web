;;problem 5
(load (t:expand-ps-file-name "infix.scm"))

(define-problem
    '(
      (type short-answer)
      (title "A random number")
      (intro "Here is a process to construct a random number: First,
you flip a coin that comes up heads with probability 3/5.  If you see
heads, you roll a fair die and return the result.  Otherwise, you flip
a fair coin 3 times, and return twice the number of heads.

<p> Let <em>N</em> be the number that you return.  <br>Let <em>F</em> be
an indicator random variable that is 1 when the biased coin comes up
heads.")

      (box-width 5)
      (questions

       (! "What is Pr{<em>N</em>=0}?"
          (answer 1/20
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale 
"The only way to get 0 is if you first flip tails and then flip 0 heads. Therefore
<center>
Pr{<em>N</em>=0} = 
Pr{<em>F</em>=0 and 0 heads} = 
Pr{<em>F</em>=0} Pr{0 heads} = 
(2/5) (1/8) =
1/20.
</center>"
)))

       (! "What is Pr{<em>N</em>=3}?"
          (answer 2/20
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "
The only way to get 3 is if you first flip heads and then roll a 3. Therefore
<center>
Pr{<em>N</em>=3} = 
Pr{<em>F</em>=1 and roll 3} = 
Pr{<em>F</em>=1} Pr{roll 3} = 
(3/5) (1/6) =
2/20.
</center>
")))

;        (! "What is Pr{<em>N</em>=4}?"
;           (answer 5/20
;           (compare 
;            (lambda (ans response)
;              (test-infix-numerical-expressions ans response '() '() 1 '())))
;                   (rationale "
; You can get 4 either by flipping heads and rolling a 4 or 
; by flipping tails and then flipping 2 heads. Therefore
; <center>
; Pr{<em>N</em>=4} = 
; Pr{<em>F</em>=1 and roll 4} + Pr{<em>F</em>=0 and  2 heads}  = 
; (3/5) (1/6) + (2/5) (3/8) =
; 5/20.
; </center>
; ")))

         (! "What is Pr{<em>N</em>=6}?"
            (answer 0.15
            (compare 
             (lambda (ans response)
               (test-infix-numerical-expressions ans response '() '() 1 '())))
                    (rationale "
  You can get 6 either by flipping heads and rolling a 6 or 
  by flipping tails and then flipping 3 heads. Therefore
  <center>
  Pr{<em>N</em>=6} = 
  Pr{<em>F</em>=1 and roll 6} + Pr{<em>F</em>=0 and 3 heads}  = 
  (3/5) (1/6) + (2/5) (1/8) =
  3/20.
  </center>
  ")))

       (! "What is Pr{<em>N</em>=7}?"
          (answer 0
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "There is no way to end up with the number 7.")))

       (! "What is Pr{<em>N</em>=6|<em>F</em>=0}?"
          (answer 0.125
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "
Given that <em>F</em>=0, we know that the first coin flip was tails. So, we are in the 
case where the fair coin is flipped 3 times. In that case, we get 6 only by flipping 3
heads. The probability of this happening is 1/8.
")))

       (! "What is Pr{<em>F</em>=0|<em>N</em>=6}?"
          (answer 1/3
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "
We use the definition of conditional probability to compute:
<center>
Pr{<em>F</em>=0|<em>N</em>=6} = 
Pr{<em>F</em>=0 and <em>N</em>=6}/Pr{<em>N</em>=6} = 
(2/5) (1/8) / (3/20) =
1/3,
</center>
(where, for the denominator, we used the answer to a previous question).  
Hence, if somebody else has run the process and ended up with 6, we know
there is 1 in 3 chance that he had to flip the fair coin.
")))

       (! "What is Pr{<em>N+F</em>=5}?"
          (answer 2/20
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "
If <em>F</em>=0, then we are flipping the fair coin and doubling the number of heads, so <em>N</em> is even, 
and therefore  <em>N+F</em> cannot be odd.  Hence, the only way for <em>N+F</em> to be odd is if <em>F</em>=1. 
Then <em>N+F</em>=5 if and only if <em>N</em>=4, which happens exactly when we roll a 4. Overall, 
<center>
Pr{<em>N+F</em>=5} = 
Pr{<em>F</em>=1 and <em>N</em>=4} = 
Pr{<em>F</em>=1} Pr{roll 4} = 
(3/5) (1/6) =
2/20,
</center>
")))

       (! "What is Pr{<em>N+F</em>=6}?"
          (answer 3/20
          (compare 
           (lambda (ans response)
             (test-infix-numerical-expressions ans response '() '() 1 '())))
                  (rationale "
This can happen either because <em>F</em>=1 and <em>N</em>=5 or because <em>F</em>=0 and <em>N</em>=6.
<center>
Pr{<em>N+F</em>=6} = 
Pr{<em>F</em>=1 and <em>N</em>=5} + Pr{<em>F</em>=0 and <em>N</em>=6} = 
(3/5) (1/6) + (2/5) (1/8) =
3/20,
</center>
")))

       );questions
      );'
);define-problem
