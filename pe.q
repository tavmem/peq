 /UTILITY FUNCTIONS

 /All primes below x
primes:{$[x<4;enlist 2;r,raze 1_where not max x#/: not til each r:.z.s[floor 1+sqrt x]]}
 /Next term in Collatz sequence 
clz:{$[x mod 2;1+3*x;floor x%2]};

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
p004:{
 b:a*/:a:100+til 900;
 c:b[0]; i:1; do[-1+count b; c:c,b[i]; i+:1]; c:distinct c;
 max c@where{x~reverse x} each string c}

/Smallest positive number evenly divisible by 1 to 20
p005:{prd 2 2 2 2 3 3 5 7 11 13 17 19}

/(Sum squares of first 100) - (Square of sum)
p006:{((sum a) xexp 2)-sum a*a:1+til 100}

/10001st prime number
p007:{a:primes 105000; a[10000]}

/Greatest product of 13 adjacent digits
p008:{
 n:"J"$(raze read0 `t008.txt),'" ";
 max prd flip {x@(til 13)+/:til -12+count x}n}

/Product abc for Pythagorean triplet where a+b+c = 1000
p009:{
 c:b,'sqrt sum each b*b:(til 500)cross til 500;
 prd first floor each c@where 1000=sum each c}

/Sum primes below 2 million
p010:{sum primes 2000000}

/Greatest product of 4 adjacent numbers
p011:{
 t:read0 `t011.txt;
 n:20 20#0; j:0; do[20; n[j]:"J"$3 cut t[j]; j+:1];
 d:{x ./:/:a@-1_1_value group sum each a:(til count x)cross til count x};
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
 m,:raze (m[1+til 9],\:"hundred"),/:\:(enlist ""),"and",/:m 1+til 99;       /problem
 sum count each m,:m[1],"thousand"}
