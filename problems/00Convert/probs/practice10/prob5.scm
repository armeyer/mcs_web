(define-problem
  '(
    (type multi-part)
    (title "Independence")
    (intro "<strong>A length 3 bit string, <em>x</em>, is chosen at random.
Consider the following events:
<center>
<table>
<tr><td><i><b>E</b></i> ::=  <em>x</em> contains an odd number of 1s.</td></tr>

<tr><td><i><b>F</b></i> ::= <em>x</em> starts with a 1.</td></tr>

<tr><td><i><b>G</b></i> ::= <em>x</em> starts with a 0.</td></tr>

<tr><td><i><b>H</b></i> ::= <em>x</em> ends with a 1.</td></tr>
</table>
</center></strong>")
    (subproblems

     (!prob 
      (type short-answer)
      (title "Independence of two events")
        (box-width 50)
      (questions


       (! "<strong>Which pairs of the above events are independent?<p>
          Answer with a sequence of parenthesized pairs separated by
        spaces such as<br> \"(E F) &nbsp;(G H)\".
        The pairs may be in any order, for example,
           \"(G H)&nbsp; (E F)\" is ok, but the letters in the pair
            must be in alphabetical order, for example,
           \"(F E)&nbsp; (G H)\" is not ok.<p></strong>"
          (answer ((E F) (E G) (E H) (F H) (G H))
                (compare test-set)
                (rationale
"<p><font color = green><b>(E F)</b></font>.  To check independence,
we want
Pr{<em><b>E</b></em> &cap; <em><b>F</b></em>} =
Pr{<em><b>E</b></em>}&middot;Pr{<em><b>F</b></em>}.

<br>But Pr{<em><b>E</b></em> &cap; <em><b>F</b></em>) = 2/8 = 1/4 by
enumerating strings, and Pr{<em><b>E</b></em>} = Pr{<em><b>F</b></em>} =
1/2.  So, the events are independent.</p>

<p><b><font color = green>(E G)</font></b>. To check independence, we want Pr{<em><b>E</b></em> &cap; <em><b>G</b></em>} = Pr{<em><b>E</b></em>}&middot;Pr{<em><b>G</b></em>}.

<br>But Pr{<em><b>E</b></em> &cap; <em><b>G</b></em>} = 2/8 = 1/4 by
enumerating strings, and Pr{<em><b>E</b></em>} = Pr{<em><b>G</b></em>} = 1/2.
So, the events are independent.</p>

<p><font color = green><b>(E H)</b></font>. To check independence, we want Pr{<em><b>E</b></em> &cap; <em><b>H</b></em>} = Pr{<em><b>E</b></em>}&middot;Pr{<em><b>H</b></em>}&middot;
Pr{<em><b>E</b></em> &cap; <em><b>H</b></em>} = 2/8 = 1/4 by
enumerating strings, and Pr{<em><b>E</b></em>} = Pr{<em><b>H</b></em>} = 1/2.  So, the events are independent.</p>

<p><font color = red><b>(F G)</b></font>. To check independence, we want Pr{<b><em>F</em></b> &cap; <em><b>G</b></em>} = Pr{<em><b>G</b></em>}&middot;Pr{<em><b>F</b></em>}.

<br>But Pr{<b><em>G</em></b> &cap; <em><b>F</b></em>} = 0/8 = 0 by
enumerating strings, and Pr{<em><b>G</b></em>} = Pr{<em><b>F</b></em>} = 1/2.
So, the events are <em>not</em> independent.
In fact, the events are disjoint so they cannot be independent!</p>

<p><font color = green><b>(F H)</b></font>.  
To check independence, we want Pr{<b><em>H</em></b>  &cap;  <em><b>F</b></em>} = Pr{<em><b>H</b></em>}&middot;Pr{<em><b>F</b></em>}.

<br> But Pr{<b><em>H</em></b>  &cap; <em><b>F</b></em>} = 2/8 = 1/4 by
enumerating strings, and Pr{<em><b>H</b></em>} = Pr{<em><b>F</b></em>} =
1/2.  So, the events are independent.</p>

<p><font color = green><b>(G H)</b></font>. These are also independent, similarly." )  ;rationale
                );answer
          );!
       );questions
      );prob

     (!prob 
      (type short-answer)
      (title "Pairwise and Mutual Independence")
	(questions
	(! "Are the events <em><b>E</b></em>, <em><b>F</b></em>, and
<em><b>H</b></em> <i>pairwise</i> independent?"
         (answer "yes" 
          (options "" "yes" "no" "can't tell")
          (rationale "To check whether the three events are <em>pairwise</em> independent, we 
need to check whether the pairs of events (<em><b>E</b></em>, <em><b>F</b></em>),
(<em><b>E</b></em>, <em><b>H</b></em>), and (<em><b>F</b></em>, <em><b>H</b></em>) are independent. 
But we already know they are, from Part 1.")  )) 

	(! "Are the events <em><b>E</b></em>, <em><b>F</b></em>, and
<em><b>H</b></em> <i>mutually</i> independent?"
         (answer "yes" 
          (options "" "yes" "no" "can't tell")
          (rationale "To check whether the three events are <em>mutually</em> independent, we 
need to check every subset of the them.  We already know that subsets of size 2 are ok, 
since by the previous question the three events are <em>pairwise</em> independent.  So, we just 
need to check the one subset of all three, that is, {<em><b>E</b></em>, <em><b>F</b></em>, 
<em><b>H</b></em>}. Specifically, we want to know if<br>
<center>
Pr{<em><b>E</b></em> &cap; <em><b>F</b></em> &cap; <em><b>H</b></em>} =<sup>?</sup> Pr{<em><b>E</b></em>}&middot;
Pr{<em><b>F</b></em>}&middot; Pr{<em><b>H</b></em>}.
</center><br>
The only string satisfying all three
events is \"111\", so Pr{<em><b>E</b></em> &cap; <em><b>F</b></em>
&cap; <em><b>H</b></em>} = 1/8 = 1/2&middot;1/2&middot;1/2 = Pr{<em><b>E</b></em>}&middot;
Pr{<em><b>F</b></em>}&middot; Pr{<em><b>H</b></em>}. Hence, this subset is also ok.  Therefore, 
the three events are also <em>mutually</em> independent.")  ))  );questions
        );!prob

     (!prob 
      (type short-answer)
      (title "More")
	(questions
	(! "What about the events <em><b>F</b></em>, <em><b>G</b></em>, and
<em><b>H</b></em>? They are..."
         (answer
             "not pairwise independent" 
          (options 
             "" 
             "not pairwise independent" 
             "pairwise but not mutually independent" 
             "mutually independent" 
             "can't tell")
          (rationale "From Part 1, we know  the events <em><b>F</b></em> and <em><b>G</b></em> are 
not independent.  Therefore, the events  <em><b>F</b></em>, <em><b>G</b></em>, and
<em><b>H</b></em> are not  <em>pairwise</em> independent.  This immediately 
implies that they are not  <em>mutually</em> independent, either.")  )) 

	(! "What about the events <em><b>E</b></em>, <em><b>G</b></em>, and
<em><b>H</b></em>? They are..."
         (answer
             "mutually independent" 
          (options 
             "" 
             "not pairwise independent" 
             "pairwise but not mutually independent" 
             "mutually independent" 
             "can't tell")
          (rationale "From Part 1, we know all subsets of 2 events are ok. Hence, <em><b>E</b></em>, <em><b>G</b></em>, and
<em><b>H</b></em> are <em>pairwise</em> independent.  For mutual independence, we need to also check the subset of all three 
events, that is, {<em><b>E</b></em>, <em><b>G</b></em>, <em><b>H</b></em>}. We want to know if<br>
<center>
Pr{<em><b>E</b></em> &cap; <em><b>G</b></em> &cap; <em><b>H</b></em>} =<sup>?</sup> Pr{<em><b>E</b></em>}&middot;
Pr{<em><b>G</b></em>}&middot; Pr{<em><b>H</b></em>}.
</center><br>
The only string satisfying all three events is \"001\", so Pr{<em><b>E</b></em> &cap; <em><b>G</b></em>
&cap; <em><b>H</b></em>} = 1/8 = 1/2&middot;1/2&middot;1/2 = Pr{<em><b>E</b></em>}&middot;
Pr{<em><b>G</b></em>}&middot; Pr{<em><b>H</b></em>}. Hence, this subset is also ok.  Therefore, 
the three events are indeed <em>mutually</em> independent.")  )) 

	(! "What about the events <em><b>E</b></em>, <em><b>F</b></em>, and
<em><b>G</b></em>? They are..."
         (answer
             "not pairwise independent" 
          (options 
             "" 
             "not pairwise independent" 
             "pairwise but not mutually independent" 
             "mutually independent" 
             "can't tell")
          (rationale "As in the first question, the events <em><b>F</b></em> and <em><b>G</b></em> spoil it.  
So,  <em><b>E</b></em>, <em><b>F</b></em>, and
<em><b>G</b></em> are not <em>pairwise</em> independent, and therefore not  <em>mutually</em> independent, either.")  )) 

 );questions
        );!prob



     );subproblems
    );'
  );define-problem
