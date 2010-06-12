;; well-founded.scm
(define-problem
  '(
    (type short-answer)
    (title "Well-founded Partial Orders")
    (intro "Which of the following are well-founded partial orders?
     <ol>

    <li>" (math "\\mathbb{N} \\times \\mathbb{Z}^+") " under
      coordinatewise partial order

    <li>" (math "\\mathbb{N} \\times \\mathbb{Z}^-") " under
      lexicographic order


    <li>" (math "[0,1,\\dots,j] \\times [-1,-2,\\dots, -k]") " under
          coordinatewise partial order, where "
         (math "j,k \\in \\mathbb{N}")

    "<li> a partially ordered set with no infinite <b>de</b>creasing
     sequence of elements

    <li> real numbers in the interval [1,2]

    <li> a partially ordered set with no infinite <b>in</b>creasing
    sequence of elements

    <li> <em>A</em><sup>*</sup> &#65293;where <em>A</em><sup>*</sup> is the set
    of all finite strings of letters of the Roman alphabet, ordered as they
    would be in a dictionary (this is not the same as lexicographic order)

    <li> <em>A</em><sup>*</sup> ordered in the reverse of dictionary order

    </ol>
")
    (questions
     (! "Answer with a sequence of integers separated by spaces, in any order, such as: 2 4 3<br>"
        (answer (1 3 4) (compare test-set)
	  (rationale "
<ol>

<li> is well-founded since each of the sets in the product are
well-founded partial (actually total) orders, and the product of
well-founded orders is well-founded

<li> {(0,-1),(0,-2),(0,-3),...} is a nonempty subset with no least element

<li> every finite partially ordered set is well-founded, so the product of
two finite sets is as well

<li> having no infinite decreasing sequence is equivalent to being
     well-founded, as shown in Notes 4.

<li> the numbers > 1 in the interval are a subset with no least element

<li> the negative integers have no infinite increasing sequence, but are
      not well-founded

<li> {b, ab, aab, aaab,...} is a set of strings with no element that would
    be listed first in dictionary order

<li> {a, aa, aaa, aaaa,...} is a set of strings with no element that would
     be listed last in dictionary order

</ol>")
     ))
     ) ;questions
    );
  );define-problem
