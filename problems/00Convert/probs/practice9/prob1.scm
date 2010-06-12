;; problem 1
(define-problem
  '(
    (type short-answer)
    (title "Counting Poker Hands")
    (intro "Indicate how many 5-card hands there are of each of the following
     kinds.  We use notation C(<em>n,k</em>) for " (math "{n \\choose k") ",
     and P(<em>n,k</em>) for " (math "\\frac{n!}{(n-k)!}")"."
           )
    (box-width 6)
    (questions
     (! "A <b>Sequence</b> is a hand consisting of five consecutive cards
         of any suit, such as
<center>
        <font color = red>5&hearts;</font>-<font color = red>6&hearts;</font>-7&spades;-<font color = red>8&diams;</font>-9&clubs;.
</center>
        Note that an Ace may either be high (as in 10-J-Q-K-A), or low (as in A-2-3-4-5),
        but can't go `around the corner' (that is, Q-K-A-2-3 is <i>not</i> a sequence).
        <br> Choose the correct expression for the number
             of possible <b>Sequence</b> hands. <br>"
        (answer "10*4^5"  (options "" "10*4^5" "4*5*10" "4*10^5" "13*4^5")  (rationale
       "There are 10 possible choices for the lowest card which determines
        uniquely the sequence of ranks, and 4 choices for the suit of
        <em>each</em> card, <br>
        so that we have 10*4<sup>5</sup> = 10240 possible
        <b>Sequence</b> hands.")))
     (! "A <b>Matching Suit</b> is a hand consisting of cards that are all of the
     same suit in any order. <br> Choose the correct expression for number of
     possible <b>Matching Suit</b> hands. <br>"
        (answer "4*C(13,5)"
                (options "" "4*P(13,5)" "4*C(13,5)" "52*C(12,4)" "52*P(12,4)")
                (rationale
     "There are 4 possible choices for the suit, and C(13,5) for the set of 5
     ranks within the 13 in the suit, <br>
     so that we have 4*C(13,5) = 5148 possible <b>Matching Suit</b> hands."
     )))
     (! "A <b>Straight Flush</b> is a hand that is both a <i>Sequence</i> and
        a <i>Matching Suit</i>. <br>
        Choose the correct expression for the number of possible
        <b>Straight Flush</b> hands. <br>"
        (answer "4*10" (options "" "52" "4*C(13,5)" "4*10^5" "4*10") (rationale
     "There are 4 possible choices for the suit, and 10 for the lowest card
     which determines uniquely the sequence of ranks,
     <br> so that we have 4*10 = 40 possible <b>Straight Flush</b> hands."
     )))
     (! "A <b>Straight</b> is a hand that is a <i>Sequence</i> but not 
        a <i>Matching Suit</i>. <br>
        How many possible <b>Straights</b> are there? 
         <br>Enter your answer as a single integer without commas, such as `10001' <br>"
        (answer 10200 (rationale
                       "This is <i>exactly</i> the number of <i>Sequence</i> hands
                       that are not <i>Straight Flush</i> hands, <br>
                       so that we have 10240 - 40 = 10200 possible <b>Straights</b>."
                       )))
     (! "A <b>Flush</b> is a hand that is a <i>Matching Suit</i> but not
        a <i>Sequence</i>. <br>
        How many possible <b>Flushes</b> are there? 
         <br>Enter your answer as a single integer without commas, such as `10001' <br>"
        (answer 5108 (rationale
                      "This is <i>exactly</i> the number of <i>Matching Suit</i> hands
                      that are not <i>Straight Flush</i> hands, <br>
                      so that we have 5148 - 40 = 5108 possible <b>Flushes</b>."
                      )))
     );questions
    );'
  );define-problem
