path[] figureEight(pair p, pair q) {
  real r = length(p-q)/2;
  return circle(p,r) ^^ circle(q,r);
}

pair a=(0,0), b = (2,1), c = (.1,2), d = (-1.2,2.3);
real r1 = length(a-b)/2, r2 = length(c-d)/2;

pen p1 = red, p2 = blue;

draw(figureEight(a,b), p1);
draw(figureEight(c,d), p2);

label("$E$", (a+b)/2, unit(a-b), p1);
label("$E'$", (c+d)/2, unit(c-d), p2);



pair t = (-5,0);
pair a=(0,0)+t, b = (-1,2)+t, c = (.1,.3)+t, d = (-.5,.1)+t;

draw(figureEight(a,b), p1);
draw(figureEight(c,d), p2);

label("$E$", (a+b)/2, -unit(a-b), p1);
label("$E'$", (c+d)/2, unit(c-d), p2);

size(4inch);
shipout(format="pdf");
