pair[] pts = new pair[12];
for(int i = 0; i < 3; ++i) {
  real th = -90;
  pts[i] = .8*dir(120*i + th);
  pts[i+3] = 1.9*dir(120*i + th);
  pts[i+6] = 2.5*dir(60 + 120*i + th);
  pts[i+9] = 5*dir(60 + 120*i + th);
}

for(int i = 0; i < 3; ++i) {
  int j = (i+1)%3;
  int k = (i+2)%3;
  draw(pts[i]--pts[j]);
  draw(pts[i]--pts[i+3]);
  draw(pts[i+3]--pts[i+6]);
  draw(pts[i+3]--pts[k+6]);
  draw(pts[i+6]--pts[i+9]);
  draw(pts[i+9]--pts[j+9]);
}

for(int i = 0; i < 12; ++i) {
  path c = circle(pts[i], .28);
  fill(c, white);
  draw(c);
  label("$" + string(i+1) + "$", pts[i]);
}

size(3inch);
shipout(format="pdf");

