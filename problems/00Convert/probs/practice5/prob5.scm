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

;Prove that when the algorithm finishes, the set of marked edges forms
;a spanning tree of the input graph $G$.

;(A {\em spanning tree} of $G$ is a tree whose edges are a subset of
;the set $E$ of edges of $G$, and that contains an edge incident on every
;vertex of $G$.)

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
                     (rationale "
<strong><ol>
  <li> This is true for the start state (since, by definition, there is at least
one edge), but is <b>not</b> an invariant.

  <li> This is an invariant. It also holds vacuously for the start state, since 
it has no marked edges.

  <li> This is true vacuously for the start state, but is <b>not</b> an invariant.

  <li> This is true for the start state, but is <b>not</b> an invariant.
</ol></strong>")                                 ; rationale
                     )                  ;answer
          )                             ;!
       )                                ;question      
      )                                 ;prob

     (!prob 
      (type short-answer)

      (title "Derived Variables")

      (intro "<strong>Please choose the property that best describes each of the
following derived variables.

<p> Answer with the strongest
applicable property, <em>i.e.</em>, a variable that is constant should be
labelled \"constant\", even though it is also necessarily both weakly
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

     (!prob
      (type short-answer)
      (title "Properties")

      (intro "<strong>Suppose <em>G</em> is a <em>connected</em> simple graph with
<em>some</em> edges initially marked, but not necessarily marked in the
way that it would be by the <b>Mark</b> procedure.  Also, suppose
<em>G</em> satisfies the termination condition of the algorithm, that is,
it is not possible to mark an edge in <em>G</em>.  Let <em>H</em> be the
subgraph of <em>G</em> with the same vertices, but only the marked edges.
Which of the following properties <b>must</b> <em>H</em> have?<p>
<ol>
  <li> <em>H</em> is a tree.
  <li> <em>H</em> consists of one or more trees.
  <li> <em>H</em> is connected.
  <li> <em>H</em> has at most two disjoint paths between any two distinct vertices.
  <li> <em>H</em> has at most two connected components.
</ol></strong>
")                                 ;intro

      (questions
       (! "" (answer (3 5) (compare test-set) ;answer
          (rationale "<br>
<strong>None of (1), (2), and (4) is necessarily true. For example, 
consider the case where <em>G</em> is a large <em>complete</em> 
graph with <em>all</em> its edges marked. Then <em>H=G</em>, so <em>H</em> 
has multiple paths and cycles everywhere, spoiling all three properties. 
<br><br>
To see why (3) is true, pick two vertices <em>u &ne; v</em>. Since <em>G</em> 
is connected, there is a path between them. If any of the edges along this path
is unmarked, we can replace it by a path of marked edges (such a path must exist, 
or else the algorithm would be able to mark that edge). After we replace all 
unmarked edges this way, we end up with a path of marked edges beteen <em>u</em> 
and <em>v</em>.  So, every two nodes connect in <em>H</em>.
<br><br>
Given (3), we immediately see that (5) is also true: Since <em>H</em> is connected, 
it has exactly one component, and therefore at most two.</strong>"
                     )                  ; rationale
          ))                             ;!
       )                                ;questions

      )                                 ;prob

     )                                  ;subproblems
    );'
  );define-problem
