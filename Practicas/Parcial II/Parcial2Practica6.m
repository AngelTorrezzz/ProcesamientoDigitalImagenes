%Aplicar a una imagen los siguientes filtros:
%Filtros estadísticos (8-vecinos): MAX, MIN y Promedio 
%Filtro suavizantes: Caja, promedio pesado y Gaussiano
%Filtros realzantes:
%Gradiente, desplegar el resultado de las parciales y la magnitud
%Laplaciano

clear all
close all

ImgOrg = imread ('../../Imagenes/cara.bmp');

%Recomendable convertir a double imagen
I = double(ImgOrg);
[filas, columnas] = size(I);

%-----------------------ESTADISTICOS-----------------------%
FiltroMax = zeros(filas, columnas);
FiltroMin = zeros(filas, columnas);
FiltroMedia = zeros(filas, columnas);
for i = 2:filas-1
    for j = 2:columnas-1
        
        % Extraer la vecindad 3x3
        ventana = I(i-1:i+1, j-1:j+1);
        
        % Calcular valores estadísticos
        FiltroMax(i,j) = max(ventana(:));       % Valor máximo
        FiltroMin(i,j) = min(ventana(:));       % Valor mínimo
        FiltroMedia(i,j) = mean(ventana(:));    % Promedio
    end
end

figure;
subplot(2,2,1); imshow(ImgOrg,[]); title('Imagen Orginal');
subplot(2,2,2); imshow(FiltroMax,[]); title('Filtro MAX');
subplot(2,2,3); imshow(FiltroMin,[]); title('Filtro MIN');
subplot(2,2,4); imshow(FiltroMedia,[]); title('Filtro Media');

%-----------------------SUAVIZANTES-----------------------%
%Filtro Caja
W=[1 1 1; 1 1 1; 1 1 1]/9; %Máscara
FiltradoCaja=imfilter(I,W,0,'conv');

%Filtro Pesado
W=[1 2 1; 2 4 2; 1 2 1]/16; %Máscara Pesada
FiltradoPesado=imfilter(I,W,0,'conv');

%Filtro Gaussiano
sigma = 0.5;
W3 = FiltroGaussEspacio(sigma);
factor = sum(sum(W3));
W3 = FiltroGaussEspacio(sigma)*1/factor;
FiltradoGaussiano = imfilter(I, W3,0,'conv');

figure;
subplot(2,2,1); imshow(ImgOrg,[]); title('Imagen Original');
subplot(2,2,2); imshow(FiltradoCaja,[]); title('Filtro de Caja');
subplot(2,2,3); imshow(FiltradoPesado,[]); title('Filtro Promedio Pesado');
subplot(2,2,4); imshow(FiltradoGaussiano,[]); title('Filtro Gaussiano');

%-----------------------REALZANTES-----------------------%
% Mascara de la derivada parcial en X
Wx = [ -1 -2 -1; 0 0 0; 1 2 1 ];
% Mascara de la derivada parcial en Y
Wy = [ -1 0 1; -2 0 2; -1 0 1 ];

% Derivadas parciales
Gx = imfilter(I,Wx); %Otra manera
Gy = imfilter(I,Wy); %Otra manera

% Magnitud del gradiente
Gmag = sqrt(Gx.^2 + Gy.^2);

%Mascara Laplaciana
WL=[-1 -1 -1; -1 8 -1; -1 -1 -1];   
ImgLap1=imfilter(I,WL);

figure;
subplot(2,3,1); imshow(I,[]);title("Imagen Orginal");
subplot(2,3,2);imshow(uint8(abs(Gx))); title('Derivada parcial en X');
subplot(2,3,3);imshow(uint8(abs(Gy))); title('Derivada parcial en Y');
subplot(2,3,4);imshow(uint8(Gmag)); title('Magnitud del Gradiente');
subplot(2,3,5); imshow(ImgLap1,[]);title("Filtro Laplaciano");