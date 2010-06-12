;; GCD-2 --- problem 3
(define-problem
  '(
    (type short-answer)
    (title "GCD's II")
    (intro "")
    (box-width 25)
    (questions
     (! "<strong>Compute the GCD of the following two numbers: <br>

<em>x</em> = 17<sup>88</sup> * 31<sup>5</sup> * 37<sup>2</sup> *
59<sup>1000</sup> <br>

<em>y</em> = 19<sup>(9<sup>22</sup>)</sup> * 37<sup>12</sup> *
53<sup>3678</sup> * 59<sup>29</sup>.

<p>
Please give the prime factorization of your answer as a set of
(<em>prime</em> <em>exponent</em>) pairs.  For example, to write  
the number 60 = 2<sup>2</sup> * 3 * 5, you can write<center>
(3 1) (2 2) (5 1)
</center>
<br>The order in which you give your pairs does not matter.<p>" 
        (answer 
                ((37 2) (59 29))
(compare test-set)
(rationale "
<p>
To get the GCD of two numbers: iterate over all primes that appear in both 
factorizations;  raise each of them to the <em>smallest</em> of its two 
exponents; then multiply the resulting powers. 
<p>
By the way, if in this procedure you replace <em>smallest</em> with 
<em>greatest</em>, the return value will be the LCM (least common multiple) 
of the two numbers.</strong>")
                ) ;answer
        ) ;!
     ) ;questions
    ) ;'
  );define-problem
