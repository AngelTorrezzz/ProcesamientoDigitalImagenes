function G = filtroGaussEspacio(sigma)
%Gaussiano PasaBajas en el dominio del espacio

n = ceil(6*sigma);
if(mod(n,2)==0)
    n = n+1;
end

G = zeros(n);
cx = ceil(n/2);
cy = ceil(n/2);
disp(n)
disp(cx)
dips(cy)

%n = 3

for x=1:n
    for y=1:n
        d=((x-cx)*(x-cx) + (y-cy)*(y-cy));
        z= d/(2*sigma*sigma);
        G(x,y) = exp(-z);
    end
end