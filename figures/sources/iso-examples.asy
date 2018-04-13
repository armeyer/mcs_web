void drawNode(string name, pair p) {
  path c = circle(p, .13);
  fill(c, white);
  draw(c);
  label("$" + name + "$", p);
}


pair a = (1,sqrt(3)), b = (.9, 1), c = (1.15, .4), d = (0,0), e = (2,0);

draw(a--d--e--a--b--c--d ^^ c--e);

drawNode("a", a);
drawNode("b", b);
drawNode("c", c);
drawNode("d", d);
drawNode("e", e);

pair textOff = (0, -.2);

label("Graph $G$", (d+e)/2 + textOff);


transform T = shift(3.5,0) * scale(sqrt(3));

pair p = T*(0,1), q = T*(1,1), r = T*(.7, .7), s = T*(0,0), t = T*(1,0);

draw(p--q--t--s--p--r--s ^^ r--t);

drawNode("p", p);
drawNode("q", q);
drawNode("r", r);
drawNode("s", s);
drawNode("t", t);

label("Graph $H$", (s+t)/2 + textOff);

size(5inch);
shipout(format="pdf");

