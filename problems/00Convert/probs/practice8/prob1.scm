(define-problem
    '(
      (type short-answer)
      (title "Pigeonhole Principle")
      (intro "Below is a list of properties that a group of people
              might possess.  <p> 
              For each property, either give the minimum number of people 
              that must be in a group to ensure that the property holds,
              or else write <b>nh</b> to indicate that the property need 
              <b>n</b>ot <b>h</b>old even for arbitrarily large groups of 
              people.  <p> 
              (Assume that every year has exactly 365 days; ignore leap years.)")
      (box-width 5)
      (questions
       (! "At least 2 people were born on the same day of the year (ignore year of birth). <br>"
          (answer 366 (rationale 
"We let the pigeons be people and the days of the year be the holes
(365 holes).  If we have 365+1 pigeons, two must be in the same hole (i.e. the two 
must be born on the same day).")))
       (! "At least 2 people were born on January 1. <br>"
          (answer "nh" "NH" "Nh" (rationale 
"No matter how many people you have, you cannot force one of them to
be born on a specific day.  For example, everyone might be born on
January 2." )))
       (! "At least 3 people were born on the same day of the week. <br>"
          (answer 15 (rationale  
"We let people be pigeons and the days on the week be holes (7 holes). Using 
the generalized pigeonhole principle, we need 2*7+1 people to force 3 of them 
to be in the same hole (i.e. born on the same day of the week)." )))
       (! "At least 4 people were born in the same month. <br>"
          (answer 37 (rationale 
"We let the people be the pigeons and the months of the year be the
holes (12 holes).  Using the generalized pigeonhole principle, we need
3*12+1 people to force 4 of them to be born in the same month."
          )))
       (! "At least 2 people were born exactly one week apart. <br>"
          (answer "nh" "NH" "Nh"
                  (rationale 
"Again, you cannot force this.  For example, everyone might be born on
the same day of the year."
                 )))  
)))
