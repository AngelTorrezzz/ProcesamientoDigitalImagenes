close all;
ImgA=imread('./imagenes/taza.bmp');
ImgB=imread('./imagenes/manzana.bmp');
J = imnoise(ImgA,'salt & pepper',0.02);
imshow(J); title('salt & pepper');
JG = imnoise(ImgB,'gaussian',0.02,0.01); %media = 0.02, varianza = 0.01
figure; imshow(JG); title('gaussian');
JP = imnoise(ImgB,'poisson');
figure; imshow(JP); title('poisson');