clear all; %Limpia memoria de matlab
imtool close all;

Img = imread('../Imagenes/taza.bmp');

ImgEuclideana = Img;
ImgD4 = Img;
ImgD8 = Img;

%Encuentra los indices en filas y columnas de la matriz 
[IndicesX, IndicesY] = find(Img >= 0);

%Encuentra los indices lineales
[IndM] = find(Img >= 0);

%Encuentra los indices lineales de la matriz [idnM] = find(m>0)
centroX = 50;
centroY = 50;

%Poisicion de los pixeles dentro de un ciruclo de radio 10 y centro en ()
distEuclidenada= ((IndicesX - centroX).*(IndicesX - centroX) + (IndicesY - centroY).* (IndicesY - centroY));
ImgEuclideana(distEuclidenada <= 100) = 255;
%figure; imshow(ImgEuclideana);

%Poisicion de los pixeles dentro de un diamante de radio 10 y centro en ()
distDiam = abs(IndicesX-centroX) + abs(IndicesY-centroY);
ImgD4(distDiam <= 10) = 255;
%figure; imshow(ImgD4);

%Posicion de los pixeles dentro de un diamaete de radio 10 y centro en ()
distCuad = max(abs(IndicesX-centroX), abs(IndicesY-centroY));
ImgD8(distCuad <= 10) = 255;
%figure; imshow(ImgD8);


figure;
subplot(2,2,1); imshow(Img,[]); title('Imagen');
subplot(2,2,2); imshow(ImgEuclideana,[]); title('Euclidenada');
subplot(2,2,3); imshow(ImgD4,[]); title('D4');
subplot(2,2,4); imshow(ImgD8,[]); title('D8');