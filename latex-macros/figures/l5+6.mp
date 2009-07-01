%%
%% Figures for Lectures 5 and 6. To create the figure files, run
%%
%% mpost l5+6
%% mv l5+6.1 divide12.mps ; mv l5+6.2 divide12hasse.mps
%% mv l5+6.3 clothes.mps ; mv l5+6.4 clotheshasse.mps
%% mv l5+6.5 tinyrel.mps ; mv l5+6.6 tinyrel2.mps ; mv l5+6.7 tinyrel3.mps
%% mv l5+6.8 tinyrelref.mps ; mv l5+6.9 tinyrelsym.mps
%% mv l5+6.10 tinyreltrans.mps ; mv l5+6.11 0123abc.mps
%% mv l5+6.12 clothesparallel.mps
%%
%% The labels look a bit strange in xdvi, but they come out OK on paper
%% and in the PDF file.
%%

% Uncomment this if you want to check the figures with gv.
%prologues:=1;

input boxes

u := 1cm;

vardef cuta(suffix a,b) expr p =
  drawarrow p cutbefore bpath.a cutafter bpath.b;
  point .5*length p of p
enddef;

def hasse(suffix a,b) expr p =
  draw p cutbefore bpath.a cutafter bpath.b enddef;

def relation(suffix a,b) expr p =
  drawarrow p cutbefore bpath.a cutafter bpath.b enddef;

vardef self@# expr p =
  drawarrow cuta(@#,@#) @#.c{curl0}..tension 1.5..@#.c+p..tension 1.5..{curl0}@#.c
enddef;



%%
%% The digraph corresponding to the relation
%% "divides" on $Z_{12} \times Z_{12}$.
%%
beginfig(1)
  pickup pencircle scaled 0.5pt;
  circleit.q1("1");
  circleit.q2("2");
  circleit.q3("3");
  circleit.q4("4");
  circleit.q5("5");
  circleit.q6("6");
  circleit.q7("7");
  circleit.q8("8");
  circleit.q9("9");
  circleit.q10("10");
  circleit.q11("11");
  circleit.q12("12");

  ypart(q4.c - q12.c) = ypart(q2.c - q6.c) = ypart(q6.c - q3.c)
  = ypart(q8.c - q1.c) = ypart(q1.c - q9.c) = 0.5ypart(q10.c - q11.c)
  = ypart(q5.c - q7.c) = 2u;

  xpart(q2.c - q4.c) = xpart(q8.c - q2.c)
  = xpart(q10.c - q8.c) = xpart(q5.c - q10.c) = 2u;

  xpart(q4.c) = xpart(q12.c);
  xpart(q2.c) = xpart(q6.c) = xpart(q3.c);
  xpart(q8.c) = xpart(q1.c) = xpart(q9.c);
  xpart(q10.c) = xpart(q11.c);
  xpart(q5.c) = xpart(q7.c);

  ypart(q4.c) = ypart(q2.c) = ypart(q8.c) = ypart(q10.c);
  ypart(q5.c) = ypart(0.5[q1.c,q8.c]);
  
  q1.c = (10u,10u);
  
  drawboxed(q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12);

  % 1 divides everything.
  relation(q1,q2) q1.c..q2.c;
  relation(q1,q3) q1.c..q3.c;
  relation(q1,q4) q1.c..0.5[q2.c,q6.c]..q4.c;
  relation(q1,q5) q1.c..0.25[q10.c,q11.c]..q5.c;
  relation(q1,q6) q1.c..q6.c;
  relation(q1,q7) q1.c..0.75[q10.c,q11.c]..q7.c;
  relation(q1,q8) q1.c..q8.c;
  relation(q1,q9) q1.c..q9.c;
  relation(q1,q10) q1.c..q10.c;
  relation(q1,q11) q1.c..q11.c;
  relation(q1,q12) q1.c{dir210}..q12.c;

  % 2 divides all even numbers
  relation(q2,q4) q2.c..q4.c;
  relation(q2,q6) q2.c..q6.c;
  relation(q2,q8) q2.c..q8.c;
  relation(q2,q10) q2.c..1.5[q1.c,q8.c]..q10.c;
  relation(q2,q12) q2.c..q12.c;
  
  % 3
  relation(q3,q6) q3.c..q6.c;
  relation(q3,q9) q3.c..q9.c;

  % 4
  relation(q4,q8) q4.c..1.5[q6.c,q2.c]..q8.c;
  relation(q4,q12) q4.c..q12.c;

  % 5
  relation(q5,q10) q5.c..q10.c;

  % 6
  relation(q6,q12) q6.c..q12.c;

  % All numbers divide themselves.
  self.q1(u,0);
  self.q2(0.7(-u,u));
  self.q3(-u,0);
  self.q4(-u,0);
  self.q5(0,-u);
  self.q6(0.7(-u,u));
  self.q7(0,-u);
  self.q8(u,0);
  self.q9(u,0);
  self.q10(0.7(u,u));
  self.q11(u,0);
  self.q12(-u,0);
endfig;



%%
%% The Hasse diagram corresponding to the relation
%% "divides" on $Z_{12} \times Z_{12}$.
%%
beginfig(2)
  pickup pencircle scaled 0.5pt;
  circleit.q1("1");
  circleit.q2("2");
  circleit.q3("3");
  circleit.q4("4");
  circleit.q5("5");
  circleit.q6("6");
  circleit.q7("7");
  circleit.q8("8");
  circleit.q9("9");
  circleit.q10("10");
  circleit.q11("11");
  circleit.q12("12");

  ypart(q2.c) = ypart(q3.c) = ypart(q5.c) = ypart(q7.c) = ypart(q11.c);
  ypart(q4.c) = ypart(q6.c) = ypart(q9.c) = ypart(q10.c);
  ypart(q8.c) = ypart(q12.c);

  xpart(q2.c) = xpart(q4.c) = xpart(q8.c);
  xpart(q1.c) = xpart(q3.c) = xpart(q6.c) = xpart(q12.c);
  xpart(q5.c) = xpart(q10.c);
  xpart(q7.c) = xpart(q9.c);

  ypart(q1.c - q2.c) = ypart(q2.c - q4.c) = ypart(q4.c - q8.c) = -u;
  
  xpart(q2.c - q5.c) = xpart(q3.c - q2.c) = xpart(q7.c - q3.c)
  = xpart(q11.c - q7.c) = u;

  q1.c = (10u,10u);
  
  drawboxed(q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12);

  hasse(q1,q2) q1.c..q2.c;
  hasse(q1,q3) q1.c..q3.c;
  hasse(q1,q5) q1.c..q5.c;
  hasse(q1,q7) q1.c..q7.c;
  hasse(q1,q11) q1.c..q11.c;
  hasse(q2,q4) q2.c..q4.c;
  hasse(q2,q6) q2.c..q6.c;
  hasse(q2,q10) q2.c..q10.c;
  hasse(q3,q6) q3.c..q6.c;
  hasse(q3,q9) q3.c..q9.c;
  hasse(q4,q8) q4.c..q8.c;
  hasse(q4,q12) q4.c..q12.c;
  hasse(q5,q10) q5.c..q10.c;
  hasse(q6,q12) q6.c..q12.c;
endfig;



%%
%% A DAG describing precedence constraints for the
%% process "getting dressed in the morning".
%%
beginfig(3)
  pickup pencircle scaled 0.5pt;
  boxit.Lsock(btex left sock etex);
  boxit.Rsock(btex right sock etex);
  boxit.Lshoe(btex left shoe etex);
  boxit.Rshoe(btex right shoe etex);
  boxit.belt(btex belt etex);
  boxit.pants(btex pants etex);
  boxit.underwear(btex underwear etex);
  boxit.shirt(btex shirt etex);
  boxit.sweater(btex sweater etex);
  boxit.jacket(btex jacket etex);
  
  xpart(Lsock.c) = xpart(Lshoe.c);
  xpart(Rsock.c) = xpart(Rshoe.c);
  xpart(underwear.c) = xpart(pants.c) = xpart(belt.c);
  xpart(shirt.c) = xpart(sweater.c) = xpart(jacket.c);

  ypart(Lshoe.c) = ypart(Rshoe.c) = ypart(belt.c) = ypart(jacket.c);
  ypart(Lsock.c) = ypart(Rsock.c) = ypart(pants.c) = ypart(sweater.c);
  ypart(underwear.c) = ypart(shirt.c);

  xpart(Rshoe.c - Lshoe.c) = xpart(belt.c - Rshoe.c)
  = xpart(jacket.c - belt.c) = 3u;
  ypart(underwear.c - pants.c) = ypart(pants.c - belt.c) = -2u;

  underwear.c = (10u,10u);
  
  drawboxed(Lsock, Rsock, Lshoe, Rshoe, belt, pants, underwear,
    shirt, sweater, jacket);

  relation(Lsock, Lshoe) Lsock.c..Lshoe.c;
  relation(Rsock, Rshoe) Rsock.c..Rshoe.c;
  relation(underwear, pants) underwear.c..pants.c;
  relation(pants, belt) pants.c..belt.c;
  relation(shirt, sweater) shirt.c..sweater.c;
  relation(sweater, jacket) sweater.c..jacket.c;
  relation(pants, Lshoe) pants.c..Lshoe.c;
  relation(pants, Rshoe) pants.c..Rshoe.c;
  relation(pants, jacket) pants.c..jacket.c;
  relation(belt, jacket) belt.c..jacket.c;
endfig;



%%
%% A Hasse diagram describing precedence constraints for the
%% process "getting dressed in the morning".
%%
beginfig(4)
  pickup pencircle scaled 0.5pt;
  boxit.Lsock(btex left sock etex);
  boxit.Rsock(btex right sock etex);
  boxit.Lshoe(btex left shoe etex);
  boxit.Rshoe(btex right shoe etex);
  boxit.belt(btex belt etex);
  boxit.pants(btex pants etex);
  boxit.underwear(btex underwear etex);
  boxit.shirt(btex shirt etex);
  boxit.sweater(btex sweater etex);
  boxit.jacket(btex jacket etex);
  
  xpart(Lsock.c) = xpart(Lshoe.c);
  xpart(Rsock.c) = xpart(Rshoe.c);
  xpart(underwear.c) = xpart(pants.c) = xpart(belt.c);
  xpart(shirt.c) = xpart(sweater.c) = xpart(jacket.c);

  ypart(Lshoe.c) = ypart(Rshoe.c) = ypart(jacket.c);
  ypart(Lshoe.c) + ypart(Lsock.c) = 2ypart(belt.c);
  ypart(Lsock.c) = ypart(Rsock.c) = ypart(pants.c) = ypart(sweater.c);
  ypart(underwear.c) = ypart(shirt.c);

  xpart(Rshoe.c - Lshoe.c) = xpart(belt.c - Rshoe.c)
  = xpart(jacket.c - belt.c) = 2u;
  ypart(underwear.c - pants.c) = ypart(pants.c - belt.c) = -u;

  underwear.c = (10u,10u);
  
  drawboxed(Lsock, Rsock, Lshoe, Rshoe, belt, pants, underwear,
    shirt, sweater, jacket);

  hasse(Lsock, Lshoe) Lsock.c..Lshoe.c;
  hasse(Rsock, Rshoe) Rsock.c..Rshoe.c;
  hasse(underwear, pants) underwear.c..pants.c;
  hasse(pants, belt) pants.c..belt.c;
  hasse(shirt, sweater) shirt.c..sweater.c;
  hasse(sweater, jacket) sweater.c..jacket.c;
  hasse(pants, Lshoe) pants.c..Lshoe.c;
  hasse(pants, Rshoe) pants.c..Rshoe.c;
  hasse(belt, jacket) belt.c..jacket.c;
endfig;



%%
%% A tiny relation.
%%
beginfig(5)
  circleit.q1(btex $a$ etex);
  circleit.q2(btex $b$ etex);
  circleit.q3(btex $c$ etex);
  circleit.q4(btex $d$ etex);
  circleit.q5(btex $e$ etex);

  q1.c = (5u,5u);
  q2.c = (5u,7u);
  q3.c = (7u,5u);
  q4.c = (7u,7u);
  q5.c = (9u,6u);

  drawboxed(q1, q2, q3, q4, q5);
  
  relation(q1,q2) q1.c..q2.c;
  relation(q1,q3) q1.c..q3.c;
  relation(q2,q4) q2.c..q4.c;
  relation(q4,q5) q4.c..q5.c;
endfig;



%%
%% The square of the tiny relation.
%%
beginfig(6)
  circleit.q1(btex $a$ etex);
  circleit.q2(btex $b$ etex);
  circleit.q3(btex $c$ etex);
  circleit.q4(btex $d$ etex);
  circleit.q5(btex $e$ etex);

  q1.c = (5u,5u);
  q2.c = (5u,7u);
  q3.c = (7u,5u);
  q4.c = (7u,7u);
  q5.c = (9u,6u);

  drawboxed(q1, q2, q3, q4, q5);
  
  relation(q1,q4) q1.c..q4.c;
  relation(q2,q5) q2.c..0.5[q3.c,q4.c]..q5.c;
endfig;



%%
%% The cube of the tiny relation.
%%
beginfig(7)
  circleit.q1(btex $a$ etex);
  circleit.q2(btex $b$ etex);
  circleit.q3(btex $c$ etex);
  circleit.q4(btex $d$ etex);
  circleit.q5(btex $e$ etex);

  q1.c = (5u,5u);
  q2.c = (5u,7u);
  q3.c = (7u,5u);
  q4.c = (7u,7u);
  q5.c = (9u,6u);

  drawboxed(q1, q2, q3, q4, q5);
  
  relation(q1,q5) q1.c..0.5[q3.c,q4.c]..q5.c;
endfig;




%%
%% The reflexive closure of the tiny relation.
%%
beginfig(8)
  circleit.q1(btex $a$ etex);
  circleit.q2(btex $b$ etex);
  circleit.q3(btex $c$ etex);
  circleit.q4(btex $d$ etex);
  circleit.q5(btex $e$ etex);

  q1.c = (5u,5u);
  q2.c = (5u,7u);
  q3.c = (7u,5u);
  q4.c = (7u,7u);
  q5.c = (9u,6u);

  drawboxed(q1, q2, q3, q4, q5);
  
  relation(q1,q2) q1.c..q2.c;
  relation(q1,q3) q1.c..q3.c;
  relation(q2,q4) q2.c..q4.c;
  relation(q4,q5) q4.c..q5.c;
  self.q1(-u,0);
  self.q2(-u,0);
  self.q3(u,0);
  self.q4(0,-u);
  self.q5(u,0);
endfig;



%%
%% The symmetric closure of the tiny relation.
%%
beginfig(9)
  circleit.q1(btex $a$ etex);
  circleit.q2(btex $b$ etex);
  circleit.q3(btex $c$ etex);
  circleit.q4(btex $d$ etex);
  circleit.q5(btex $e$ etex);

  q1.c = (5u,5u);
  q2.c = (5u,7u);
  q3.c = (7u,5u);
  q4.c = (7u,7u);
  q5.c = (9u,6u);

  drawboxed(q1, q2, q3, q4, q5);
  
  relation(q1,q2) q1.c{dir120}..q2.c;
  relation(q1,q3) q1.c{dir30}..q3.c;
  relation(q2,q4) q2.c{dir30}..q4.c;
  relation(q4,q5) q4.c{dir0}..q5.c;

  relation(q2,q1) q2.c{dir300}..q1.c;
  relation(q3,q1) q3.c{dir210}..q1.c;
  relation(q4,q2) q4.c{dir210}..q2.c;
  relation(q5,q4) q5.c{dir180}..q4.c;
endfig;



%%
%% The transitive closure of the tiny relation.
%%
beginfig(10)
  circleit.q1(btex $a$ etex);
  circleit.q2(btex $b$ etex);
  circleit.q3(btex $c$ etex);
  circleit.q4(btex $d$ etex);
  circleit.q5(btex $e$ etex);

  q1.c = (5u,5u);
  q2.c = (5u,7u);
  q3.c = (7u,5u);
  q4.c = (7u,7u);
  q5.c = (9u,6u);

  drawboxed(q1, q2, q3, q4, q5);
  
  relation(q1,q2) q1.c..q2.c;
  relation(q1,q3) q1.c..q3.c;
  relation(q2,q4) q2.c..q4.c;
  relation(q4,q5) q4.c..q5.c;
  relation(q1,q4) q1.c..q4.c;
  relation(q2,q5) q2.c..1.5[q3.c,q4.c]..q5.c;
  relation(q1,q5) q1.c..q5.c;
endfig;



%%
%% The digraph for a relation on {0,1,2,3}×{a,b,c}
%%
beginfig(11)
  pickup pencircle scaled 0.5pt;
  circleit.q0("0");
  circleit.q1("1");
  circleit.q2("2");
  circleit.q3("3");
  circleit.qa(btex $a$ etex);
  circleit.qb(btex $b$ etex);
  circleit.qc(btex $c$ etex);

  q0.c = (10u,10u);

  xpart(q0.c) = xpart(q1.c) = xpart(q2.c) = xpart(q3.c);
  xpart(qa.c) = xpart(qb.c) = xpart(qc.c);
  
  ypart(q0.c-q1.c) = ypart(q1.c-q2.c) = ypart(q2.c-q3.c) = u;
  ypart(qa.c-qb.c) = ypart(qb.c-qc.c) = u;

  xpart(q0.c) + 3u = xpart(qa.c);
  ypart(q0.c+q3.c) = ypart(qa.c+qc.c);
  
  drawboxed(q0,q1,q2,q3,qa,qb,qc);

  relation(q0,qa) q0.c..qa.c;
  relation(q0,qc) q0.c..qc.c;
  relation(q1,qa) q1.c..qa.c;
  relation(q1,qc) q1.c..qc.c;
  relation(q2,qb) q2.c..qb.c;
endfig;



%%
%% A parallel sceduling of the
%% process "getting dressed in the morning".
%%
beginfig(12)
  pickup pencircle scaled 0.5pt;
  boxit.Lsock(btex left sock etex);
  boxit.Rsock(btex right sock etex);
  boxit.Lshoe(btex left shoe etex);
  boxit.Rshoe(btex right shoe etex);
  boxit.belt(btex belt etex);
  boxit.pants(btex pants etex);
  boxit.underwear(btex underwear etex);
  boxit.shirt(btex shirt etex);
  boxit.sweater(btex sweater etex);
  boxit.jacket(btex jacket etex);
  
  xpart(Lsock.c) = xpart(Lshoe.c);
  xpart(Rsock.c) = xpart(Rshoe.c);
  xpart(underwear.c) = xpart(pants.c) = xpart(belt.c);
  xpart(shirt.c) = xpart(sweater.c) = xpart(jacket.c);

  ypart(Lshoe.c) = ypart(Rshoe.c) = ypart(belt.c);
  ypart(Lsock.c) = ypart(Rsock.c) = ypart(underwear.c) = ypart(shirt.c);
  ypart(pants.c) = ypart(sweater.c);

  xpart(Rshoe.c - Lshoe.c) = xpart(belt.c - Rshoe.c)
  = xpart(jacket.c - belt.c) = 2u;
  ypart(underwear.c - pants.c) = ypart(pants.c - belt.c)
  = ypart(belt.c - jacket.c) = -u;

  underwear.c = (10u,10u);
  
  drawboxed(Lsock, Rsock, Lshoe, Rshoe, belt, pants, underwear,
    shirt, sweater, jacket);

  hasse(Lsock, Lshoe) Lsock.c..Lshoe.c;
  hasse(Rsock, Rshoe) Rsock.c..Rshoe.c;
  hasse(underwear, pants) underwear.c..pants.c;
  hasse(pants, belt) pants.c..belt.c;
  hasse(shirt, sweater) shirt.c..sweater.c;
  hasse(sweater, jacket) sweater.c..jacket.c;
  hasse(pants, Lshoe) pants.c..Lshoe.s;
  hasse(pants, Rshoe) pants.c..Rshoe.s;
  hasse(belt, jacket) belt.c..jacket.c;

  xmax = xpart(sweater.e + 2u * right);
  xmin = xpart(Lshoe.w + 2u * left);
  draw ((xmin,0)--(xmax,0))
    shifted (0,ypart(0.5[underwear.c,pants.c])) dashed evenly;
  draw ((xmin,0)--(xmax,0))
    shifted (0,ypart(0.5[pants.c,belt.c])) dashed evenly;
  draw ((xmin,0)--(xmax,0))
    shifted (0,ypart(0.5[belt.c,jacket.c])) dashed evenly;
  label.rt(btex $A_1$ etex, (xmin,ypart(underwear.c)));
  label.rt(btex $A_2$ etex, (xmin,ypart(pants.c)));
  label.rt(btex $A_3$ etex, (xmin,ypart(belt.c)));
  label.rt(btex $A_4$ etex, (xmin,ypart(jacket.c)));
endfig;



end;
