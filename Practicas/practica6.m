fileIn = '../Imagenes/tools3.bmp';
I = imread(fileIn);
imtool(I,[]);

J = escala2Simple(I);
J = uint8(J); %Regresa al formato de imagen
imtool(J);

%G = escala2Media(I);
%G = uint8(G); %Regresa al formato de imagen
%imtool(G);

%H = escalaUnMedio(I);
%H = uint8(H); %Regresa al formato de imagen
%imtool(H);

%K = escala2Promedio(I);
%K = uint8(K); %Regresa al formato de imagen
%imtool(K);