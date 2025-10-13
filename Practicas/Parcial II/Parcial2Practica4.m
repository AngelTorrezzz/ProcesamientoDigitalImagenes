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
k = 100; % Factor de refuerzo
HighBoost = J + (k) * MascaraDetalles;

%Normalizar para visualización
ImgSuavizada = uint8(ConvolucionSuavizante);
ImgMascara = uint8(MascaraDetalles);
ImgHighBoost = uint8(HighBoost);

%Resultados
figure;
subplot(2,2,1), imshow(uint8(J)), title('Imagen Original');
subplot(2,2,2), imshow(ImgSuavizada), title('Imagen Suavizada');
subplot(2,2,3), imshow(ImgMascara), title('Máscara de Detalles');
subplot(2,2,4), imshow(ImgHighBoost), title(['Imagen High-Boost (k = ', num2str(k), ')']);
