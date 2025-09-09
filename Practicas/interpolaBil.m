[M,N] = size(I);
x = floor(xp);
y = floor(yp);

%x+1
x1 = x+1;
y1 = y+1;
d1 = fabs(xp - x);

%Jval = J(x*,y*)
Jval = 0;

if(x > 0 && x <= M)
    Jval = Jval + betaH*betaV*I(x,y);
end