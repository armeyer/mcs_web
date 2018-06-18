(define-problem 
  '(
    (type short-answer)
    (title "Ackermann's Function")
    (intro "This question involves elementary reasoning about a recursively defined function.
<p>
<em>Ackermann's Function, A,</em> is defined as follows:
<center><table>
<tr><td><em>A</em>(<em>m</em>,<em>n</em>) ::= </td>
<td align=left>2<em>n</em></td><td>if <em>m</em>=0 or <em>n</em> &le 1,</td></tr>
<tr><td></td><td><em>A</em>(<em>m</em>-1, <em>A</em>(<em>m</em>,<em>n</em>-1)) </td><td>otherwise.</td></tr>
</table>
</center>
Compute the following:")
    (box-width 20)
    (questions
     (! "<em>A</em>(1,0)<br>"
        (answer 0 (rationale "=2&middot;0 by the first line of the definition.")))
     (! "<em>A</em>(0,1)<br>"
          (answer 2 (rationale "=2&middot;1 by the first line.")))
     (! "<em>A</em>(1,1)<br>"
          (answer 2 (rationale "=2&middot;1 by the first line.")))
     (! "<em>A</em>(2,2)<br>"
          (answer 4 (rationale "<em>A</em>(2,2)=<em>A</em>(1,<em>A</em>(2,1))=<em>A</em>(1,2&middot;1)=<em>A</em>(0,<em>A</em>(1,1))=<em>A</em>(0,2)=2&middot;2=4")))
     (! " <em>A</em>(3,3) &nbsp; &nbsp; (optional, requires programming --all answers marked correct)<br>"
          (answer  65536 (compare (lambda (a b) #t))
   (rationale "in Scheme:<br>
 (define (ack m n)
     (if (or (= m 0) (<= n 1))
      (* 2 n)
      (ack (- m 1) (ack m (- n 1)))))<br>
(ack 3 3)<br>
;Value: 65536")))
     );questions
    );'
);define-problem
