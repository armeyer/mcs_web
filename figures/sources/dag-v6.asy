int ww = 2, hh = 1;

pair a = (0,0), b = (ww,0), c = (2*ww,0),
d = (0, hh), e = (ww, hh), f = (2*ww, hh),
g = (ww, 2*hh),
h = (ww/2, 3*hh), i = (3*ww/2, 3*hh),
j = (ww/2, 4*hh);

real rad = .2;

void makeArrow(pair p, pair q)
{
  pair u = unit(q-p);
  draw(p + rad*u -- q - rad*u, Arrow);
}

void makeNode(pair p, int lab)
{
  draw(circle(p, rad));
  label("$" + string(lab) + "$", p);
}

makeArrow(j,h);
makeArrow(h,g);
makeArrow(i,g);
makeArrow(g,d);
makeArrow(g,e);
makeArrow(g,f);
makeArrow(d,a);
makeArrow(d,b);
makeArrow(e,a);
makeArrow(e,b);
makeArrow(e,c);
makeArrow(f,c);

makeNode(a,10);
makeNode(b,3);
makeNode(c,7);
makeNode(d,1);
makeNode(e,2);
makeNode(f,9);
makeNode(g,4);
makeNode(h,6);
makeNode(i,5);
makeNode(j,8);

size(2inch);
shipout(format="pdf");
