(define-problem 
  '(
    (type short-answer)
    (title "Birthday-Height")
    (intro "You may submit blank answers to the following questions if you
wish, but you must click \"Submit\" to get credit for this problem.  The
data is being collected for purposes to be revealed in lecture....")
    (box-width 10)
    (questions
     (! "What is your birthdate ?"
         (answer "no" "Jan" "Feb" "Mar" "Apr" "May" "Jun"
		   "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"
                 (box-width 2)
	  (options "no" "Jan" "Feb" "Mar" "Apr" "May" "Jun"
		   "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")) 
	 (answer "no" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"
		   "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		   "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31"
                 (box-width 2)
	  (options "no" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"
		   "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		   "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31"))
        "year:" (answer
                 "no" "1966" "1967" "1968" "1969" "1970"
                 "1971" "1972" "1973" "1974" "1975"
                 "1976" "1977" "1978" "1979" "1980"
                 "1981" "1982" "1983" "1984" "1985"
                 "1986" "1987" "1988" "1989" "1990" "1991" "1992" "1993"
                 (box-width 4)
                 (options "no" "1966" "1967" "1968" "1969" "1970"
                          "1971" "1972" "1973" "1974" "1975"
                          "1976" "1977" "1978" "1979" "1980"
                          "1981" "1982" "1983" "1984" "1985"
                          "1986" "1987" "1988" "1989" "1990" "1991" "1992" "1993")
                 ))
     (! "What is your height ?" 
        (answer "no" "2" "3" "4" "5" "6" "7" (box-width 2)
	  (options "no" "2" "3" "4" "5" "6" "7"))
        "feet"
        (answer
         "no" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"
         (box-width 2)
	  (options "no" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
        "inches");!
     );questions
    );'
  );define-problem
