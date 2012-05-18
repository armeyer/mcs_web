(+

(* 1/6 5/6 5/6)     ;sole winner       payoff: 4

(* 1/6 2 1/6 5/6)   ;1 of 2 winners3   payoff: 1

(* 1/6 1/6 1/6)     ;3 winners         payoff: 0

(* 5/6 5/6 5/6)     ;0 winners         payoff: 0

(* 5/6 (+ (* 1/6 5/6 2) (* 1/6 1/6)))  payoff: -2
                    ;at least 1 other winner

)