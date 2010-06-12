;; problem 2
(define-problem
  '(
    (type short-answer)
    (title "Magic !!!  (Do this after the Magic Trick lecture.)")
    (intro

     "Consider the magical card trick from Lecture and this week's Notes.
      <br> Using the following order of the 52 cards:
      <br> A&clubs; &lt; 2&clubs; &lt;
                &middot;&middot;&middot; &lt;  Q&clubs; &lt;  K&clubs; &lt;
    <font color = red>A&diams;</font> &lt; <font color = red>2&diams;</font> &lt;
      &middot;&middot;&middot; &lt; <font color = red>K&diams;</font> &lt;
<font color = red>A&hearts;</font> &lt;  &middot;&middot;&middot; &lt;
          <font color = red>K&hearts;</font> &lt;
           A&spades; &lt; &middot;&middot;&middot; &lt; Q&spades; &lt;  K&spades;,
      <br> see if you are capable of being:")

    (box-width 12)
    (questions
     (! "<font color = green size = +1>The assistant.</font> <br>
        The public has drawn the following cards:
        <font color = red>K&hearts;</font>, 
        7&clubs;, 
        <font color = red>8&hearts;</font>, 
        <font color = red>J&diams;</font>, 
        7&spades;. 
        <br>
        What four-card sequence should you announce to the magician? <br>
        You should enter the result in the format <em>AS-10C-7D-3H</em>
        <br> where <i>AS</i> denotes A&spades;, the Ace of Spades,
          <i>10C</i> denotes 10&clubs;, the 10 of Clubs, etc.<br>"
        (answer (box-width 12) "8H-7S-7C-JD"))
     (! "<font color = green size = +1>The magician</font>. <br>
        The assistant announced the following cards to you: 
        Q&clubs;, 
        <font color = red>A&diams;</font>,
        6&spades;, 
        <font color = red>5&diams;</font>.
        <br> 
        What is the secret card?
        (You should enter the result in form <em>KS</em>
        for K&spades;, etc.) <br>"
        (answer (box-width 3) "AC"))
     );questions
    );'
  );define-problem
