;; round-table
(define-problem
  '(
    (type short-answer)
    (title "6.042 TEAL Table")
    (intro
     "<strong>A 6.042 problem-solving team has 8 students --Anna, Brian,
Caine,... --seated around a circular table.  Since there are screens all
around, it doesn't matter which way students face, so two seatings are
regarded as defining the same <em>arrangement</em> if each student has the
same student on their right in both seatings.  We'll be interested in
counting how many arrangements there are of these 8 students, given some
restrictions.</strong>"  )
    (box-width 6)
    (questions
     (! "<strong>As a start, in how different arrangements of these 8 students
around the table are there without any restrictions?</strong>"
        (answer "7!"  (options "" "6!" "7!" "8!" "2*7!" "8!/2")
  (rationale
       "<strong>There are 8! ways to seat the 8 around the table, but all the 8
cyclic shifts of a seating define the same arrangement, giving a total of
8!/8 = 7! seating arrangements.</strong>")))
     (! "<strong>How many arrangements of these 8 students are there with Anna
sitting next to Brian?"
        (answer "2*6!"
                (options "" "6!" "7!" "2*6!" "4*6!" "2*7!" )
                (rationale
     "<strong>Consider Anna and Brian to be 1 person, say AB.  Now, there are 6!
arrangements of these 7 people to seat around the table.  Now, break up AB
to be Anna and Brian --there are 2 ways to do this --Brian could be on
Anna's left or Brian could be on Anna's right, giving a total of 2*6!
seating arrangements.</strong>"
     )))
     (! "<strong>How many arrangements are there with if Brian sitting
next to both Anna AND Caine?</strong>"
        (answer "2*5!" (options "" "5!" "6!" "2*5!" "3*5!" "4*5!")
                (rationale
                 "<strong>Consider Anna, Brian and Caine to be 1 person, say ABC,
to ensure they are seated together.  Now, you have 6 people you want to
seat around a table.  There are 5! ways of doing this.  Now, break up ABC
so Brian is in between Anna and Caine; there are 2 ways to do this: Anna is
on Brian's left and Caine on his right or vice versa.  That gives 2*5!
seating arrangements.</strong>"
                 )))
     (! "<strong>How many arrangements are there with Brian sitting next to
Anna OR Caine?</strong>"
        (answer "22*5!" (options "" "5!" "6!" "4*5!" "22*5!" "11*6!")
                (rationale
     "<strong>The inclusion-exclusion principle and the previous parts can
be used to solve this question.  Number of arrangements with Brian sitting
next to Anna OR Caine is the number of arrangements with Brian next to Anna
(2*6!) plus number of arrangements with Brian next to Caine (2*6!) minus
number of arrangements with Brian next to both Anna AND Caine (2*5!).  That
gives us 2*6! + 2*6! - 2*5! = 4*6! - 2*5!  = (4*6)5! - 2*5!=
22*5!.</strong>"
            )));!
       );questions'
    );'
  );define-problem
