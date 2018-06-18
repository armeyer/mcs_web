;; problem 6
(define-problem
  '(
    (type multi-part)
    (title "Matching")
    (intro "")
    (subproblems
     (!prob
      (type short-answer)
      (box-width 40)
      (title "A Perfect Matching")
      (questions
       (! "
<strong>Find a perfect matching the bipartite simple graph <em>G</em> whose vertices and
edges are given by the following sets:
<center>
<em>V</em> := {a,b,c,d} &cup; {1,2,3,4}<br>
<em>E</em> := {{a,1}, {a,3}, {b,2}, {c,3}, {c,4}, {d,1}, {d,2}}
</center>

<p>
Type in the box the edges of the matching. For each edge, you have to write the 
letter in the pair first. For instance, you should write (a 1) and not (1 a).

List the edges separated by spaces, for example, if you want to answer {1
a} and {2 b}, type
<center>
(a 1) (b 2)
</center>
The order in which you list the edges does not matter.
</strong><p>"
           (answer ((a 3) (b 2) (c 4) (d 1)) (compare test-set)
                   (rationale "In this graph, the perfect matching happens to be
                     unique.")
                   ) ;answer
           ) ;!
       ) ;questions
      ) ;prob
     
     (!prob
      (type short-answer)
      (box-width 20)
      (title "No Perfect Matching")
      (questions
       (! "
<strong>The bipartite simple graph <em>G</em> whose vertices and
edges are given by the folowing sets:
<center>
<em>V</em> := {a,b,c,d} &cup; {1,2,3,4}<br>
<em>E</em> := {{a,3}, {a,4}, {b,1}, {b,2}, {c,1}, {c,2}, {d,1}, {d,2}}
</center>
does not have a perfect matching.
  
<p>
Which of the following properties of <em>G</em> make a perfect matching
impossible?

<p>
<ol>
<li> The set {1,3,4} has only 2 neighbors.

<li> The vertices a,b,c,d, on the \"left\" side, all have degree 2, but
none of the vertices 1,2,3,4, on the \"right\" side, has degree 2.

<li> The set {b,c,d} has only 2 neighbors.

<li> <em>G</em> has 8 edges.

<li> The set {3,4} has only 1 neighbor.  

<li> Vertex 1 has degree 3, but each of its neighbors only has degree 2.

<li> The set {a,b} has 4 neighbors.

</ol><p>
Give your answer as a sequence of numbers separated by some 
spaces <br>(e.g., \"6 9\"). Don't use commas or parentheses.<p></strong>"
          (answer (3 5) (compare test-set)
                  (rationale "
<strong>If we let the letters be the \"girls\" and the numbers be the \"boys\",
then property 3. is a bottleneck that prevents a perfect match.  If we let
the letters be the \"boys\" and the numbers be the \"girls\", then
property 5. is another bottleneck in <em>G</em>.

<p>Property 1. also describes a bottleneck, but it's not true
<tt>:-)</tt></strong>")
                  ) ;answer
          ) ;!
       ) ;questions
      ) ;prob
     ) ;subproblems
    ) ;'
) ;define-problem
