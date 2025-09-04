clear all; %Limpia memoria de matlab
imtool close all;

A = zeros(256);
B = zeros(256);
A(128-50:128+50,128-50:128+50)=1; %A(filas , columnas)
B(128-100:128+100,128-25:128+25)=1; %B(filas , columnas)
%imtool(A,[]);
%imtool(B,[]);

Z = (A&B);
%imtool(Z,[]);
R = (A|B);
%imtool(R,[]);
E = (~B);
%imtool(E,[]);
D = (A&(~B)); %diferencia A-B = A&~B
%imtool(D,[]);

%Desplegar varias imagenes
figure;
subplot(3,2,1); imshow(A,[]); title('A');
subplot(3,2,2); imshow(B,[]); title('B'); 
subplot(3,2,3); imshow(Z,[]); title('Z = A&B');
subplot(3,2,4); imshow(R,[]); title('R = A|B');
subplot(3,2,5); imshow(E,[]); title('E = ~B');
subplot(3,2,6); imshow(D,[]); title('D = A-B o A&~B');