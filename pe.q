 /Sum of all multiples of 3 or 5 below 1000
p001:{sum where not min(til 1000)mod/:3 5}

 /Sum of even-valued Fibonacci terms under 4 million
p002:{
 r:1; while[4e6>sum -2#r;r:r,sum -2#r];
 sum{x@where not x mod 2}r}

 /Largest prime factor of 600851475143
p003: {
 f:{x mod'til floor 1+sqrt x};
 d:where not f 600851475143;
 t:min each raze(enlist 2)cut/:f each d; t[where t=0W]:1;
 max d@where t}

 /Largest palindrome from product of two 3-digit numbers
p004: {
 a:100+til 900;
 b:a*/:a;
 c:b[0]; i:1; do[-1+count b; c:c,b[i]; i+:1]; c:distinct c;
 max c@where{x~reverse x} each string c}

 /Smallest positive number evenly divisible by 1 to 20
p005: {prd 2 2 2 2 3 3 5 7 11 13 17 19}

 /(Sum squares of first 100) - (Square of sum)
p006: {((sum a) xexp 2)-sum a*a:1+til 100}