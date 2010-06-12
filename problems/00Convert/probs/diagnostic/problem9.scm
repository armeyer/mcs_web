(define-problem 
  '(
    (type short-answer)
    (title "Probability")
    (intro "An experiment consists of flipping three fair coins.  You may answer in fraction format, <em>e.g.</em>, \"3/16\". ")
    (box-width 10)
    (questions
     (! "What is the probability that all three will land on heads?"
        (answer 1/8))
     (! "What is the probability that <em>at least</em> two will land on heads?"
          (answer 1/2))
     (! "What is the average number of heads expected in the experiment?"
          (answer 3/2))
     );questions
    );'
  );define-problem




