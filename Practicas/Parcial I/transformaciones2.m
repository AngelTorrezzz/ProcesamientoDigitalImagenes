clear all
imtool close all

fileIn = '../Imagenes/tools3.bmp';
I = imread(fileIn);
imtool(I,[]);

%Gamma
gamma = 2.5;
J = double(I).^gamma;
imtool(J); %Sin corchetes por que remapea en un rango de valores visibles

%Log
c = 3.0;
H = c*log(J+1);
imtool(H,[]);
min(min(H));