
/DESIGN CRITERIA
/ 1. Correct result (obviously)
/ 2. Speed (timings are on a 32-bit Pentium-4)
/ 3. Space (32-bit address space)
/ 4. Style


/PROBLEMS

/Multiples of 3 and 5                                               \ts 0 336
p001:{{f001[x;y]+f001[x;z]-f001[x;y*z]}[1000;3;5]}
f001:{floor .5*y*prd 0 1+(x-1) div y}

/Even Fibonacci numbers                                             \ts 0 2256
p002:{
 r:1; while[4e6>sum -2#r;r:r,sum -2#r];
 sum{x@where not x mod 2}r}

/Largest prime factor                                               \ts 583 33374096 
p003:{
 f:{x mod'til floor 1+sqrt x};
 d:where not f 600851475143;
 t:min each raze(enlist 2)cut/:f each d; t[where t=0W]:1;
 max d@where t}

/Largest palindrome product                                         \ts 350 18882704
p004:{max m@where{x~reverse x}each string m:distinct raze n*/:\:n:100+til 900}

/Smallest multiple                                                  \ts 0 304
p005:{prd 2 2 2 2 3 3 5 7 11 13 17 19}

/Sum square difference                                              \ts 0 2208
p006:{floor((sum a) xexp 2)-sum a*a:1+til 100}

/10001st prime                                                      \ts 9 4917568
p007:{a:Primes 105000; a[10000]}
Siv:{@[x#1; y*til each neg floor neg x%y; :; 0]}
Primes:{[s;n]$[n<4; enlist 2; r,1_where s[n]r:.z.s[s]@neg floor neg sqrt n]}[Siv;]

/Largest product in a series                                        \ts 1 269488
p008:{
 n:"J"$(raze read0 `t008.txt),'" ";
 max prd flip {x@(til 13)+/:til -12+count x}n}

/Special Pythagorean triplet                                        \ts 488 37243104
p009:{
 c:b,'sqrt sum each b*b:{x cross x}til 500;
 prd first floor each c@where 1000=sum each c}

/Summation of primes                                                \ts 344 99684656
p010:{sum Primes 2000000}

/Largest product in a grid                                          \ts 2 46208
p011:{
 t:read0 `t011.txt;
 n:20 20#0; j:0; do[20; n[j]:"J"$3 cut t[j]; j+:1];
 d:{x ./:/:a@-1_1_value group sum each a:{x cross x}til count x};
 e:{s:((count x),20)#0; i:0; do[count x;s[i;]:20#x[i;],20#0;i+:1];s};
 i:{$[4>count x;x;prd each x@(til 4)+/:til -3+count x]}; 
 max((raze i each n),(raze i each flip n),(raze i each e d n),(raze i each e d@reverse n))}

/Highly divisible triangular number                                 \ts 3922 524576
p012:{
 f:{floor x*(x+1)%2};
 c:1; r:0; while[r<500; r:count{d:where not x mod til floor 1+sqrt x;d,floor x%reverse d}f c+:1];
 f@c}

/Large sum                                                          \ts 2 21680
p013:{
 n:read0 `t013.txt;
 i:0; s:52#"a"; c:0;
 do[50; t:c+sum("I"$n[;49-i],'" "); s[51-i]:first -1#string t; c:floor t%10; i+:1];
 s[0 1]:-2#string c;
 "J"$10#s}

/Longest Collatz sequence                                           \ts 9132 16777424
p014:{
 a:{
  C:-1 1,(x-2)#0; i:0;
  do[x; if[not C@i; b:where x>j:((i-1)<)Clz\i; C[j@b]:C[first reverse j]+(reverse til count j)@b]; i+:1];
  C}@1000000;
 a?max a}
Clz:{$[x mod 2;1+3*x;floor x%2]}  /next term

/Lattice paths. (Binomial coefficient reduction)                    \ts 0 304 
p015:{prd 2 13 2 37 33 31 29 5 23 21}

/Power digit sum                                                    \ts 122 26240
p016:{r:1; do[1000; r*:2; r:(first where r)_ r:((r>9),0)+0,r mod 10;]; sum r}

/Number letter counts                                               \ts 0 92768
p017:{
 m:string``one`two`three`four`five`six`seven`eight`nine;
 m,:(string`ten`eleven`twelve),(string`thir`four`fif`six`seven`eigh`nine),\:"teen";
 m,:raze((string`twen`thir`for`fif`six`seven`eigh`nine),\:"ty"),/:\:10#m;
 m,:raze (m[1+til 9],\:"hundred"),/:\:(enlist ""),"and",/:m 1+til 99;
 sum count each m,:m[1],"thousand"}

/Maximum path sum I                                                 \ts 0 4640
p018:{
 t:read0 `t018.txt;
 n:15#(::); n[0]:"J"$t[0]; i:1; do[14; n[i]:"J"$3 cut t[i]; i+:1]; n:reverse n;
 first 0{y+max echPr x}/n}
echPr:{$[1<count x; flip (-1_a),'1_a:enlist each x; x]}   /each pair

/Counting Sundays                                                   \ts 1 67760
p019:{n:0+\raze Dbmiy each 1900+til 101; count n@where(6=n mod 7)&n>365}
Dbmiy:{m:31 28 31 30 31 30 31 31 30 31 30 31; @[m;1;+;{(not x mod 400)|(not x mod 4)&(not not x mod 100)}x]}

/Factorial digit sum                                                \t 3 9568
p020:{
 a:31#0; a[0]:prd 1+til 12; i:13;
 while[i<101; a*:i; 
  while[0<sum b:a>999999999; k:first where b=1; r:floor(a[k]-a[k] mod 1e6)%1e6; a[k]:a[k] mod 1000000; a[k+1]+:r];
  i+:1];
 sum "J"$(raze string a),'" "}

/Amicable numbers                                                   \ts 1845 1736720
p021:{
 d:sum each{d@where not x mod d:1_ til 1+floor .5*x}each til n:10000;
 sum c@where not d[c]=c:where (til n)=d[d[til n]]}

/Name scores                                                        \ts 23 1017232
p022:{
 d:eval parse "(",ssr[raze read0 `t022.txt;",";";"],")";
 sum(1+til count d)*sum each -64+"i"$d[iasc(d)]}

/Non-abundant sums                                                  \ts 2896 1074069744
p023:{
 m:28123; n:m#1;
 b:raze a+/:a:1_ where{x<sum{distinct 7h$1,d,x%d:c@where not x mod c:1+1_ til floor sqrt x} x}each til m;
 n[b[where m>b]]:0;
 sum where n}

/Lexographic permutations                                           \ts 1628 534005360
p024:{({$[1<x; raze (idesc each(x,x)#1,x#0)[;0,' 1+.z.s[x-1]]; enlist 0]}10)[999999]}

/1000-digit Fibonacci number                                        \ts 0 304
p025:{floor .5+((log(sqrt 5)) + 999*log(10)) % (log((1+sqrt(5)) % 2))}

/Reciprocal cycles                                                  \ts 189 40624
p026:{1+first idesc{i:1; r:(); while[not(j:(i*10)mod x) in r; r,:j; i:j]; count r}each 1+til 1000}

/Quadratic primes                                                   \ts 835 449488
p027:{
 b:a[where 900<a:Primes 1000];  a:(reverse(-)a),a; c:a cross b; r:(count c)#0; p:Primes 5000; i:0; n:til 80;
 do[count c; av:80#c[i;0]; bv:80#c[i;1]; d:{[n;av;bv](n*n)+(av*n)+bv}[n;av;bv];
  r[i]:count d[where (0<d)&(d<5000)&d in p]; i+:1];
 prd raze c[where r=max r]}

/Number spiral diagonals                                            \ts 0 18432
p028:{1+sum {(4*x*x)+(-6*x)+6}each 3+2*til 500}

/Distinct powers                                                    \ts 7 724464
p029:{count sDfl raze n xexp/:n:2+til 99}
sDfl:{n[where n<>-1_0,n:x[iasc x]]} /sorted Distict floats

/Digit fifth powers                                                 \ts 2208 12484640
p030:{sum 2_ where{x=sum(Dfi x)xexp 5}each til floor 6*9 xexp 5}
Dfi:{"J"$(string x),'" "} /Digits from integer

/Coin sums                                                          \ts 5037 10256
p031:{{$[x=0; :1; (x<0)|y=0; :0; .z.s[x;y-1]+.z.s[x-(1 2 5 10 20 50 100 200)[y-1];y]]}[200;8]}

/Pandigital Products                                                \ts 5871 28436656
p032:{
 t:(til 10000;til 10000){r*"123456789"~{x@iasc[x]}@ raze string x,y,r:x*y}/:\:'(1+til 9;11+til 89);
 sum distinct raze raze t}

/Digit cancelling fractions                                         \ts 0 11472
p033:{
 c:(1+til 9) cross 1+til 9; d:prd flip c; a:c[;0]; b:c[;1]; f:((10*d)-d)%(10*a)-b;
 r:c[where (f=floor f) & (f<>1) & (f<10) & a<>b];
 floor (prd r[;1])%prd r[;0]}

/Digit factorials                                                   \ts 3913 29631840
p034:{
 f:prd each 1+til each til 10;
 -3 + sum where{[f;t]t=sum f Dfi t}[f;]each til floor 1e6}

/Circular primes                                                    \ts 472 48943472
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

/Double-base palindromes                                            \ts 2959 89434176
p036:{sum d@where p each Bdfi each d:where(p:{x~reverse x})each Dfi each til 1000000}
Bdfi:{Dfi raze (where b)_ b:0b vs x} /Binary digits from integer

/Truncatable primes                                                 \ts 214 48943456
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

/Pandigital multiples                                                \ts 7 304576
p038:{
 n:9000+til 1000; n:n,'n*2;
 c:flip (Dfi each n[;0]),'Dfi each n[;1];
 c:c[;(til count c[0;])[where not sum c=0]];
 i:1; do[9; c:c[;(til count c[0;])[where max c=i]]; i+:1];
 max 10 sv c}

/Integer right triangles                                             \ts 261 30216272
p039:{
 b:sqrt sum each t*t:n cross n:til 499;
 p:sum each(t,'floor b)@where{x=floor x}b;
 P:p@where 1000>p;
 e:value group P;
 first P e@first reverse iasc count each e}

/Champernowne's constant                                             \ts 488 65554736
p040:{prd eval parse raze " ",'(raze string til floor 1e6)@floor 10 xexp til 7}

/Pandigital prime                                                    \ts 2880 415703408
p041:{
 p:Primes floor 8e6; 
 p:p[where (1234566<p)&p<7654322];
 r:flip Dfi each p;
 i:1; do[7; r:r[;(til count r[0;])[where max r=i]]; i+:1];
 max 10 sv r}

/Coded triangle numbers                                              \ts 6 213696
p042:{"j"$sum ((sum -64+"j"$)each eval parse "(",ssr[raze read0 `t042.txt;",";";"],")")in{floor .5*x*1+x}@til 99}

/Sub-string divisibility                                             \ts 6 88192
p043:{
 s:(17*til 59; 13*til 77; 11*til 91; 7*til 143; 5*til 200; 3*til 334; 2*til 500); r:Dpi[3;s[0]]; i:1;
 do[6; d:Dpi[3;s[i]]; a:d mod 100; b:floor r%p:10 xexp i; c:r[where b in a]; e:d[where a in b]; b:c[(floor c%p)?e mod 100];
  r:Dpi[i+3;floor(b mod p)+e*p]; i+:1];
 floor sum r + 4 4 4 1 1 1 *1e9}
pDfi:{(neg x)#(x#0),"J"$(string y),'" "} /padded Digits from integer (arbitrary number=x)
Dpi:{c:count each distinct each pDfi[x;] each y; y[where c=max c]} /Distict padded integers

/Pentagon numbers                                                    \ts 736 393488
p044:{
 n:1+til 5000; p:floor .5*n*-1+3*n; q:(floor .5*count p)#p; k:r:0; 
 while[(r=0)&k<count q; s:q+q[k]; d:abs q-q[k]; S:(1+sqrt 1+24*s)%6; D:(1+sqrt 1+24*d)%6;
  c:q[where (S=floor S)&D=floor D]; if[0<count c; r:first abs c-q[k]]; k+:1];
 r}

/Triangular, pentagonal and hexagonal                                \ts 50 5767360
p045:{
 t:{floor .5*x*x+1}til 80000; p:{floor .5*x*-1+3*x}til 47000; h:{floor x*-1+2*x}til 41000;
 a:t[where t in h]; b:t[where t in p];
 first reverse a[where a in b]}

/Goldbach's other conjecture                                         \ts 149 408432
p046:{
 p:Primes floor 1e4;
 c:1+2*til 3000; c:c[where not c in p]; k:7; j:0;
 while[k<count c; q:p[where p<c[k]]; a:sqrt .5*c[k]-q; k+:1; if[1=min a<>floor a; j:k; k:count c]];
 c[j-1]}

/Distinct primes factors                                              \ts 2291 1955168
p047:{
 p:Primes 45000;
 c:{count a[where a=floor a:y%x]}[p;]each n:130000+til 5000;
 first n[where (4=c)&(4=1_c,0)&(4=2_ c,0 0)&4=3_ c,0 0 0]}

/Self powers                                                          \ts 930 16560
p048:{
 n:1000; a:1+til n; i:j:0;
 while[i<n; while[j<i; a[i]:(floor a[i]*i+1)mod 10000000000; j+:1]; j:0; i+:1];
 i:t:0; while[i<n; t:(t+a[i])mod 10000000000; i+:1];
 t}

/Prime permutations                                                   \ts 3643 408416
p049:{
 p:Primes 10000; p:p[where p>999]; m:p,'p,'p; k:1;
 while[k<9000; v:m; v[;1]:p+k; v[;2]:floor p+2*k; v:v[where (v[;1]in p)&v[;2]in p];
  if[0<count v; v:cull v];
  k+:1; if[0<count v; k:9000];];
 raze 1_ v}
cull:{
 a:xpd x[;0]; b:xpd x[;1]; c:xpd x[;2];
 s:(count a),count a[0]; A0:s#a[0;]; A1:s#a[1;]; A2:s#a[2;]; A3:s#a[3;];
 j0:sum a=A0; j1:sum a=A1; j2:sum a=A2; j3:sum a=A3;
 a:(j0=sum b=A0)&(j0=sum c=A0)&(j1=sum b=A1)&(j1=sum c=A1)&(j2=sum b=A2)&(j2=sum c=A2)&(j3=sum b=A3)&j3=sum c=A3;
 x:x[where a]};
xpd:{flip (floor x%1000),'((floor x%100)mod 10),'((floor x%10)mod 10),'x mod 10} /extract padded digits

/Consecutive prime sum                                                \ts 193 48943472
/ 546 is the most consecutive primes for which the sum is < 1e6    sum 546#p   evaluates to 997661 (not prime)
p050:{
 p:Primes floor 1e6; s:sums p; i:545;
 while[0>r:tstSum[i;s;p]; i-:1];
 max r}
tstSum:{ t:((x-1)_y)-0,(neg x)_y; t:t[where y<1e6]; max t[where t in z]}

/Prime digit replacements                                             \ts 2544 66046800
p051:{
 p:Primes floor 1e6;
 s:raze (distinct f)@where 8=count each value group f:raze fmls each string p;
 eval parse ssr[s;"n";"1"]}
pset:{(enlist ()){x,x,\:y}/x};  /power set
fmls:{@[x; ; :; "n"]each raze 1_' pset each value group x}  /families

/Permuted multiples                                                   \ts 2557 832
p052:{i:0; while[not min (1 rotate v)~v:{x@iasc x}each string(2+til 4)*i+:1]; i}

/Combinatoric selections                                              \ts 63 382480
p053:{"j"$sum 1e6<Cmb .'1+{raze x,/:' til each x:til x}100}
Fac:{prd 1.+til x};
Cmb:{Fac[x]%Fac[y]*Fac x-y}

/Poker hands                                                          \ts 68 552880
p054:{hands:{2 5#split[" "]x}each read0 `t054.txt; "j"$sum(>/)each(rateHand each)each hands}
split:{1_'(where s=x)_ s:x,y};
ranks:{s@idesc s:flip(count each value group x;"23456789TJQKA"?/:distinct x)}
flush:{(&/)(=/)each(-1_x),'1_x}
flattenRanks:{raze(#/)each x}
straight:{(9 1 1 1~s)|1 1 1 1~s:(-/)each(-1_x),'1_x}
rateHand:{ / sort the hand, then construct an int with the value
 r:ranks x[;0]; f:flattenRanks r; s:straight f; fl:flush x[;1];
  $[s&fl;       16 sv 9,f; 4=first first r; 16 sv 8,f;
   3 2~r[;0];   16 sv 7,f; fl;              16 sv 6,f;
   s;           16 sv 5,f; 3=first first r; 16 sv 3,f;
   2 2 1~r[;0]; 16 sv 2,f; 2=first first r; 16 sv 1,f;
                16 sv 0,f]}

/Lychrel numbers                                                      \ts 1198 5243216
p055:{   /by trial, only 24 reps are needed
 reps:24; m:(reps,9990)#0; m[0]:pr each 10+til 9990; i:0; do[reps-1; m[i+1]:pr each m[i]; i+:1];
 "j"$sum not max each flip (pal each)each m}
pal:{a~reverse a:string x};
pr:{x+eval parse reverse string x};

/Powerful digit sum                                                   \ts 771 5440
p056:{k:1; n:99#0; while[k<100; n[k-1]:psum[99;k]; k+:1]; max n}
psum:{ k:0; d:pDfi[200;x];
 while[k<y-1; d:x*d; if[0=k mod 5; j:199; while[j>0; c:floor d[j]%10; d[j]:d[j]mod 10; d[j-1]:d[j-1]+c; j-:1];]; k+:1];
 j:199; while[j>0; c:floor d[j]%10; d[j]:d[j] mod 10; d[j-1]:d[j-1]+c; j-:1];
 sum d}

/Square root convergents                                              \ts 3374 25072
p057:{
 s:1002; d2:501#0; d1:(500#0),1; k:3; c:0;
 while[k<s; d:adj[floor d2+2*d1]; n:adj[d+d1]; if[((n>0)?1b)<(d>0)?1b; c+:1]; d2:d1; d1:d; k+:1];
 c}
adj:{k:-1+count a:x; while[k>0; a[k-1]:a[k-1]+floor a[k]%10; a[k]:a[k]mod 10; k-:1]; a}

/Spiral primes                                                        \ts 54352 48943472
p058:{p:Primes floor 1e6; r:fe[2 3 5;p]; while[0<>fa r; r:fe[r;p]]; -1+2*first r}
fa:{not 0.1>x[1]%x 2};
fb:{not sum not x mod/:(2+y bin floor sqrt x)#y};
fc:{(1+2*x*-1+2*x)+\0,3#2*x};
fd:{sum fb[;y]each(fc x)};
fe:{x+(1;fd[first x;y];4)};

/XOR decryption                                                       \ts 20552 683200
p059:{
 c:first read0 `t059.txt; c[where c=","]:" "; c:eval parse c;
 a:128#" "; a[til 32]:"_"; a[32+til 32]:" !\"#$%&'()*+,-./0123456789:;<=>?";
 a[64+til 32]:"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"; a[96+til 32]:"`abcdefghijklmnopqrstuvwxyz{|}~_";
 C:(-8#)each 0b vs'c; L:"abcdefghijklmnopqrstuvwxyz"; i:j:k:f:0;
 while[i<26;
  while[j<26;
   while[k<26; K:(-8#)each 0b vs'a?(count c)#L[i,j,k]; s:a[(sum(128 64 32 16 8 4 2 1)*)each(C+K)mod 2]; k+:1;
    if[(&/)not"~%$`" in s; Key:i,j,k-1; k:25+f:1; r:s]; ];
   k:0; j+:1; if[f=1; j:26]; ];
  j:k:0; i+:1; if[f=1; i:26]; ];
 sum a?r}

/Cyclical figurate numbers                                            \ts 8 151008
p061:{
 f:({(x*x+1)%2};{1*x*x};{(x*-1+3*x)%2};{x*-1+2*x};{x*(-3+5*x)%2};{x*-2+3*x});
 r:{floor x[where (999<x)&(x<10000)&9<x mod 100]}each f@/:\:til 1500;
 a:4 1 0 2 3 5 4; b:5 4 1 0 2 3 5; i:0; do[7; r[a[i]]:{x[where(x mod 100) in\:floor y%100]}[r[a[i]];r[b[i]]]; i+:1];
 a:5 3 2 0 1; b:4 5 3 2 0; i:0; do[5; r[a[i]]:{x[where(floor x%100) in\:y mod 100]}[r[a[i]];r[b[i]]]; i+:1];
 sum raze r}

/Cubic permutations                                                   \ts 45 1324176
p062:{
 n:{-13#(12#" "),x}each string "j"$(til 8400)xexp 3;
 g:group{x@iasc x}each n;
 eval parse first first n@g[where 5=count each g]}

/Powerful digit counts                                                \ts 0 6336
p063:{"j"$(sum/)(til n)=floor log[(1+til 9)xexp \:/:1+til n:count {0.1<(%/)x}(9 10*)\1 1.]%log 10}

/Convergents of e                                                     \ts 43 7728
p065:{
 v:50 3#1; v[;1]:2*1+til 50; v:100#2,raze v;
 N:(59#0),1; D:(59#0),-1#v; i:-2+count v;
 while[i>-1; NN:s65@D*v[i]; N:s65@N+NN; x:D; D:N; N:x; i-:1];
 sum D}
s65:{i:59; while[i>0; x[i-1]:x[i-1]+floor x[i]%10; x[i]:x[i] mod 10; i-:1]; x}

/Maximum path sum II                                                  \ts 4 97312
p067:{
 t:read0 `t067.txt;
 n:100#(::); n[0]:"J"$t[0]; i:1; do[99; n[i]:"J"$3 cut t[i]; i+:1]; n:reverse n;
 first 0{y+max echPr x}/n}

/Totient maximum                                                      \ts 268 25166112
p069:{
 a:2 3 5 7 11 13 17; k:0; t:(floor 1e6)#1;
 while[k<count a; b:floor 1e6%a[k]; s:(floor 1e6)#0; s[a[k]*til b]:1; t:t&s; k+:1];
 first 1_ (til floor 1e6)[where t]}

/Ordered fractions                                                    \ts 191 12583184
p071:{
 k:floor 1e6; n:1; d:3;
 while[k>999995; a:max(til floor k%2)[where ((til floor k%2)%k)<3%7]; if[(a%k)>n%d; n:a; d:k]; k-:1];
 n}

/Counting fractions                                                   \ts 4560 177696912
p072:{"j"$first sum tot 2+til -1+floor 1e6}
upf:{     /unique prime factors
 m:max x; p:Primes m+1; a:(m-1)#(); a[p-2]:enlist each p; k:0;
 while[p[k]<=floor m%2; j:1_ p[k]*1+til floor m%p[k]; a[j-2]:a[j-2],'(count j)#p[k]; k+:1];
 a[x-2]}
tot:{x*raze prd each 1-1%upf x}

/Counting fractions in a range                                        \ts 13403 533744
p073:{
 c:0; d:2;
 while[d<=12000;
  n:(floor d%3)+til 1+(floor d%2)-floor d%3;
  c+:sum(d>2*n)&(d<3*n)&1=(gcD(enlist((count n)#d)),enlist n)[0];
  d+:1];
 c}
gcD:{while[0<count i:where x[1]<>0; x[;i]:.z.s[(enlist x[1;i]),enlist x[0;i] mod x[1;i]]]; x}

/Digit factorial chains                                               \ts 4497 80777568
p074:{
 n:Ndp 1000000; r:"j"$(); i:0;
 do[count n; if[60=cL n[i]; r,:n[i]]; i+:1];
 "j"$sum Cdfp each r}
sdF:{sum(1 1 2 6 24 120 720 5040 40320 362880)"J"$(string x),'" "}  /sum of digit Factorials
cL:{c:"j"$(); n:sdF[x]; while[not n in c; c,:n; n:sdF[n]]; 1+count c} /chain length
Cdfp:{n:string x; $[not "1" in n; Npr n; (Npr n)+(Fac -1+count n)*-1+count n]}  /Count of digit factorial permutations

/Counting summations                                                  \ts 34 5472
p076:{v76::1.0,100#0; "j"$s76[100]-1}
s76:{
 $[x<0; :0; x=0; :1; v76[x]<>0; r:v76[x];
  [r:0; k:1; while[k<x+1; r:r+(-1 xexp k+1)*(.z.s[floor x-{.5*x*-1+3*x}k])+.z.s[floor x-{.5*x*-1+3*x}(neg k)]; k+:1]; v76[x]:r]];
 r}

/Passcode derivation                                                  \ts 0 9728
p079:{
 t:read0 `t079.txt; n:((count t),3)#0; i:0; do[3; n[;i]:Nfd t[;i]; i+:1];
 d:distinct raze n; c:"j"$();
 do[7; c,:d[where not d in raze 1_'n]; d:d[where not d in c];
  i:where(first reverse c)=n[;0]; n[i]:1_'n[i]];
 c,:d[where d in raze n];
 c}

/Path sum:two ways                                                    \ts 25 189616
p081:{
 m:read0 `t081.txt; d:80 80#0; i:0; do[80; t:m[i]; t[where t=","]:" "; d[i]:eval parse t; i+:1];
 d[;79]:reverse sums reverse d[;79]; d[79;]:reverse sums reverse d[79;]; j:k:78;
 while[j>-1;
  while[k>-1;
   d[j;k]:d[j;k]+min d[j+1;k],d[j;k+1]; k-:1];
   k:78; j-:1];
 d[0;0]}

/Counting rectangles                                                  \t 21 873456
p085:{
 r:{(x*(x+1)*y*y+1)div 4};
 p:raze(til 100),/:\:til 100;
 (prd each p)d?min d:abs(r .' p)-2000000}

/Square digit chains                                                  \ts 31525 991088880
p092:{
 b:a:1_ Ndp 10000000; v:"j"$();
 while[0<count b; b:Ssd Pds b; v,:a[where b=89]; b:b[i:where (b<>1)&b<>89]; a:a[i]];
 "j"$sum Npr each Pds v}
Ndp:{a[where a="J"${x[iasc x]}each 1_'string x+a:til x]};  /numbers w distinct permutations below x
Nln:{floor 10 xexp count string max x};  /Next level number
Pds:{1_'string Nln[x]+x};  /Padded digit strings
Nfd:{"J"$" ",'x};  /Numbers from string of digits
Ssd:{r:((count x),c:count x[0])#0; k:0; while[k<c; r[;k]:Nfd x[;k]; k+:1]; sum each r*r};  /Sum squares of digits
Npr:{(Fac sum a)%prd Fac each a:count each value group x}  /Number of permutaions

/Large non-Mersenne prime                                             \ts 43 2128
/  (1+28433*2 xexp 7830457) is equivalent to 1+28433*2*(16777216 xexp 509)xexp 641
p097:{
 p:s097a n:16777216; k:0; while[k<508; n:floor(sum s097 .' n,/:p )mod 1e10; k+:1];
 p:s097a n; k:0; while[k<640; n:floor(sum s097 .' n,/:p)mod 1e10; k+:1];
 n:floor (2*n)mod 1e10; p:s097a 28433; k:0; 1+floor(sum s097 .' n,/:p)mod 1e10}
s097:{[n;d;a;b](floor 10 xexp a)*(n*d)mod floor 10 xexp b};
s097a:{c:count d:Dfi x; p:d,'((c-1)-til c),'(11-c)+til c};

/Largest exponential                                                  \ts 4 185600
p099:{
 t:raze " ",/:read0 `t099.txt; t[where t=","]:" "; t:1000 2#eval parse t;
 1+first idesc{x[1]*log first x}each t}

/Bouncy numbers                                                       \ts 6512 116678768
p112:{a:(sum s112 100+til 1499900)+sums s112 b:1500000+til 100000; 1500000+(a%b)?.99}
s112:{{not (x~x[iasc x])|x~x[idesc x]}each string x}

/Concealed square                                                     \ts 10 1313296
p206:{
 a:s206a[s206[30 70;2;100];8;5]; b:s206a[s206[a;4;100];7;7]; c:s206a[s206[b;6;100];6;9]; d:s206[c;8;14];
 e:d[where (d>floor sqrt 1010000000000000000)&d<floor sqrt 1929394959697989900];
 i:5; j:11; do[5; e:s206a[e;i;j]; i-:1; j+:2];
 "j"$first e}
s206:{raze x+/:\:(10 xexp y)*til z}
s206a:{x[where y=floor((x*x)mod 10 xexp z)%10 xexp z-1]}

/Prime generating integers                                            \ts 285549 1207976192
p357:{
 m:100000000; a:m#0b; p:Primes floor sqrt m;
 i:0; while[i<count p; b:p[i]; a[b+b*1+til -2+floor .5+m%b]:1b; i+:1];
 r:"j"$(); i:0;
 do[10; b:(i*10000000)+til 10000000; c:a[b]; n:b[where(not((1_c),1)) & not a[2+b div 2]];
  j:0; while[j<count n; d:1+til floor sqrt n[j]; d:d[where 0=n[j]mod d]; if[min not a[d+n[j]div d]; r,:n[j]]; j+:1];
  i+:1];
 sum r}




\
/The following C solution to p357 executes in 8.6 seconds vs the above q solution in 4.7 minutes.
/There may be some further refactoring possible to speed up the q solution.

#include <stdio.h>
#define N 100000000
char a[N];
int main() {
 int d,i,j,n; long long r=1;
 for(i=2;i<10000;i++) if(!a[i]) for(j=i+i;j<N;j+=i) a[j]=i;
 for(n=2;n<N-1;n++)
  if(!a[n+1] && !a[n/2+2]) {
   for(d=3;d*d<=n;d++) if(n%d==0 && a[d+n/d]) break;
   if(d*d>n) r+=n; }
 printf("%lld\n",r);
 return 0; }

