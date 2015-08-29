/DESIGN CRITERIA
/ 1. Correct result (obviously)
/ 2. Speed (timings are on a 32-bit Pentium-4)
/ 3. Space used (run with only 2G ram)
/ 4. Style


/UTILITY FUNCTIONS

/primes below x
Pr:{@[x#1; y*til each neg floor neg x%y; :; 0]}
Primes:{[s;n]$[n<4; enlist 2; r,1_where s[n]r:.z.s[s]@neg floor neg sqrt n]}[Pr;]

/next term in Collatz sequence
Clz:{$[x mod 2;1+3*x;floor x%2]}

/each pair
echPr:{$[1<count x; flip (-1_ x),'1_ x; x]}

/days by month in any year
Dbmiy:{
 m:31 28 31 30 31 30 31 31 30 31 30 31;
 @[m;1;+;{(not x mod 400)|(not x mod 4)&(not not x mod 100)}x]}

/sorted Distinct floats 
sDfl:{n[where n<>-1_0,n:x[iasc x]]}

/Digits from integers
Dfi:{"J"$(string abs x),'" "}


/PROBLEMS

/Multiples of 3 and 5                                               \t 0
p001:{sum where not min(til 1000)mod/:3 5}

/Even Fibonacci numbers                                             \t 0
p002:{
 r:1; while[4e6>sum -2#r;r:r,sum -2#r];
 sum{x@where not x mod 2}r}

/Largest prime factor                                               \t 1064
p003:{
 f:{x mod'til floor 1+sqrt x};
 d:where not f 600851475143;
 t:min each raze(enlist 2)cut/:f each d; t[where t=0W]:1;
 max d@where t}

/Largest palindrome product                                         \t 578
p004:{max m@where{x~reverse x}each string m:distinct raze n*/:\:n:100+til 900}

/Smallest multiple                                                  \t 0
p005:{prd 2 2 2 2 3 3 5 7 11 13 17 19}

/Sum square difference                                              \t 0
p006:{floor((sum a) xexp 2)-sum a*a:1+til 100}

/10001st prime                                                      \t 22
p007:{a:Primes 105000; a[10000]}

/Largest product in a series                                        \t 2
p008:{
 n:"J"$(raze read0 `t008.txt),'" ";
 max prd flip {x@(til 13)+/:til -12+count x}n}

/Special Pythagorean triplet                                        \t 942
p009:{
 c:b,'sqrt sum each b*b:{x cross x}til 500;
 prd first floor each c@where 1000=sum each c}

/Summation of primes                                                \t 500
p010:{sum Primes 2000000}

/Largest product in a grid                                          \t 4
p011:{
 t:read0 `t011.txt;
 n:20 20#0; j:0; do[20; n[j]:"J"$3 cut t[j]; j+:1];
 d:{x ./:/:a@-1_1_value group sum each a:{x cross x}til count x};
 e:{s:((count x),20)#0; i:0; do[count x;s[i;]:20#x[i;],20#0;i+:1];s};
 i:{$[4>count x;x;prd each x@(til 4)+/:til -3+count x]}; 
 max((raze i each n),(raze i each flip n),(raze i each e d n),(raze i each e d@reverse n))}

/Highly divisible triangular number                                 \t 6819
p012:{
 f:{floor x*(x+1)%2};
 c:1; r:0; while[r<500; r:count{d:where not x mod til floor 1+sqrt x;d,floor x%reverse d}f c+:1];
 f@c}

/Large sum                                                          \t 3
p013:{
 n:read0 `t013.txt;
 i:0; s:52#"a"; c:0;
 do[50; t:c+sum("I"$n[;49-i],'" "); s[51-i]:first -1#string t; c:floor t%10; i+:1];
 s[0 1]:-2#string c;
 "J"$10#s}

/Longest Collatz sequence                                           \t 15742
p014:{
 a:{
  C:-1 1,(x-2)#0; i:0;
  do[x; if[not C@i; b:where x>j:((i-1)<)Clz\i; C[j@b]:C[first reverse j]+(reverse til count j)@b]; i+:1];
  C}@1000000;
 a?max a}

/Lattice paths. (Binomial coefficient reduction)                    \t 0 
p015:{prd 2 13 2 37 33 31 29 5 23 21}

/Power digit sum                                                    \t 225
p016:{r:1; do[1000; r*:2; r:(first where r)_ r:((r>9),0)+0,r mod 10;]; sum r}

/Number letter counts                                               \t 0
p017:{
 m:string``one`two`three`four`five`six`seven`eight`nine;
 m,:(string`ten`eleven`twelve),(string`thir`four`fif`six`seven`eigh`nine),\:"teen";
 m,:raze((string`twen`thir`for`fif`six`seven`eigh`nine),\:"ty"),/:\:10#m;
 m,:raze (m[1+til 9],\:"hundred"),/:\:(enlist ""),"and",/:m 1+til 99;
 sum count each m,:m[1],"thousand"}

/Maximum path sum I                                                 \t 0
p018:{
 t:read0 `t018.txt;
 n:15#(::); n[0]:"J"$t[0]; i:1; do[14; n[i]:"J"$3 cut t[i]; i+:1]; n:reverse n;
 first 0{y+max echPr x}/n}

/Counting Sundays                                                   \t 1
p019:{
 n:0+\raze Dbmiy each 1900+til 101;
 count n@where(6=n mod 7)&n>365}

/Factorial digit sum                                                \t 6
p020:{
 a:31#0; a[0]:prd 1+til 12; i:13;
 while[i<101; a*:i; 
  while[0<sum b:a>999999999; k:first where b=1; r:floor(a[k]-a[k] mod 1e6)%1e6; a[k]:a[k] mod 1000000; a[k+1]+:r];
  i+:1];
 sum "J"$(raze string a),'" "}

/Amicable numbers                                                   \t 3266
p021:{
 d:sum each{d@where not x mod d:1_ til 1+floor .5*x}each til n:10000;
 sum c@where not d[c]=c:where (til n)=d[d[til n]]}

/Name scores                                                        \t 45
p022:{
 d:eval parse "(",ssr[raze read0 `t022.txt;",";";"],")";
 sum(1+til count d)*sum each -64+"i"$d[iasc(d)]}

/Non-abundant sums                                                  \t 5775
p023:{
 m:28123; n:m#1;
 b:raze a+/:a:1_ where{x<sum{distinct 7h$1,d,x%d:c@where not x mod c:1+1_ til floor sqrt x} x}each til m;
 n[b[where m>b]]:0;
 sum where n}

/Lexographic permutations                                           \t 3053
p024:{({$[1<x; raze (idesc each(x,x)#1,x#0)[;0,' 1+.z.s[x-1]]; enlist 0]}10)[999999]}

/1000-digit Fibonacci number                                        \t 0
p025:{floor .5+((log(sqrt 5)) + 999*log(10)) % (log((1+sqrt(5)) % 2))}

/Reciprocal cycles                                                  \t 364
p026:{1+first idesc{i:1; r:(); while[not(j:(i*10)mod x) in r; r,:j; i:j]; count r}each 1+til 1000}

/Quadratic primes                                                   \t 1510
p027:{
 b:a[where 900<a:Primes 1000];  a:(reverse(-)a),a; c:a cross b; r:(count c)#0; p:Primes 5000; i:0; n:til 80;
 do[count c; av:80#c[i;0]; bv:80#c[i;1]; d:{[n;av;bv](n*n)+(av*n)+bv}[n;av;bv];
  r[i]:count d[where (0<d)&(d<5000)&d in p]; i+:1];
 prd raze c[where r=max r]}

/Number spiral diagonals                                            \t 0
p028:{1+sum {(4*x*x)+(-6*x)+6}each 3+2*til 500}

/Distinct powers                                                    \t 12
p029:{count sDfl raze n xexp/:n:2+til 99}

/Digit fifth powers                                                 \t 3903
p030:{sum 2_ where{x=sum(Dfi x)xexp 5}each til floor 6*9 xexp 5}

/Coin sums                                                          \t 8341
p031:{{$[x=0; :1; (x<0)|y=0; :0; .z.s[x;y-1]+.z.s[x-(1 2 5 10 20 50 100 200)[y-1];y]]}[200;8]}

/Pandigital Products                                                \t 9528
p032:{
 t:(til 10000;til 10000){r*"123456789"~{x@iasc[x]}@ raze string x,y,r:x*y}/:\:'(1+til 9;11+til 89);
 sum distinct raze raze t}

/Digit cancelling fractions                                         \t 0
p033:{
 c:(1+til 9) cross 1+til 9; d:prd flip c; a:c[;0]; b:c[;1]; f:((10*d)-d)%(10*a)-b;
 r:c[where (f=floor f) & (f<>1) & (f<10) & a<>b];
 floor (prd r[;1])%prd r[;0]}

/Digit factorials                                                   \t 8252
p034:{
 f:prd each 1+til each til 10;
 -3 + sum where{[f;t]t=sum f Dfi t}[f;]each til floor 1e6}

/Circular primes                                                    \t 840
p035:{
 r:2 3 5 7 11 13 17 31 37 71 73 79 97;
 p:Primes floor 1e6; p:p[where p>100]; p:p[where min each (Dfi each p)mod 2];

 a:p[where (99<p)&p<1000];
 s:(2,count a)#0;
 s[0;]:(100*a mod 10)+floor a%10;
 s[1;]:(100*s[0;] mod 10)+floor s[0;]%10;
 r:r,a[where min s in a];

 a:p[where (999<p)&p<10000];
 s:(3,count a)#0;
 s[0;]:(1000*a mod 10)+floor a%10;
 s[1;]:(1000*s[0;] mod 10)+floor s[0;]%10;
 s[2;]:(1000*s[1;] mod 10)+floor s[1;]%10;
 r:r,a[where min s in a];

 a:p[where (9999<p)&p<100000];
 s:(4,count a)#0;
 s[0;]:(10000*a mod 10)+floor a%10;
 s[1;]:(10000*s[0;] mod 10)+floor s[0;]%10;
 s[2;]:(10000*s[1;] mod 10)+floor s[1;]%10;
 s[3;]:(10000*s[2;] mod 10)+floor s[2;]%10;
 r:r,a[where min s in a];

 a:p[where 99999<p];
 s:(5,count a)#0;
 s[0;]:(100000*a mod 10)+floor a%10;
 s[1;]:(100000*s[0;] mod 10)+floor s[0;]%10;
 s[2;]:(100000*s[1;] mod 10)+floor s[1;]%10;
 s[3;]:(100000*s[2;] mod 10)+floor s[2;]%10;
 s[4;]:(100000*s[3;] mod 10)+floor s[3;]%10;
 r:r,a[where min s in a];
 count r}
