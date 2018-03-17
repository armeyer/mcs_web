real y1 = 2, y2 = 0;

pair p1 = (1,y1), p2 = (2,y1), p3 = (3,y1), p4 = (4,y1), p5 = (5,y1), p6 = (6,y1), p7 = (7,y1);
pair p8 = (1,y2), p9 = (2,y2), p10 = (3,y2), p11 = (4,y2), p12 = (5,y2), p13 = (6,y2), p14 = (7,y2);

real rad = .2;
void makeNode(pair p, int lab)
{
  draw(circle(p, rad));
  label("$" + string(lab) + "$", p);
}

void makeArrow(pair p, pair q)
{
  pair u = unit(q-p);
  draw(p + rad*u -- q - rad*u, Arrow);
}

void makeArcArrow(pair p, pair q, real theta1, real theta2 = theta1)
{
  draw(p + rad*dir(theta1) {dir(theta1)} .. {dir(-theta2)} q - rad*dir(-theta2), Arrow);
}

makeNode(p1, 1);
makeNode(p2, 2);
makeNode(p3, 3);
makeNode(p4, 4);
makeNode(p5, 5);
makeNode(p6, 6);
makeNode(p7, 7);
makeNode(p8, 8);
makeNode(p9, 9);
makeNode(p10, 10);
makeNode(p11, 11);
makeNode(p12, 12);
makeNode(p13, 13);
makeNode(p14, 14);

real theta = 13;
makeArcArrow(p1,p6,5*theta);
makeArcArrow(p2,p6,4*theta);
makeArcArrow(p3,p6,3*theta);
makeArcArrow(p4,p6,2*theta);
makeArcArrow(p5,p6, theta);

makeArcArrow(p6, p7, 0);
makeArcArrow(p8, p7, 30, -30);
//makeArrow(p8, p7);
makeArcArrow(p7, p11, -120, 120);

makeArcArrow(p9, p14, -5*theta);
makeArcArrow(p10, p14, -4*theta);
makeArcArrow(p11, p14, -3*theta);
makeArcArrow(p12, p14, -2*theta);
makeArcArrow(p13, p14, -theta);

// int pair p1 = (0,0), p2 = (1,0), p3 = (2,0), p4 = (3,0), p5 = (4,0),
//   p6 = (2,1), p8 = (4,1),
//   p


// pair a = (0,0), b = (ww,0), c = (2*ww,0),
// d = (0, hh), e = (ww, hh), f = (2*ww, hh),
// g = (ww, 2*hh),
// h = (ww/2, 3*hh), i = (3*ww/2, 3*hh),
// j = (ww/2, 4*hh);



// void makeArrow(pair p, pair q)
// {
//   pair u = unit(q-p);
//   draw(p + rad*u -- q - rad*u, Arrow);
// }


// makeArrow(j,h);
// makeArrow(h,g);
// makeArrow(i,g);
// makeArrow(g,d);
// makeArrow(g,e);
// makeArrow(g,f);
// makeArrow(d,a);
// makeArrow(d,b);
// makeArrow(e,a);
// makeArrow(e,b);
// makeArrow(e,c);
// makeArrow(f,c);

// makeNode(a,10);
// makeNode(b,3);
// makeNode(c,7);
// makeNode(d,1);
// makeNode(e,2);
// makeNode(f,9);
// makeNode(g,4);
// makeNode(h,6);
// makeNode(i,5);
// makeNode(j,8);

size(4inch);
shipout(format="pdf");
