;; problem 5
(define-problem 
  '((type short-answer)
      (title "Mapping Lemma: Sizes of Domains and Codomains")
        (intro "For any binary relation, <em>R</em>: A&rarr;B and subset,
S &sube; A, let S<em>R</em> be the image of S under <em>R</em>.
<!--
, that is,
<center>
S<em>R</em> ::= { b &isin; B | s<em>R</em>b for some s &isin;S }.

</center>
-->
For example, if <em>R</em> is the doubling function with domain and
codomain equal to the real numbers, namely
<center>s<em>R</em>t iff t=2s,
</center>

then {0,3,11}<em>R</em> = {0,6,22}, for example, and Z<em>R</em> is the
set of all even integers (here Z stands for the integers).  For any finite
set, S, we define |S| be the size (number of elements) of S.

<p>Now assume <em>R</em> is a <b>total function</b> and A is finite.  Fill
in the blanks to produce the <b>strongest</b> correct version of the
following statements:")
          (box-width 20)
          (questions 
           (! "|A<em>R</em>| "
               (answer "is less than or equal to"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than")
                (rationale "since <em>f</em>(A) &sube; B"))
               " |B|")
           (! "If <em>R</em> is a surjection, then |A| "
               (answer "is greater than or equal to"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than")
                (rationale "by the Mapping Rule in Week 2 Notes"))
               " |B|")
           (! "If <em>R</em> is a surjection, then |A<em>R</em>| "
               (answer "equals"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than"))
               " |B|")
           (! "If <em>R</em> is an injection, then |A<em>R</em>| "
               (answer "equals"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than"))
               " |A|")
           (! "If <em>R</em> is a bijection, then |A| "
               (answer "equals"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than")
                (rationale "by the Mapping Rule in Week 2 Notes"))
               " |B|")
)))
