;; problem 5
(define-problem 
  '((type short-answer)
      (title "Images")
        (intro "For any function <em>f</em>: A&rarr;B and subset, A'&sube;A, we define

<p>&nbsp;&nbsp;&nbsp;<em>f</em>(A') := { <em>f</em>(<em>a</em>) | <em>a</em>&isin;A' }

<p>For example, if <em>f</em>(<em>x</em>) is the doubling function, 2<em>x</em>,
with domain and codomain equal to the real numbers, then <em>f</em>(Z) defines
the set of even integers (here Z stands for the integers).

<p>Now assume <em>f</em> is total and A is finite, and fill in the blank to
produce the <b>strongest</b> correct version of the following 
statements:")
          (box-width 20)
          (questions 
           (! "|<em>f</em>(A)| "
               (answer "is less than or equal to"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than")
                (rationale "since <em>f</em>(A) &sube; B"))
               " |B|")
           (! "If <em>f</em> is a surjection, then |A| "
               (answer "is greater than or equal to"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than")
                (rationale "by the Mapping Rule in Week 2 Notes"))
               " |B|")
           (! "If <em>f</em> is a surjection, then |<em>f</em>(A)| "
               (answer "equals"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than"))
               " |B|")
           (! "If <em>f</em> is an injection, then |<em>f</em>(A)| "
               (answer "equals"
                (options "" 
                         "is less than" 
                         "is less than or equal to" 
                         "equals" 
                         "is greater than or equal to" 
                         "is greater than"))
               " |A|")
           (! "If <em>f</em> is a bijection, then |A| "
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
