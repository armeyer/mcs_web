;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Stable Marriage Invariants")
    (intro "")
    (questions
     (! "We are interested in invariants of the Mating Ritual described in
the Notes for finding stable marriages when there are an equal number of
boys and girls.  Let Angelina and Jen be two of the girls, and Keith and
Tom be two of the boys.

<p>Which of the following predicates are invariants of the Mating Ritual
no matter what the preferences are among the boys and girls?  (Remember
that a predicate that is always false is an invariant &#65293;check the
definition of invariant to see why.)

<p>Express your answer as a sequence of digits (in any order) separated by
spaces, for example,

<center> <tt>1 3 2</tt> </center>

<ol>

<li> Angelina is crossed off Tom's list and she has a suitor that
she prefers to Tom.

<li> Tom is serenading Jen.

<li> Tom is not serenading Jen.

<li> Tom's list of girls to serenade is empty.

<li> All the boys have the same number of girls left uncrossed in their list.

<li> Jen is crossed off Keith's list and Keith prefers Jen to anyone he is
serenading.

<li> Jen is the only girl on Keith's list.

<li> Jen is crossed off Keith's list, and there is no set of stable
marriages &#65293;not just the set produced by the Mating
Ritual &#65293;in which Jen is married to Keith.

</ol>"
        (answer (1 4 6 7 8) (compare test-set)
	  (rationale "<ol>

<li> Invariant: This is the basic invariant used to verify the Ritual.

<li> Not invariant: If Tom serenades Jen and gets rejected by her,
he will stop serenading her.

<li> Not invariant: Tom might serenade Angelina, get rejected by
her, and then serenade Jen next.

<li> Invariant: No girl will ever get added to Tom's list, so once his
list is empty, it stays empty.  This implies that Tom's list will never be empty, since the Ritual guarantees he will be married in the end.  That is, this predicate is an
invariant because it is always false.  But it would still be an invariant even 
if we ran the Mating Ritual with more boys than girls, in which case
Tom's list might become empty, but then would stay that way.

<li> Not invariant: Suppose all the boys like Angelina best.  The she will
reject all but her favorite, say it's Tom, on the first day. Now, on the
second day, Tom's list will be one longer than all the other boys' lists.

<li> Invariant: Keith crosses off the girls he most prefers, so if Jen is
crossed off, Keith likes her better than anybody that's left.

<li> Invariant: No girls get added to a list, so if Jen is the only girl
on Keith's list, she must be the girl he marries at the end.

<li> Invariant: If Jen is crossed off Keith's list, then, since her
suitors only become more desirable, she will wind up with a husband she
prefers to Keith.  But the Mating Ritual yields girl-pessimal marriages,
so in <em>every</em> stable set of marriages, Jen will wind up with
someone she prefers to Keith, and so will never be interested in having
him as a rogue partner.

</ol>
")))
) ;questions
    );
  );define-problem
