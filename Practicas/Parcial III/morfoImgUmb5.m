close all
clear all
imtool close all

%Imagen
Img = imread("../../Imagenes/tools.bmp");
Img = im2double(Img);

h = ones(3);

%ISeg1 = UmbralMultiOtsu(Img,256);
%figure; imshow(ISeg1,[]);

ISeg = UmbralSimple(Img);
figure; imshow(ISeg,[]);

BW = (ISeg == 0);
figure; imshow(BW,[]); title("Region 1");

L = bwlabel(BW,4);

%Numero de regiones
nRegiones = max(max(L));
disp(nRegiones);
ImgR1 = (L == 1)*1.0;
ImgR2 = (L == 2)*1.0;
ImgR3 = (L == 4)*1.0;

% Dilatación con un disco de radio r=3
r = 3;
se = strel('disk', r);

dilated1 = imdilate(ImgR1, se);
figure; 
subplot(1,2,1); imshow(Img); title('Region');
subplot(1,2,2); imshow(dilated1,[]); title('Dilatación-disco3');

% Erosión con un disco de radio r = 3
eroted1 = imerode(ImgR1, se);
ImgR1N = ~(ImgR1);
eroted2 = imerode(ImgR1N, se);

% Cerradura con un disco de radio r = 3
close1 = imclose(Img, se);

% Apertura con un disco de radio r = 3
open1 = imopen(ImgR1, se);


% Esqueleto
skel1 = bwmorph(ImgR1, 'skel', inf);
skel2 = bwmorph(open1, 'skel', inf);

figure;
subplot(2,3,1); imshow(Img,[]); title("Imagen Original");
subplot(2,3,2); imshow(ISeg,[]); title("Umbral Simple");
subplot(2,3,3); imshow(ImgR1,[]); title("Región 1");
subplot(2,3,4); imshow(dilated1,[]); title("Dilatación r=3");
subplot(2,3,5); imshow(skel1,[]); title("Esqueleto de Región 1");
subplot(2,3,6); imshow(skel2,[]); title("Esqueleto de Región 2");