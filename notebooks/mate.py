def gcd(a, b):
    """Calculate the Greatest Common Divisor of a and b.

    Unless b==0, the result will have the same sign as b (so that when
    b is divided by it, th--e result comes out positive).
    """
    while b:
        a, b = b, a%b
    return a

PI = 3.141592