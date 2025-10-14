ImgOrg = imread ('../../Imagenes/tools3.bmp');

%Recomendable convertir a double imagen
J = double(ImgOrg);


%Filtro de caja de 3x3
w1 = [1 1 1; 1 1 1; 1 1 1]; %Suaviza
w2 = [-1 -1 -1; -1 -1 -1; -1 -1 -1]; %Realza

%Convolución - Operaciones
ConvolucionSuavizante = imfilter(J,w1,0,'conv')*1/9; %Suaviza
ConvolucionRealzante = imfilter(J,w2,0,'conv')*1/9; %Realza
ConvolucionSuavizanteBorde = imfilter(J,w1,'replicate', 'conv')*1/9; %copia borde de la imagen (Suavizante)
%Convolución - Visualizacion
figure;
subplot(2,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(2,2,2); imshow(ConvolucionSuavizante,[]); title('Convolucion Suavizante');
subplot(2,2,3); imshow(ConvolucionRealzante,[]); title('Convolucion Realzante');
subplot(2,2,4); imshow(ConvolucionSuavizanteBorde,[]); title('Convolucion Suavizante (Bordes de imagen)');

%Correlación
CorrelacionSuviazante = imfilter(J,w1)*1/9;
CorrelacionRealzante = imfilter(J,w2)*1/9;
CorrelacionSuavizanteBorde = imfilter(J,w1,'replicate', 'corr')*1/9; %copia borde de la imagen (Suavizante)
%Correlacion - Visualizacion
figure;
subplot(2,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(2,2,2); imshow(ConvolucionSuavizante,[]); title('Correlacion Suavizante');
subplot(2,2,3); imshow(ConvolucionRealzante,[]); title('Correlacion Realzante');
subplot(2,2,4); imshow(ConvolucionSuavizanteBorde,[]); title('Correlacion Suavizante (Bordes de imagen)');