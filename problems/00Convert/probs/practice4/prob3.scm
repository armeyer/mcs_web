;; problem 3
(define-problem
  '(
    (type multi-part)
    (title "Graph Isomorphism")
    (subproblems
     (!prob 
      (type short-answer)
      (title "Isomorphic Graphs")
      (questions
       (! "<img src=courseexport/images/ps4/prob3a1.gif><p>
<strong>The two graphs above are isomorphic.  This means that there exists an 
edge-preserving bijection from the set of vertices of the 
first graph to the set of vertices of the second graph.<p>
How many such bijections are there?</strong>
<p>"
          (answer 10
                  (rationale "<strong>We may map <em>u<sub>1</sub></em> to
any of the 5 vertices of the second graph, and then <em>u<sub>2</sub></em>
to either of its 2 neighbors.  The remaining vertices are then uniquely
determined.</strong>")
                  ) ;answer
          ) ;!
       ) );prob

     (!prob 
      (type short-answer)
      (title "Non-isomorphic Graphs")
      (intro
       "<img src=courseexport/images/ps4/prob3b1.gif><p>
<strong>The two graphs above (call them <em>G</em> and <em>H</em>) are not isomorphic.<p>
Indicate which of the following assertions can prove this fact.<p>
<ol>
<li><em>H</em> has a vertex of degree 4, but <em>G</em> does not.
<li><em>u<sub>1</sub></em> has degree 3, but <em>v<sub>1</sub></em> has 
    degree 2.
<li><em>G</em> has four vertices of degree 3, but <em>H</em> only has two vertices
    of degree 3.
<li><em>G</em> has a vertex named <em>u<sub>1</sub></em>, but <em>H</em> 
    does not.
<li><em>G</em> has three vertices that form a right triangle, but no three
    vertices of <em>H</em> form a right triangle.
<li><em>G</em> has an edge that is incident to two vertices of degree 3,
    but <em>H</em> does not.  
</ol><p>"
       )
      (questions
       (! ""
          (answer (1 3) (compare test-set)
                  (rationale "<strong>Note that assertion 6 mentions properties
that <em>are</em> preserved under isomorphism, and so if it were true, it could
prove that <em>G</em> and <em>H</em> are not isomorphic.  Unfortunately,
the assertion isn't true; both graphs actually have an edge that is
incident to two vertices of degree 3.</strong>")
                  )  ;answer
          );!
       );questions
      (extro "Answer with a sequence of integers separated by some
spaces, for example, <center> 4 3 2 </center> Don't use commas or
periods.<br>"));prob
     );subproblems
    );'
  );define-problem
