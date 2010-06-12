;; problem 2
(define-problem
  '(
    (type multi-part)
    (title "Summation")

    (intro "There is a number <i>a</i> such that 
<center>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=MIDDLE ALIGN=CENTER>
  <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
  <TR><TD VALIGN=BOTTOM ALIGN=CENTER><IMG 
     SRC=\"courseexport/symbols/subinfty.gif\" ALT=\"infinity\"></TD>
  </TR>
  <TR><TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
     SRC=\"courseexport/symbols/sum.gif\" WIDTH=20 HEIGHT=33 ALT=\"sum\"></TD>
  </TR>
  <TR VALIGN=TOP><TD VALIGN=TOP ALIGN=CENTER><IMG 
     SRC=\"courseexport/symbols/supi.gif\" ALT=\"i\"><IMG 
     SRC=\"courseexport/symbols/supeq.gif\" ALT=\"equals\"><IMG 
     SRC=\"courseexport/symbols/sup1.gif\" ALT=\"1\"></TD>
  </TR>
  </TABLE>
</TD>
<TD VALIGN=MIDDLE NOWRAP><IMG 
   SRC=\"courseexport/symbols/i.gif\" ALT=\"i\"><IMG 
   SRC=\"courseexport/symbols/supp.gif\" ALT=\"to the p\">
</TD>
</TR>
</TABLE>
</center>
converges to a finite value iff <i>p</i> &lt; <i>a</i>.")
;;;
;;; the formula without gifs:
;;; &sum;<sub><em>i</em>=1</sub><sup>&infin;</sup>&nbsp; <em>i <sup>p</sup></em>
;;;

    (subproblems
     (!prob 
      (type short-answer)
      (box-width 5)
      (title "Value of <em>a</em>")
      (questions 
       (! "What is the value of <i>a</i>?" (answer -1))
       );questions
      );prob

     (!prob 
      (type short-answer)
      (title "Proof")
      (intro "Which of the following would be good approaches as part of a proof
that this value of <i>a</i> is correct ?

<ol>
<li> find a closed form for 
<center>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
   SRC=\"courseexport/symbols/varint.gif\" WIDTH=9 HEIGHT=33 ALT=\"sum\"></TD>
<TD VALIGN=MIDDLE NOWRAP><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x\"><IMG 
   SRC=\"courseexport/symbols/supp.gif\" ALIGN=TOP ALT=\"to the p\"> <IMG 
   SRC=\"courseexport/symbols/d.gif\" ALIGN=TOP ALT=\"d\"><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x\"></TD></TR>
</TABLE>
</center>

<li> find a closed form for 
<center>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
   SRC=\"courseexport/symbols/varint.gif\" WIDTH=9 HEIGHT=33 ALT=\"sum\"></TD>
<TD VALIGN=MIDDLE NOWRAP><IMG 
   SRC=\"courseexport/symbols/i.gif\" ALIGN=TOP ALT=\"i\"><IMG 
   SRC=\"courseexport/symbols/supx.gif\" ALIGN=TOP ALT=\"to the x\"> <IMG 
   SRC=\"courseexport/symbols/d.gif\" ALIGN=TOP ALT=\"d\"><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x\"></TD></TR>
</TABLE>
</center>

<li> induction on <i>p</i>

<li> consider induction on <em>n</em> using the following sum 
<center>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=MIDDLE ALIGN=CENTER>
  <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
  <TR>
  <TD VALIGN=BOTTOM ALIGN=CENTER><IMG 
     SRC=\"courseexport/symbols/subn.gif\" ALT=\"n\"></TD></TR>
  <TR>
  <TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
     SRC=\"courseexport/symbols/sum.gif\" WIDTH=20 HEIGHT=33 ALT=\"sum\"></TD></TR>
  <TR>
  <TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
     SRC=\"courseexport/symbols/supi.gif\" ALT=\"i\"><IMG 
     SRC=\"courseexport/symbols/supeq.gif\" ALT=\"equals\"><IMG 
     SRC=\"courseexport/symbols/sup1.gif\" ALT=\"1\"></TD></TR>
  </TABLE></TD>
<TD VALIGN=MIDDLE NOWRAP><IMG 
   SRC=\"courseexport/symbols/i.gif\" ALT=\"i\"><IMG 
   SRC=\"courseexport/symbols/supp.gif\" ALT=\"to the p\"></TD></TR>
</TABLE>
</center>

<li> compare the series term-by-term with the Harmonic series

</ol>")
;;; the formulas without tables:
;;; <i>&int;&nbsp; x <sup>p</sup> dx</i>
;;; <i>&int;&nbsp; i <sup>x</sup> dx</i>
;;; &sum;<sub><em>i</em>=1</sub><sup><em>n</em></sup>&nbsp; <em>i <sup>p</sup></em> 
;;;

      (questions
       (! "" (answer (1 5) (compare test-set) 
                    (rationale "<p>1 is correct: the sum is &Theta;(<i>&int;</i>&nbsp;<sub>1</sub><sup>&infin;</sup>&nbsp;<i>x <sup>p</sup>dx</i>).

<br>For <i>p</i> &ne; -1, the indefinite integral is <i>x</i>
<sup><i>p</i>+1</sup> / (<i>p</i>+1).

<ul> <li>If <i>p</i> &lt; -1, then <i>p</i>+1 &lt 0, so lim<sub><i>x</i>&rarr;&infin;</sub> <i>x</i> <sup><i>p</i>+1</sup> = 0, and the
definite integral from 1 to &infin; evaluates to -1 / (<i>p</i>+1).  Hence
the sum is bounded from above, and since it is increasing, it has a finite
limit, that is, it converges. </li>

<li>If <i>p</i> &gt; -1, then <i>p</i>+1 &gt
0, so lim<sub><i>x</i>&rarr;&infin;</sub> <i>x</i> <sup><i>p</i>+1</sup> =
&infin;, and
the definite integral diverges. </li> </ul> For <i>p</i> = 1 the
indefinite integral is log <em>x</em> which also approaches &infin; as <i>x</i>
approaches &infin;, so the the definite integral also diverges.

<p>4 is incorrect:<br>

This would need the ideas from the good approaches to handle the induction
step anyway, at which point the induction would be moot.

<p>5 is correct:<br>For <i>p</i> = -1, the sum is the harmonic series
              which we know does not converge. Since the term <i>i <sup>p</sup></i>
              is increasing in <i>p</i> for <i>i</i> &gt; 1, the sum will
              be larger, and hence also diverge for <i>p</i> &gt; -1."))))
      );prob
     );subproblems
    );'
  );define-problem
