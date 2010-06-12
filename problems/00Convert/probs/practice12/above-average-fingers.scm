(define-problem
  '(
    (type short-answer)
    (title "Above Average Number of Fingers")

    (intro "<strong> There's a common wisecrack that 90% of drivers
consider themselves above average.  (A recent mention of this appears in
NY Times writer <a href =
\"http://pogue.blogs.nytimes.com/2010/04/29/text-blocking-apps-only-work-if-you-use-them/\">
David Pogue's blog, April 29, 2010</a>.)  This may sound absurd, but maybe
not: after all, the vast majority of people have an above average number
of fingers.  More than one of the following assertions explain this fact;
which ones?</p>

<p><ol>

    <li>Most people have a super secret extra bonus finger of which they are unaware.</li>

    <li>A pedantic minority don't count their thumbs as fingers, while the majority of people do.</li>

    <li>Polydactylism is rarer than amputation.</li>

    <li>When you add up the total number of fingers among the world's
population and then divide by the size of the population, you get a number
less than ten.</li>

<!--
    <li>Some people have webbed fingers which are considered a \"finger unit.\"</li>
-->

    <li>This follows from Markov's Theorem, since no one has a negative number of fingers.</li>

    <li>Missing fingers are much more common than extra ones.</li>

    <li>Missing fingers are at least slightly more common than extra ones.</li>

</ol></p>
</strong>")
;      (boxsize 5)
      (box-width 20)
;      (compare equal?)
      (questions
       (! "" (answer (3 6 7) (6 7) (compare test-set) 
               (rationale "<br>
<strong><p>1: We don't think so.</p>

<p>2: The eccentric opinions of pedants don't matter, since they won't
affect the way we count fingers.</p>

<p>3: This is a polysyllabic :-) way of saying that there are more people
with fewer than ten fingers than there are with greater than ten fingers,
which ought to pull the average number of figures at least a little below
ten.  Since the vast majority of people have ten fingers, they would all
have more than the average number of fingers, explaining the claim.</p>

<p>However, read literally, this statement is not quite strong enough, so
we also counted it as correct to omit it.  The reason is that even with
slightly more <em>people</em> with missing fingers than <em>people</em>
with extra fingers, the average number of fingers could be more than ten
if amputees were usually missing only one finger (which might be true),
while people with extra fingers usually had at least two extra
fingers (which is true).</p>

<p>What's needed is the stronger statement that the total number of extra
fingers in the world population is fewer than the total number of missing
fingers.  One reason this holds is that no one ever has more than four
extra fingers, and people with extra fingers are rarer than people missing
a hand.</p>

<p>4: This statement means that the average number of fingers is less than
ten, which is just a restatement of the claim using the obvious fact that
the vast majority of people have the usual ten fingers.  But restating the
claim does not explain why it is true.</p>

<!--
<p>: 5 could be part of an explanation for this claim if you assume that
this phenomenon plus amputations outnumbers extra fingers from birth.</p>
-->

<p>5: Markov's Theorem has no apparent relevance to the claim.  Markov's
Theorem simply states that the fraction of people who make up the
majority, multiplied by the above average number of fingers, namely 10,
cannot be greater than the average.  So if 99 percent of the world has 10
fingers, Markov's Theorem implies that the average number of fingers is at
least 9.9, which says nothing about how the average compares to
10.</p>

<p>6 & 7: As long as the total number of missing fingers in the population
is larger than the total number of extra ones &#65293;it it doesn't matter
<em>how much</em> larger &#65293;the average number of fingers will be less than ten.
</strong>")

               (compare test-set) ) )
       );questions
      (extro "<p><strong>Answer with a sequence of integers separated by
some spaces, for example, <center> 4 3 2 </center> Don't use commas or
periods.</strong></p>") ;extro 

      );'
  );define-problem
