clear all; %Limpia memoria de matlab
imtool close all;

Img = imread('../Imagenes/taza.bmp');
figure; imshow(Img)

ImgC = Img;
ImgD4 = Img;
ImgD8 = Img;

%Encuentra los indices en filas y columnas de la matriz
[IndicesX, InidicesY] = find(Img >= 0);

%Encuentra os indices (lineales) de la matriz
[indM] = find(Img >= 0);

%Encuenrra los indices (lineales) de la matriz [indM] = find(m > 0)
centroX = 50;
centroY = 50;

%Posicion de los pixeles dentro de un circulo de radio 10 y
distCirc = ((IndicesX-centroX).*(IndicesX-centroX) + (IndicesY-centroY).*(IndicesY-centroY));
ImgC(distCirc <= 100) = 255;