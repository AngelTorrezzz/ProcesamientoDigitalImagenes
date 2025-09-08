imtool close all;
clear all
tam = 256;

A = imread('../Imagenes/manzana.bmp');

[M,N] = size(A);
%A = zeros(tam);
%A = 

C = zeros(M,N);
ang = 45;
teta = ang*pi/180;
matrizRotacion = [cos(teta) -sin(teta); sin(teta) cos(teta)]';
for i=1:M
    for j=1:N
        nuevasCoords = matrizRotacion*[i j]';
        ip = fix(nuevasCoords(1)+0.5);
        jp = fix(nuevasCoords(2)+0.5);
        if(ip > 0 && ip < M && jp > 0 && jp < N)
            C(i,j) = A(ip,jp);
        end
    end
end
imtool(A,[]);
%imtool(B,[]);
imtool(C,[]);
%imtool(D,[]);

Mat = imrotate(A,ang);
%imtool(Mat);

