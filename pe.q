/LOAD DATA for Problem 22
\l t022.q


/UTILITY FUNCTIONS

/primes below x
primes:{$[x<4;enlist 2;r,raze 1_where not max x#/: not til each r:.z.s[floor 1+sqrt x]]}

/Next term in Collatz sequence
clz:{$[x mod 2;1+3*x;floor x%2]}

/Each Pair
echPr:{$[1<count x; flip (-1_ x),'1_ x; x]}

/(d)ays (b)y (m)onth (i)n any (y)ear
dbmiy:{
 m:31 28 31 30 31 30 31 31 30 31 30 31;
 @[m;1;+;{(not x mod 400)|(not x mod 4)&(not not x mod 100)}x]}

/This function was used to format the data for problem 22
fmt022:{
 t:raze read0 `t022.txt;
 f:"t022:(",ssr[t;",";";"],")";
 `:t022.q 0: enlist f;
 }


/PROBLEMS

/Sum all multiples of 3 or 5 below 1000
p001:{sum where not min(til 1000)mod/:3 5}

/Sum even-valued Fibonacci terms under 4 million
p002:{
 r:1; while[4e6>sum -2#r;r:r,sum -2#r];
 sum{x@where not x mod 2}r}

/Largest prime factor of 600851475143
p003:{
 f:{x mod'til floor 1+sqrt x};
 d:where not f 600851475143;
 t:min each raze(enlist 2)cut/:f each d; t[where t=0W]:1;
 max d@where t}

/Largest palindrome from product of two 3-digit numbers
p004:{max m@where{x~reverse x}each string m:distinct raze n*/:\:n:100+til 900}

/Smallest positive number evenly divisible by 1 to 20
p005:{prd 2 2 2 2 3 3 5 7 11 13 17 19}

/(Sum squares of first 100) - (Square of sum)
p006:{floor((sum a) xexp 2)-sum a*a:1+til 100}

/10001st prime number
p007:{a:primes 105000; a[10000]}

/Greatest product of 13 adjacent digits
p008:{
 n:"J"$(raze read0 `t008.txt),'" ";
 max prd flip {x@(til 13)+/:til -12+count x}n}

/Product abc for Pythagorean triplet where a+b+c = 1000
p009:{
 c:b,'sqrt sum each b*b:{x cross x}til 500;
 prd first floor each c@where 1000=sum each c}

/Sum primes below 2 million
p010:{sum primes 2000000}

/Greatest product of 4 adjacent numbers
p011:{
 t:read0 `t011.txt;
 n:20 20#0; j:0; do[20; n[j]:"J"$3 cut t[j]; j+:1];
 d:{x ./:/:a@-1_1_value group sum each a:{x cross x}til count x};
 e:{s:((count x),20)#0; i:0; do[count x;s[i;]:20#x[i;],20#0;i+:1];s};
 i:{$[4>count x;x;prd each x@(til 4)+/:til -3+count x]}; 
 max((raze i each n),(raze i each flip n),(raze i each e d n),(raze i each e d@reverse n))}

/First triangle number with over 500 divisors
p012:{
 f:{floor x*(x+1)%2};
 c:1; r:0; while[r<500; r:count{d:where not x mod til floor 1+sqrt x;d,floor x%reverse d}f c+:1];
 f@c}

/First 10 digits of the sum of 100 numbers
p013:{
 n:read0 `t013.txt;
 i:0; s:52#"a"; c:0;
 do[50; t:c+sum("I"$n[;49-i],'" "); s[51-i]:first -1#string t; c:floor t%10; i+:1];
 s[0 1]:-2#string c;
 "J"$10#s}

/Starting number (under 1 million) for Longest Collatz sequence
p014:{
 a:{
  C:-1 1,(x-2)#0; i:0;
  do[x; if[not C@i; b:where x>j:((i-1)<)clz\i; C[j@b]:C[first reverse j]+(reverse til count j)@b]; i+:1];
  C}@1000000;
 a?max a}

/Number of routes through a 20x20 grid. Binomial coefficient of (40 over 20), which reduces to:
p015:{prd 2 13 2 37 33 31 29 5 23 21}

/Sum of digits of (2 xexp 1000)
p016:{r:1; do[1000; r*:2; r:(first where r)_ r:((r>9),0)+0,r mod 10;]; sum r}

/Count letters in words 1 to 1000
p017:{
 m:string``one`two`three`four`five`six`seven`eight`nine;
 m,:(string`ten`eleven`twelve),(string`thir`four`fif`six`seven`eigh`nine),\:"teen";
 m,:raze((string`twen`thir`for`fif`six`seven`eigh`nine),\:"ty"),/:\:10#m;
 m,:raze (m[1+til 9],\:"hundred"),/:\:(enlist ""),"and",/:m 1+til 99;
 sum count each m,:m[1],"thousand"}

/Max total from top to bottom of triangle
p018:{
 t:read0 `t018.txt;
 n:15#(::); n[0]:"J"$t[0]; i:1; do[14; n[i]:"J"$3 cut t[i]; i+:1]; n:reverse n;
 first 0{y+max echPr x}/n}

/Number of Sundays on the first of the month in the 20th century
p019:{
 n:0+\raze dbmiy each 1900+til 101;
 count n@where(6=n mod 7)&n>365}

/Sum of digits of 100 factorial
p020:{
 a:31#0; a[0]:prd 1+til 12; i:13;
 while[i<101; a*:i; 
  while[0<sum b:a>999999999; k:first where b=1; r:floor(a[k]-a[k] mod 1e6)%1e6; a[k]:a[k] mod 1000000; a[k+1]+:r];
  i+:1];
 sum "J"$(raze string a),'" "}

/Sum of all amicable numbers under 10000
p021:{
 d:sum each{d@where not x mod d:1_ til 1+floor .5*x}each til n:10000;
 sum c@where not d[c]=c:where (til n)=d[d[til n]]}

/Total of all the name scores
p022:{sum(1+til count t)*sum each -64+6h$t:t022[iasc(t022)]}

/Sum of all positive integers that are not the sum of 2 abundant numbers
p023:{
 m:28123; n:m#1;
 b:raze a+/:a:1_ where{x<sum{distinct 7h$1,d,x%d:c@where not x mod c:1+1_ til floor sqrt x} x}each til m;
 n[b[where m>b]]:0;
 sum where n}
