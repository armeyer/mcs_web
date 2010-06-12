;; problem 1
(define-problem
  '(
    (type multi-part)
    (title "Graph Algorithm")
    (intro "<strong>The algorithm <b>Mark</b> starts with a simple undirected graph, <em>G</em>, 
with a finite set of vertices, <em>V</em>, and a set of <em>one or more</em> edges, <em>E</em>.  
Initially, all edges are unmarked.  Then it proceeds to mark some of the edges, by 
repeatedly performing the following steps until no further step is possible:<p>

<ol>
<li> Choose any unmarked edge <em>e &isin; E</em> such that there is currently no
path of marked edges between the endpoints of <em>e</em>.</li>

<li> Mark edge <em>e</em>.</strong>
</ol>")
    (subproblems
     (!prob 
      (type short-answer)
      (title "Preserved Invariants")
      (intro "<strong>Which of the following predicates are <b>both</b>
      <em>preserved invariants</em> <b>and</b> also hold for the start state?<p>
<ol>
  <li> There is always an edge that has not been marked.
  <li> The marked edges form an acyclic graph.
  <li> The marked edges form a tree.
  <li> There is always a vertex not touching a marked edge.</strong>
</ol>")                                 ;intro

      (questions 
       (! "" (answer (2) (compare test-set)
                     (rationale "<strong>
<ol>
  <li> This is true for the start state (since, by definition, there is at least
one edge), but is <b>not</b> preserved.

  <li> This is a preserved invariant. It also holds vacuously for the
start state, since it has no marked edges.

  <li> This is true vacuously for the start state, but is <b>not</b> preserved.

  <li> This is true for the start state, but is <b>not</b> preserved.</strong>
</ol>")                                 ; rationale
                     )                  ;answer
          )                             ;!
       )                                ;question      
      )                                 ;prob

     (!prob 
      (type short-answer)

      (title "Derived Variables")

      (intro "<strong>Please choose the property that best describes each of the
following derived variables.

<p>Answer with the strongest
applicable property, that is, for a variable that is constant the answer
should be \"constant\", even though it is also necessarily both weakly
increasing and weakly decreasing.</strong>")
      (questions

       (! "#unmarked edges"
          (answer "strictly decreasing"
                  (rationale "In every iteration, the number of unmarked edges
decreases by 1.")
                  (options "" "strictly increasing" "weakly increasing"
                           "strictly decreasing" "weakly decreasing" "constant")))

       (! "#marked edges"
          (answer "strictly increasing"
		  (rationale "In every iteration, the number of marked edges
increases by 1.")
                  (options ""
                           "strictly increasing" "weakly increasing" "strictly decreasing"
                           "weakly decreasing" "constant")))

       (! "#unmarked edges + #marked edges"
          (answer "constant"
		  (rationale "In every iteration, the number of marked edges
increases by 1 and the number of unmarked edges decreases by 1. So, their sum 
remains constant, equal to the original number of edges in the graph.")
                  (options "" "strictly increasing" "weakly increasing"
                           "strictly decreasing" "weakly decreasing" "constant")))

       (! "#marked edges - #unmarked edges"
          (answer "strictly increasing"
		  (rationale "In every iteration, the number of marked edges
increases by 1 and the number of unmarked edges decreases by 1. So, their 
difference increases by 2.")
                  (options "" "strictly increasing" "weakly increasing"
                           "strictly decreasing" "weakly decreasing" "constant")))

       (! "#connected components in the graph <em>G'</em> with
vertices <em>V</em> and edges <em>M</em>, where
<em>M</em> is the set of marked edges"
          (answer "strictly decreasing"
		  (rationale "Each new marked edge connects two vertices that 
previously had no path between them in <em>G'</em>. So, the vertices belonged  
to different components of <em>G'</em>, and the new marked edge merges these 
components into one. As a result, the number of components in <em>G'</em> 
decreases by 1.")
                  (options
                   "" "strictly increasing" "weakly increasing"
                   "strictly decreasing" "weakly decreasing" "constant"))))
      )                                 ;prob

                            ;prob

     )                                  ;subproblems
    );'
  );define-problem
