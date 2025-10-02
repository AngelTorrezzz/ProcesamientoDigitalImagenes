clear all
imtool close all

%Seleccion de imagenes
im1 = imread('../Imagenes/taza.bmp');
%im2 = imread('../Imagenes/manzana.bmp');
%im3 = imread('../Imagenes/angio.bmp');

%Imagenes originales
figure; imshow(im1);
imtool(im1,[]);
%figure; imshow(im2);
%imtool(im2,[]);
%figure; imshow(im3);
%imtool(im3,[]);

%
[M,N] = size(im1);
imhist(im1);

% nk1: numero de pixeles con intensidad rk1
[nk1,rk1] = imhist(im1);
%[nk2,rk2] = imhist(im2);
%[nk3,rk3] = imhist(im3);

% Total de pixeles de la imagen
tot1 = sum(nk1);
%tot2 = sum(nk2);
%tot3 = sum(nk2);

%  - Histograma normalizado
prk1 = nk1/tot1;
%prk2 = nk2/tot2;
%prk3 = nk3/tot3;

sk1 = zeros(1,256);

% T(rk) - Suma acumulada
acumprk1 = cumsum(prk1)*255;
%acumprk2 = cumsum(prk2)*255;
%acumprk3 = cumsum(prk3)*255;

sk1 = acumprk1;

%Redondeo
acumprk1 = round(acumprk1);
%acumprk2 = round(acumprk2);
%acumprk3 = round(acumprk3);

%
imNueva1 = uint8(acumprk1(im1+1)); % +1 debido a
%imNueva2 = uint8(acumprk2(im2+1));
%imNueva3 = uint8(acumprk3(im3+1));

%
imtool(imNueva1);
%imtool(imNueva2);
%imtool(imNueva3);

