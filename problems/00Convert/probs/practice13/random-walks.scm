;;random-walks

(load (t:expand-ps-file-name "infix.scm"))

(define-problem
  '(
    (type short-answer)
    (title "Random Walks")
    (intro "<strong>
     <p>
      Consider the following random-walk graphs:
      <center>
       <img height=400 width=600 src=courseexport/images/random_walks.jpg>
      </center>
      </p>
      </strong>")
    (boxsize 5)
    (questions 
     (! "Find d(<em>x</em>) for a stationary distribution for graph 1. "
        (answer 1/2 (compare
                     (lambda (ans response)
                       (test-infix-numerical-expressions
                        ans response '() '() 1 '())))
                ))

     (! "Find d(<em>y</em>) for a stationary distribution for graph 1. "
        (answer 1/2
                (compare
                 (lambda (ans response)
                   (test-infix-numerical-expressions
                    ans response '() '() 1 '())))))

     (! "If you start at node <em>x</em> in graph 1 and take a (long) random walk,
         does the distribution over nodes ever get close to the stationary distribution?"
        (answer "No"
                (options ""
                         "Yes"
                         "No")
                (rationale "No, you will just alternate between nodes <em>x</em> and <em>y</em>."))
        )


     (! "Find d(<em>w</em>) for a stationary distribution for graph 2. "
        (answer "9/19"
                (compare
                 (lambda (ans response)
                   (test-infix-numerical-expressions
                    ans response '() '() 1 '())))
                (rationale "Found by solving d(w)=.9d(z),
                    d(z)=d(w)+.1d(z), and d(w)+d(z)=1 simultaneously."))  )

     (! "Find d(<em>z</em>) for a stationary distribution for graph 2."
        (answer "10/19"
                (compare
                 (lambda (ans response)
                   (test-infix-numerical-expressions
                    ans response '() '() 1 '())))))

     (! "If you start at node <em>w</em> in graph 2 and take a (long) random walk,
       does the distribution over nodes ever get close to the stationary
       distribution?  Try a few steps to see what is happening."
        (answer "Yes"
                (options ""
                         "Yes"
                         "No")))

     (! "How many stationary distributions are there for graph 3?"
        (answer "infinitely many"
                (options ""
                         "0"
                         "1"
                         "2"
                         "4"
                         "2^4"
                         "infintely many")))

     (! "If you start at node <em>b</em> in graph 3 and take a (long) random walk,
         the probabililty you are at node <em>d</em> will be close to:"
        (answer "1/3"
                (options ""
                         "0"
                         "1/2^n"
                         "1/4"
                         "5/16"
                         "1/3"
                         "1/2"
                         "2/3"
                         "1")))

     )))
