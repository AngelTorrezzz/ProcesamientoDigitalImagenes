fileIn = '../Imagenes/tools3.bmp';
I = imread(fileIn);
imtool(I,[]);

A = escala05Simple(I);
A = uint8(A); %Regresa al formato de imagen
imtool(A);

B = escala2Simple(I);
B = uint8(B); %Regresa al formato de imagen
imtool(B);

%C = escala2Promedio(I);
%C = uint8(C); %Regresa al formato de imagen
%imtool(C);