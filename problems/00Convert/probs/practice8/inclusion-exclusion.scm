(define-problem
    '(
      (type short-answer)
      (title "Inclusion-Exclusion")
      (intro "Let <em>A</em><sub>1</sub>, <em>A</em><sub>2</sub>, <em>A</em><sub>3</sub> be sets 
             with |<em>A</em><sub>1</sub>| = 100, |<em>A</em><sub>2</sub>| = 1,000, |<em>A</em><sub>3</sub>| = 10,000. <br>
             Determine |<em>A</em><sub>1</sub>&cup;<em>A</em><sub>2</sub>&cup;<em>A</em><sub>3</sub>| 
             in each of the following cases. <br>
             If there is insufficient data to determine the answer, 
             write <b>nd</b> for <b>n</b>ot <b>d</b>etermined. <p>
             Type in your answers as numbers <i>without</i> commas.") 
      (box-width 5)
      (questions
       (! "<em>A</em><sub>1</sub> &sube; <em>A</em><sub>2</sub> &sube; <em>A</em><sub>3</sub>."
          (answer 10000 (rationale "Since all the elements of A<sub>1</sub> are in <em>A</em><sub>2</sub> and all elements in <em>A</em><sub>2</sub> are in <em>A</em><sub>3</sub>, the only elements in their union are the elements of <em>A</em><sub>3</sub>.  Therefore, the size of the union is simply the size of <em>A</em><sub>3</sub>.")))
       (! "The sets are pairwise disjoint."
          (answer 11100 (rationale "Since the sets are pairwise disjoint (i.e. <em>A</em><sub>1</sub> shares no elements with <em>A</em><sub>2</sub> or <em>A</em><sub>3</sub> and <em>A</em><sub>2</sub> shares no elements with <em>A</em><sub>3</sub>), the Sum Rule implies that the size of the union is the sum of the sizes of the individual sets.")))

       (! "For any two of the sets, there is exactly one element in both."
          (answer "nd" "ND" "Nd"
                  (rationale "The number depends on whether the element is common to all three, and so we cannot determine the answer from the information given.  From the viewpoint of the inclusion-exclusion formula, we don't know if the value of |<em>A</em><sub>1</sub>&cap;<em>A</em><sub>2</sub>&cap;<em>A</em><sub>3</sub>| is 0 or 1")))
       
       (! "There are two elements common to each pair of sets and one
element in all three sets."
          (answer 11095 (rationale "To solve this, we apply the inclusion-exclusion formula:  |<em>A</em><sub>1</sub>&cup;<em>A</em><sub>2</sub>&cup;<em>A</em><sub>3</sub>| = |<em>A</em><sub>1</sub>|+|<em>A</em><sub>2</sub>|+|<em>A</em><sub>3</sub>|-|<em>A</em><sub>1</sub>&cap;<em>A</em><sub>2</sub>|-|<em>A</em><sub>1</sub>&cap;<em>A</em><sub>3</sub>|-|<em>A</em><sub>2</sub>&cap;<em>A</em><sub>3</sub>|+|<em>A</em><sub>1</sub>&cap;<em>A</em><sub>2</sub>&cap;<em>A</em><sub>3</sub>| = 100+1000+10000-2-2-2+1 = 11095.")))
       );questions
      );'
);define-problem
