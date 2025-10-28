ImgOrg = imread ('../../Imagenes/tools3.bmp');
imtool(ImgOrg,[]);

%Recomendable convertir a double imagen
J = double(ImgOrg);

%Filtro de caja de 3x3
w1 = [1 1 1; 1 1 1; 1 1 1]; %Suaviza

%Convolución
ConvolucionSuavizante = imfilter(J,w1,0,'conv')*1/9; 

%Máscara de detalles
MascaraDetalles = J - ConvolucionSuavizante;

%Aplicar filtrado High-Boost
k1 = 1; % Factor de refuerzo
HighBoost1 = J + (k1) * MascaraDetalles;

k10 = 10; % Factor de refuerzo
HighBoost10 = J + (k10) * MascaraDetalles;

k100 = 100; % Factor de refuerzo
HighBoost100 = J + (k100) * MascaraDetalles;

%Normalizar para visualización
ImgSuavizada = uint8(ConvolucionSuavizante);
ImgMascara = uint8(MascaraDetalles);
ImgHighBoost1 = uint8(HighBoost1);
ImgHighBoost10 = uint8(HighBoost10);
ImgHighBoost100 = uint8(HighBoost100);

%Resultados
figure;
subplot(2,2,1), imshow(uint8(J)), title('Imagen Original');
subplot(2,2,2), imshow(ImgHighBoost1), title(['Imagen High-Boost (k = ', num2str(k1), ')']);
subplot(2,2,3), imshow(ImgHighBoost10), title(['Imagen High-Boost (k = ', num2str(k10), ')']);
subplot(2,2,4), imshow(ImgHighBoost100), title(['Imagen High-Boost (k = ', num2str(k100), ')']);


%Resultados
%figure;
%ubplot(3,2,1), imshow(uint8(J)), title('Imagen Original');
%subplot(3,2,2), imshow(ImgSuavizada), title('Imagen Suavizada');
%subplot(3,2,3), imshow(ImgMascara), title('Máscara de Detalles');
%subplot(3,2,4), imshow(ImgHighBoost1), title(['Imagen High-Boost (k = ', num2str(k1), ')']);
%subplot(3,2,5), imshow(ImgHighBoost10), title(['Imagen High-Boost (k = ', num2str(k10), ')']);
%subplot(3,2,6), imshow(ImgHighBoost100), title(['Imagen High-Boost (k = ', num2str(k100), ')']);
