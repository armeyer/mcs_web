(load (t:expand-ps-file-name "infix.scm"))

(define-problem
   '((type short-answer)
     (title "Substitution & Environment Models")
     (intro "We want to calculate the value of &nbsp;&nbsp; 
              eval(subst(f,e),-2)

<br>where &nbsp;&nbsp;&nbsp;&nbsp; e ::= <tt>x&middot;(4+(-(x+1)))</tt> &nbsp;&nbsp; and &nbsp;&nbsp; f ::= <tt>(x+6)&middot;(x&middot;x)</tt>
")
     (boxsize 5)
;     (compare =)
     (questions
      (! "What is result of the evalulation above?" 
         (answer -208
             (compare 
	      (lambda (ans response)
               (test-infix-numerical-expressions ans response '() '() 1 '()))
                 )
             (rationale
              "eval(f,-2) = 16,  eval(e,16)= 16&middot;(-13) = -208") ))

      (! "How many multiplications are performed using the Substitution
Model to calculate this value?"
         (answer 5 (rationale "subst(e,f) is the expression
<center>
        <tt>[(x+6)&middot;(x&middot;x)](4+(-([(x+6)&middot;(x&middot;x)]+1)))</tt>,
</center>
            so the number of multiplications to evaluate it is 5."
         )))

      (! "How many additions are performed using the Environment 
          Model to calculate this value?"
         (answer 3
                 (rationale "1 addition to calculate eval(f,-2)=16, and 2 additions
                       and to calculate eval(e,16)=-208")
                 )
         )
      )))

