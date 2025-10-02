clear all; %Limpia memoria de matlab
imtool close all;

ImgA = imread('../Imagenes/taza.bmp');
ImgB = imread('../Imagenes/bola.bmp');

%Union
ImgC = max(ImgA,ImgB);

%Intersección
ImgD = min(ImgA,ImgB);

%Complemento
ImgE = 255-ImgC;

figure;
subplot(3,3,1); imshow(ImgA,[]); title('A');
subplot(3,3,2); imshow(ImgB,[]); title('B'); 
subplot(3,3,3); imshow(ImgC,[]); title('C = max(A,B)');
subplot(3,3,4); imshow(ImgD,[]); title('D = min(A,B)');
subplot(3,3,5); imshow(ImgE,[]); title('E = 255-C');

%¿Cuál sería la diferencia ImgC-ImgB? ImgC & (~ImgB)
ImgR = min(ImgC,(ImgE));
imtool(ImgR,[]);