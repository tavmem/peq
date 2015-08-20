 /UTILITY FUNCTIONS 
 /All primes below x
primes:{$[x<4;enlist 2;r,raze 1_where not max x#/: not til each r:.z.s[floor 1+sqrt x]]}
 /odometer with 2 columns
od2:{(raze x#'a),'(x*x)#a:til x}

 /EULER PROBLEMS
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
 n:  7 3 1 6 7 1 7 6 5 3 1 3 3 0 6 2 4 9 1 9 2 2 5 1 1 9 6 7 4 4 2 6 5 7 4 7 4 2 3 5 5 3 4 9 1 9 4 9 3 4;
 n:n,9 6 9 8 3 5 2 0 3 1 2 7 7 4 5 0 6 3 2 6 2 3 9 5 7 8 3 1 8 0 1 6 9 8 4 8 0 1 8 6 9 4 7 8 8 5 1 8 4 3;
 n:n,8 5 8 6 1 5 6 0 7 8 9 1 1 2 9 4 9 4 9 5 4 5 9 5 0 1 7 3 7 9 5 8 3 3 1 9 5 2 8 5 3 2 0 8 8 0 5 5 1 1;
 n:n,1 2 5 4 0 6 9 8 7 4 7 1 5 8 5 2 3 8 6 3 0 5 0 7 1 5 6 9 3 2 9 0 9 6 3 2 9 5 2 2 7 4 4 3 0 4 3 5 5 7;
 n:n,6 6 8 9 6 6 4 8 9 5 0 4 4 5 2 4 4 5 2 3 1 6 1 7 3 1 8 5 6 4 0 3 0 9 8 7 1 1 1 2 1 7 2 2 3 8 3 1 1 3;
 n:n,6 2 2 2 9 8 9 3 4 2 3 3 8 0 3 0 8 1 3 5 3 3 6 2 7 6 6 1 4 2 8 2 8 0 6 4 4 4 4 8 6 6 4 5 2 3 8 7 4 9;
 n:n,3 0 3 5 8 9 0 7 2 9 6 2 9 0 4 9 1 5 6 0 4 4 0 7 7 2 3 9 0 7 1 3 8 1 0 5 1 5 8 5 9 3 0 7 9 6 0 8 6 6;
 n:n,7 0 1 7 2 4 2 7 1 2 1 8 8 3 9 9 8 7 9 7 9 0 8 7 9 2 2 7 4 9 2 1 9 0 1 6 9 9 7 2 0 8 8 8 0 9 3 7 7 6;
 n:n,6 5 7 2 7 3 3 3 0 0 1 0 5 3 3 6 7 8 8 1 2 2 0 2 3 5 4 2 1 8 0 9 7 5 1 2 5 4 5 4 0 5 9 4 7 5 2 2 4 3;
 n:n,5 2 5 8 4 9 0 7 7 1 1 6 7 0 5 5 6 0 1 3 6 0 4 8 3 9 5 8 6 4 4 6 7 0 6 3 2 4 4 1 5 7 2 2 1 5 5 3 9 7;
 n:n,5 3 6 9 7 8 1 7 9 7 7 8 4 6 1 7 4 0 6 4 9 5 5 1 4 9 2 9 0 8 6 2 5 6 9 3 2 1 9 7 8 4 6 8 6 2 2 4 8 2;
 n:n,8 3 9 7 2 2 4 1 3 7 5 6 5 7 0 5 6 0 5 7 4 9 0 2 6 1 4 0 7 9 7 2 9 6 8 6 5 2 4 1 4 5 3 5 1 0 0 4 7 4;
 n:n,8 2 1 6 6 3 7 0 4 8 4 4 0 3 1 9 9 8 9 0 0 0 8 8 9 5 2 4 3 4 5 0 6 5 8 5 4 1 2 2 7 5 8 8 6 6 6 8 8 1;
 n:n,1 6 4 2 7 1 7 1 4 7 9 9 2 4 4 4 2 9 2 8 2 3 0 8 6 3 4 6 5 6 7 4 8 1 3 9 1 9 1 2 3 1 6 2 8 2 4 5 8 6;
 n:n,1 7 8 6 6 4 5 8 3 5 9 1 2 4 5 6 6 5 2 9 4 7 6 5 4 5 6 8 2 8 4 8 9 1 2 8 8 3 1 4 2 6 0 7 6 9 0 0 4 2;
 n:n,2 4 2 1 9 0 2 2 6 7 1 0 5 5 6 2 6 3 2 1 1 1 1 1 0 9 3 7 0 5 4 4 2 1 7 5 0 6 9 4 1 6 5 8 9 6 0 4 0 8;
 n:n,0 7 1 9 8 4 0 3 8 5 0 9 6 2 4 5 5 4 4 4 3 6 2 9 8 1 2 3 0 9 8 7 8 7 9 9 2 7 2 4 4 2 8 4 9 0 9 1 8 8;
 n:n,8 4 5 8 0 1 5 6 1 6 6 0 9 7 9 1 9 1 3 3 8 7 5 4 9 9 2 0 0 5 2 4 0 6 3 6 8 9 9 1 2 5 6 0 7 1 7 6 0 6;
 n:n,0 5 8 8 6 1 1 6 4 6 7 1 0 9 4 0 5 0 7 7 5 4 1 0 0 2 2 5 6 9 8 3 1 5 5 2 0 0 0 5 5 9 3 5 7 2 9 7 2 5;
 n:n,7 1 6 3 6 2 6 9 5 6 1 8 8 2 6 7 0 4 2 8 2 5 2 4 8 3 6 0 0 8 2 3 2 5 7 5 3 0 4 2 0 7 5 2 9 6 3 4 5 0;
 max prd flip {x@(til 13)+/:til -12+count x}n}

 /Product abc for Pythagorean triplet where a+b+c = 1000
p009:{
 c:b,'sqrt sum each b*b:od2 500;
 prd first floor each c@where 1000=sum each c}

 /Sum primes below 2 million
p010:{sum primes 2000000}

 /Greatest product of 4 adjacent numbers
p011:{
 n:20 20#0;
 n[0;]: 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08;
 n[1;]: 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00;
 n[2;]: 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65;
 n[3;]: 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91;
 n[4;]: 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80;
 n[5;]: 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50;
 n[6;]: 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70;
 n[7;]: 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21;
 n[8;]: 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72;
 n[9;]: 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95;
 n[10;]:78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92;
 n[11;]:16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57;
 n[12;]:86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58;
 n[13;]:19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40;
 n[14;]:04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66;
 n[15;]:88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69;
 n[16;]:04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36;
 n[17;]:20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16;
 n[18;]:20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54;
 n[19;]:01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48;
 d:{x ./:/:a@-1_1_value group sum each a:od2 count x};
 e:{s:((count x),20)#0; i:0; do[count x;s[i;]:20#x[i;],20#0;i+:1];s};
 i:{$[4>count x;x;prd each x@(til 4)+/:til -3+count x]}; 
 max((raze i each n),(raze i each flip n),(raze i each e d n),(raze i each e d@reverse n))}

 /First triangle number with over 500 divisors
p012:{
 f:{floor x*(x+1)%2};
 c:1; r:0; while[r<500; r:count{d:where not x mod til floor 1+sqrt x;d,floor x%reverse d}f c+:1];
 f@c}