close all
imtool close all
ImgOrg = imread("../../Imagenes/taza.bmp");

RuidoGaussiano = imnoise(ImgOrg, "gaussian", 0.02, 0.01);

%Filtro Caja
W=[1 1 1; 1 1 1; 1 1 1]/9; %Máscara
FiltradoCaja=imfilter(RuidoGaussiano,W,0,'conv');

%Filtro Pesado
W=[1 2 1; 2 4 2; 1 2 1]/16; %Máscara Pesada
FiltradoPesado=imfilter(RuidoGaussiano,W,0,'conv');

%Filtro Gaussiano
sigma = 0.5;
W3 = FiltroGaussEspacio(sigma);
factor = sum(sum(W3));
W3 = FiltroGaussEspacio(sigma)*1/factor;
FiltradoGaussiano = imfilter(RuidoGaussiano, W3,0,'conv');

%Visualizacion
figure;
subplot(3,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(3,2,2); imshow(RuidoGaussiano,[]); title('Ruido Gaussiano');
subplot(3,2,3); imshow(FiltradoCaja,[]); title('Filtrado de Caja');
subplot(3,2,4); imshow(FiltradoPesado,[]); title('Filtrado Pesado');
subplot(3,2,5); imshow(FiltradoGaussiano,[]); title('Filtrado Gaussiano');
subplot(3,2,6); imshow(W3,[]); title('Mascara Gaussiana');