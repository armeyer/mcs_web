;; problem 3
(define-problem
  '(
    (type short-answer)
    (title "Recursive Definitions")

    (intro "Consider the function
<center>
<em>f</em>(<em>n</em>) ::= 5<em>n</em>
</center>
on the nonnegative integers.

<p>This function can also be defined by a recursive definition with base
case
<center> f(0) ::= 0,
</center>
and a recursive (\"constructor\")
case.")

  (questions
   (! "Identify the possible correct <i>recursive cases</i> that would
  recursively define this sequence.
   <ol>
  <li> f(n+1) = 5(n+1)
  <li> f(n+1) = 5 f(n)
  <li> f(n+1) = f(n+5)
  <li> f(n+1) = f(n) + 5
  <li> f(n+1) = f(n) + f(1)
</ol>

<p>Write your answer as a sequence of
digits in any order, such as <center> <tt>1 4 3</tt></center>"
      (answer (1 4) (4) (compare test-set)
                   (rationale "
Choice (4) is the most straightforward recursive definition.
Choice (1) is also correct: a recursive case of <em>f</em>(<em>n</em>+1) <em>may</em> mention 
<em>f</em>(<em>n</em>), but it doesn't have to ---but you could argue that then it wouldn't be a 
<em>recursive</em> definition, so omitting (1) was not penalized.  Choice (2) defines
the wrong function, <em>f</em>(<em>n</em>)::=0  for all <em>n</em>.  Choices (3) and (5) are 
not well-formed recursive cases, 
because they do not define <em>f</em>(<em>n</em>) for all <em>n</em>&ge;1.")));!
     );questions
   ))
