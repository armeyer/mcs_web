pair[] pts = new pair[12];
for(int i = 0; i < 6; ++i) {
  pts[i] = dir(60*i);
  pts[i+6] = 2*dir(60*i);
}

for(int i = 0; i < 6; ++i) {
  draw(pts[i] -- pts[(i+2)%6]);
  draw(pts[i+6] -- pts[(i+1)%6 + 6]);
  draw(pts[i] -- pts[i+6]);
}

for(int i = 0; i < 12; ++i) {
  path c = circle(pts[i], .15);
  fill(c, white);
  draw(c);
  label("$" + string(i+1) + "$", pts[i]);
}


size(3inch);
shipout(format="pdf");

