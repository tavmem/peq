/DESIGN CRITERIA
/ 1. Correct result (obviously)
/ 2. Speed (timings are on a 32-bit Pentium-4)
/ 3. Space used (runs with only 2G ram)
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

/Digits from integer
Dfi:{"J"$(string x),'" "}

/Binary digits from integer
Bdfi:{Dfi raze (where b)_ b:0b vs x}


/PROBLEMS

/Multiples of 3 and 5                                               \t 0
p001:{sum where not min(til 1000)mod/:3 5}

/Even Fibonacci numbers                                             \t 0
p002:{
 r:1; while[4e6>sum -2#r;r:r,sum -2#r];
 sum{x@where not x mod 2}r}

/Largest prime factor                                               \t 583
p003:{
 f:{x mod'til floor 1+sqrt x};
 d:where not f 600851475143;
 t:min each raze(enlist 2)cut/:f each d; t[where t=0W]:1;
 max d@where t}

/Largest palindrome product                                         \t 373
p004:{max m@where{x~reverse x}each string m:distinct raze n*/:\:n:100+til 900}

/Smallest multiple                                                  \t 0
p005:{prd 2 2 2 2 3 3 5 7 11 13 17 19}

/Sum square difference                                              \t 0
p006:{floor((sum a) xexp 2)-sum a*a:1+til 100}

/10001st prime                                                      \t 15
p007:{a:Primes 105000; a[10000]}

/Largest product in a series                                        \t 1
p008:{
 n:"J"$(raze read0 `t008.txt),'" ";
 max prd flip {x@(til 13)+/:til -12+count x}n}

/Special Pythagorean triplet                                        \t 578
p009:{
 c:b,'sqrt sum each b*b:{x cross x}til 500;
 prd first floor each c@where 1000=sum each c}

/Summation of primes                                                \t 376
p010:{sum Primes 2000000}

/Largest product in a grid                                          \t 2
p011:{
 t:read0 `t011.txt;
 n:20 20#0; j:0; do[20; n[j]:"J"$3 cut t[j]; j+:1];
 d:{x ./:/:a@-1_1_value group sum each a:{x cross x}til count x};
 e:{s:((count x),20)#0; i:0; do[count x;s[i;]:20#x[i;],20#0;i+:1];s};
 i:{$[4>count x;x;prd each x@(til 4)+/:til -3+count x]}; 
 max((raze i each n),(raze i each flip n),(raze i each e d n),(raze i each e d@reverse n))}

/Highly divisible triangular number                                 \t 3921
p012:{
 f:{floor x*(x+1)%2};
 c:1; r:0; while[r<500; r:count{d:where not x mod til floor 1+sqrt x;d,floor x%reverse d}f c+:1];
 f@c}

/Large sum                                                          \t 2
p013:{
 n:read0 `t013.txt;
 i:0; s:52#"a"; c:0;
 do[50; t:c+sum("I"$n[;49-i],'" "); s[51-i]:first -1#string t; c:floor t%10; i+:1];
 s[0 1]:-2#string c;
 "J"$10#s}

/Longest Collatz sequence                                           \t 9133
p014:{
 a:{
  C:-1 1,(x-2)#0; i:0;
  do[x; if[not C@i; b:where x>j:((i-1)<)Clz\i; C[j@b]:C[first reverse j]+(reverse til count j)@b]; i+:1];
  C}@1000000;
 a?max a}

/Lattice paths. (Binomial coefficient reduction)                    \t 0 
p015:{prd 2 13 2 37 33 31 29 5 23 21}

/Power digit sum                                                    \t 122
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

/Factorial digit sum                                                \t 3
p020:{
 a:31#0; a[0]:prd 1+til 12; i:13;
 while[i<101; a*:i; 
  while[0<sum b:a>999999999; k:first where b=1; r:floor(a[k]-a[k] mod 1e6)%1e6; a[k]:a[k] mod 1000000; a[k+1]+:r];
  i+:1];
 sum "J"$(raze string a),'" "}

/Amicable numbers                                                   \t 1851
p021:{
 d:sum each{d@where not x mod d:1_ til 1+floor .5*x}each til n:10000;
 sum c@where not d[c]=c:where (til n)=d[d[til n]]}

/Name scores                                                        \t 23
p022:{
 d:eval parse "(",ssr[raze read0 `t022.txt;",";";"],")";
 sum(1+til count d)*sum each -64+"i"$d[iasc(d)]}

/Non-abundant sums                                                  \t 3863
p023:{
 m:28123; n:m#1;
 b:raze a+/:a:1_ where{x<sum{distinct 7h$1,d,x%d:c@where not x mod c:1+1_ til floor sqrt x} x}each til m;
 n[b[where m>b]]:0;
 sum where n}

/Lexographic permutations                                           \t 2221
p024:{({$[1<x; raze (idesc each(x,x)#1,x#0)[;0,' 1+.z.s[x-1]]; enlist 0]}10)[999999]}

/1000-digit Fibonacci number                                        \t 0
p025:{floor .5+((log(sqrt 5)) + 999*log(10)) % (log((1+sqrt(5)) % 2))}

/Reciprocal cycles                                                  \t 197
p026:{1+first idesc{i:1; r:(); while[not(j:(i*10)mod x) in r; r,:j; i:j]; count r}each 1+til 1000}

/Quadratic primes                                                   \t 838
p027:{
 b:a[where 900<a:Primes 1000];  a:(reverse(-)a),a; c:a cross b; r:(count c)#0; p:Primes 5000; i:0; n:til 80;
 do[count c; av:80#c[i;0]; bv:80#c[i;1]; d:{[n;av;bv](n*n)+(av*n)+bv}[n;av;bv];
  r[i]:count d[where (0<d)&(d<5000)&d in p]; i+:1];
 prd raze c[where r=max r]}

/Number spiral diagonals                                            \t 0
p028:{1+sum {(4*x*x)+(-6*x)+6}each 3+2*til 500}

/Distinct powers                                                    \t 8
p029:{count sDfl raze n xexp/:n:2+til 99}

/Digit fifth powers                                                 \t 2330
p030:{sum 2_ where{x=sum(Dfi x)xexp 5}each til floor 6*9 xexp 5}

/Coin sums                                                          \t 5041
p031:{{$[x=0; :1; (x<0)|y=0; :0; .z.s[x;y-1]+.z.s[x-(1 2 5 10 20 50 100 200)[y-1];y]]}[200;8]}

/Pandigital Products                                                \t 6038
p032:{
 t:(til 10000;til 10000){r*"123456789"~{x@iasc[x]}@ raze string x,y,r:x*y}/:\:'(1+til 9;11+til 89);
 sum distinct raze raze t}

/Digit cancelling fractions                                         \t 0
p033:{
 c:(1+til 9) cross 1+til 9; d:prd flip c; a:c[;0]; b:c[;1]; f:((10*d)-d)%(10*a)-b;
 r:c[where (f=floor f) & (f<>1) & (f<10) & a<>b];
 floor (prd r[;1])%prd r[;0]}

/Digit factorials                                                   \t 4799
p034:{
 f:prd each 1+til each til 10;
 -3 + sum where{[f;t]t=sum f Dfi t}[f;]each til floor 1e6}

/Circular primes                                                    \t 564
p035:{
 r:2 3 5 7 11 13 17 31 37 71 73 79 97;
 p:Primes floor 1e6; p:p[where p>100]; p:p[where min each (Dfi each p)mod 2];
 a:p[where (99<p)&p<1000]; s:(2,count a)#0; s[0;]:(100*a mod 10)+floor a%10;
  s[1;]:(100*s[0;] mod 10)+floor s[0;]%10; r,:a[where min s in a];
 a:p[where (999<p)&p<10000]; s:(3,count a)#0; s[0;]:(1000*a mod 10)+floor a%10;
  i:0; do[2; s[i+1;]:(1000*s[i;] mod 10)+floor s[i;]%10; i+:1]; r,:a[where min s in a];
 a:p[where (9999<p)&p<100000]; s:(4,count a)#0; s[0;]:(10000*a mod 10)+floor a%10;
  i:0; do[3; s[i+1;]:(10000*s[i;] mod 10)+floor s[i;]%10; i+:1]; r,:a[where min s in a];
 a:p[where 99999<p]; s:(5,count a)#0; s[0;]:(100000*a mod 10)+floor a%10;
  i:0; do[4; s[i+1;]:(100000*s[i;] mod 10)+floor s[i;]%10; i+:1];
 count r,:a[where min s in a]}

/Double-base palindromes                                            \t 3094
p036:{sum d@where p each Bdfi each d:where(p:{x~reverse x})each Dfi each til 1000000}

/Truncatable primes                                                 \t 247
p037:{
 p:Primes 1000000; p1:p[where p<10]; p2:p[where (9<p)&p<100]; p3:p[where (99<p)&p<1000]; p4:p[where (999<p)&p<10000];
 p5:p[where (9999<p)&p<100000]; p6:p[where (99999<p)&p<1000000];
 r:p2[where((p2 mod 10)in p1)&(floor p2%10)in p1];
 r,:p3[where((p3 mod 10)in p1)&((p3 mod 100)in p2)&((floor p3%10)in p2)&(floor p3%100)in p1];
 r,:p4[where((p4 mod 10)in p1)&((p4 mod 100)in p2)&((p4 mod 1000)in p3)&((floor p4%10)in p3)
    &((floor p4%100)in p2)& (floor p4%1000)in p1];
 r,:p5[where((p5 mod 10)in p1)&((p5 mod 100)in p2)&((p5 mod 1000)in p3)&((p5 mod 10000)in p4)
    &((floor p5%10)in p4)& ((floor p5%100)in p3)&((floor p5%1000)in p2)& (floor p5%10000)in p1];
 r,:p6[where((p6 mod 10)in p1)&((p6 mod 100)in p2)&((p6 mod 1000)in p3)&((p6 mod 10000)in p4)&((p6 mod 100000)in p5)
    &((floor p6%10)in p5)&((floor p6%100)in p4)&((floor p6%1000)in p3)&((floor p6%10000)in p2)&(floor p6%100000)in p1];
 sum r}

/Pandigital multiples                                                \t 6
p038:{
 n:9000+til 1000; n:n,'n*2;
 c:flip (Dfi each n[;0]),'Dfi each n[;1];
 c:c[;(til count c[0;])[where not sum c=0]];
 i:1; do[9; c:c[;(til count c[0;])[where max c=i]]; i+:1];
 max 10 sv c}

/Integer right triangles                                             \t 359
p039:{
 b:sqrt sum each t*t:n cross n:til 499;
 p:sum each(t,'floor b)@where{x=floor x}b;
 P:p@where 1000>p;
 e:value group P;
 first P e@first reverse iasc count each e}

/Champernowne's constant                                             \t 568
p040:{prd eval parse raze " ",'(raze string til floor 1e6)@floor 10 xexp til 7}

/Pandigital prime                                                    \t 3152
p041:{
 p:Primes floor 8e6; 
 p:p[where (1234566<p)&p<7654322];
 r:flip Dfi each p;
 i:1; do[7; r:r[;(til count r[0;])[where max r=i]]; i+:1];
 max 10 sv r}

/Coded triangle numbers                                              \t 7
p042:{sum ((sum -64+"i"$)each eval parse "(",ssr[raze read0 `t042.txt;",";";"],")")in{floor .5*x*1+x}@til 99}
