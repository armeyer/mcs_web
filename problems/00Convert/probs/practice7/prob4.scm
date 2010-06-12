(define-problem
    '(
      (type short-answer)
      (title "The Integral Method")

       (intro "Let
<center>" (math "S\\ ::=\\ \\sum_{n=1}^5 n^{\\frac{1}{3}}")

"</center>
Using the <b>Integral Method</b>, we can find integers, <i>a,b,c,d,</i> and
a real number, <i>e</i>, such that
<center>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
   SRC=\"courseexport/symbols/varint.gif\" WIDTH=9 HEIGHT=33 ALT=\"sum\"></TD>
<TD VALIGN=MIDDLE ALIGN=CENTER>
   <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
   <TR>
   <TD VALIGN=TOP ALIGN=CENTER HEIGHT=16><IMG 
      SRC=\"courseexport/symbols/supb.gif\" ALIGN=TOP ALT=\"b \"></TD></TR>
   <TR>
   <TD VALIGN=BOTTOM ALIGN=LEFT HEIGHT=16><IMG 
      SRC=\"courseexport/symbols/suba.gif\" ALIGN=TOP ALT=\"a \"></TD></TR>
   </TABLE></TD>
<TD VALIGN=MIDDLE NOWRAP><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x \"><IMG 
   SRC=\"courseexport/symbols/supe.gif\" ALIGN=TOP ALT=\"to the e \"> <IMG 
   SRC=\"courseexport/symbols/d.gif\" ALIGN=TOP ALT=\"d\"><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x\"></TD>
<TD WIDTH=40 ALIGN=CENTER><IMG
   SRC=\"courseexport/symbols/le.gif\" ALIGN=TOP ALT=\"<=\"></TD>
<TD VALIGN=MIDDLE><em>S</em></TD>
<TD WIDTH=40 ALIGN=CENTER><IMG
   SRC=\"courseexport/symbols/le.gif\" ALIGN=TOP ALT=\"<=\"></TD>
<TD VALIGN=MIDDLE ALIGN=CENTER><IMG 
   SRC=\"courseexport/symbols/varint.gif\" WIDTH=9 HEIGHT=33 ALT=\"sum\"></TD>
<TD VALIGN=MIDDLE ALIGN=CENTER>
   <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0>
   <TR>
   <TD VALIGN=TOP ALIGN=CENTER HEIGHT=16><IMG 
      SRC=\"courseexport/symbols/supd.gif\" ALIGN=TOP ALT=\"d \"></TD></TR>
   <TR>
   <TD VALIGN=BOTTOM ALIGN=LEFT HEIGHT=16><IMG 
      SRC=\"courseexport/symbols/subc.gif\" ALIGN=TOP ALT=\"c \"></TD></TR>
   </TABLE></TD>
<TD VALIGN=MIDDLE NOWRAP><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x \"><IMG 
   SRC=\"courseexport/symbols/supe.gif\" ALIGN=TOP ALT=\"to the e \"> <IMG 
   SRC=\"courseexport/symbols/d.gif\" ALIGN=TOP ALT=\"d\"><IMG 
   SRC=\"courseexport/symbols/x.gif\" ALIGN=TOP ALT=\"x\"></TD>
</TABLE>
</center>

What are appropriate values for a--e below?  Enter your answer as a
parenthesized sequence 5 numbers, for example, (1 2 3 4 1/5).")

;;; The formulas without the gifs:
;;;  <em>S<sub>n</sub></em> ::= &sum;<sub><em>i</em>=1</sub><sup>5</sup>&nbsp; <em>i</em><sup>1/3</sup>.
;;
;;;  <center>
;;;  <em>&int;<sub>a</sub><sup>b</sup>x<sup>r</sup></em>
;;;  &le; <em>S<sub>n</sub></em>
;;;  &le; <em>&int;<sub>c</sub><sup>d</sup>x<sup>r</sup></em>.
;;;  </center>
;;;
      (box-width 15)
      (questions
       (! ""
          (answer (0 5 1 6 1/3)
                  (compare
                   (lambda (ans response)
                     (test-condition
                      ans response
                      (lambda (ans response)
                        (and (list? ans)
                             (= (length ans) 5)
                             (= (list-ref ans 0) 0)
                             (= (list-ref ans 1) 5)
                             (= (list-ref ans 2) 1)
                             (= (list-ref ans 3) 6)
                             (= (list-ref ans 4) (exact->inexact 1/3))))
                      )))               ;compare
                  )))                   ;questions
      ) ;'
    )   ; define-problem
