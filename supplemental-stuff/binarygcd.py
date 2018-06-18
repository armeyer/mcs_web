def binarygcd(a, b):               #a, b > 0
    """returns gcd(a,b) and coefficients ux,vx,uy,vy such that
       gcd(a,b) = (ux, vx) dot (a, b) = (uy, vy) dot (a, b)
       for example:
       >>> binarygcd(12,30)
      (\'gcd=\', 6, \'a=\', 12, \'b=\', 30, \'ux=\', -7, \'vx=\', 3, \'uy=\', -2, \'vy=\', 1)"""
    def div2(x, y, e):             #x=a/e, y=b/e
        if evenp(x) and evenp(y):
            return div2(x//2, y//2, 2*e)
        else:                      #x, y not both even
            def loop(x, ux, vx, y, uy, vy):
                                   #x = (ux, vx) dot (a/e, b/e)
                                   #y = (uy, vy) dot (a/e, b/e)
                if evenp(x):
                    if evenp(ux) and evenp(vx):
                        return loop(x//2, ux//2, vx//2, y, uy, vy)
                    else:          #ux-b/e and vx+a/e are even
                        return loop(x//2, (ux-b//e)//2, (vx+a//e)//2, y, uy, vy)
                elif evenp(y):
                    if evenp(uy) and evenp(vy):
                        return loop(x, ux, vx, y//2, uy//2, vy//2)
                    else:          #uy-b/e and vy+a/e are even
                        return loop(x, ux, vx, y//2, (uy-b//e)//2, (vy+a//e)//2)
                elif x > y:
                    return loop(x-y, ux-uy, vx-vy, y, uy, vy)
                elif x < y:
                    return loop(x, ux, vx, y-x, uy-ux, vy-vx)
                else:              #x = y
                    return ("gcd=", e*x, 'a=', a, 'b=', b, 'ux=', ux, 'vx=', vx, 'uy=', uy, 'vy=', vy)
        return loop(x, 1, 0, y, 0, 1)
    return div2(a, b, 1)

def evenp(n):
  return n%2 == 0

#========================

def dot(a, b, u, v):
  return u*a+v*b

#>>> binarygcd(3, 5)
#(gcd 1 a 3 b 5 ux 2 vx -1 uy -3 vy 2)

#>>> binarygcd(2**3, 2**5)
#(gcd 8 a 8 b 32 ux 1 vx 0 uy -3 vy 1)

#>>> binarygcd(2**3 * 3**2 * 5 * 7 * 11**2, 2**4)
#(gcd 8 a 304920 b 16 ux -1 vx 19058 uy -1 vy 19058)

#>>> binarygcd(3**2 * 5 * 7 * 11**2,  2**4 * 3**4 *11)
#(gcd 99 a 38115 b 14256 ux -5567 vx 14884 uy -4991 vy 13344)

#>>> binarygcd(2**13 * 3**2 * 5 * 7 * 13**2,  2**4 * 5**4 * 11**5)
#(gcd 80 a 436101120 b 1610510000 ux -39348366 vx 10654927 uy -79611116 vy 21557455)
