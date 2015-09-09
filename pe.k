
/Counting fractions in a range                                        /t 43475
p073:{+/(+/1={:[~x;y;_f[y;x!y]]}.'{x,/:{x+!1+y-x}.+{(1+_ x%3;_ x%2)}x}@)'1+2_!12000}

p073a:{+/(+/1=gd .'gc @)'1+2_!12000};
gd:{:[~x;y;_f[y;x!y]]};
gc:{x,/:gb .+ga x};
gb:{x+!1+y-x};
ga:{(1+_ x%3;_ x%2)};
