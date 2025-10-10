ImgOrg = imread ('../../Imagenes/tools3.bmp');
imtool(ImgOrg,[]);

%Recomendable convertir a double imagen
J = double(ImgOrg);

%Filtro de caja de 3x3
w1 = [1 1 1; 1 1 1; 1 1 1]; %Suaviza
w2 = [-1 -1 -1; -1 -1 -1; -1 -1 -1]; %Realza

%Convolución
ConvolucionSuavizante = imfilter(J,w1,0,'conv')*1/9; 
ConvolucionRealzante = imfilter(J,w2,0,'conv')*1/9; 

%Correlación
CorrelacionSuviazante = imfilter(J,w1)*1/9;
CorrelacionRealzante = imfilter(J,w2)*1/9;

%Convolucion, copia borde de la imagen
ConvolucionBorde = imfilter(J,w1,'replicate', 'conv')*1/9;

% Desplegar varias imagenes
figure;
subplot(3,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(3,2,2); imshow(ConvolucionSuavizante,[]); title('Convolucion Suavizante');
subplot(3,2,3); imshow(ConvolucionRealzante,[]); title('Convolucion Realzante');
subplot(3,2,4); imshow(CorrelacionSuviazante,[]); title('Correlacion Suavizante');
subplot(3,2,5); imshow(CorrelacionRealzante,[]); title('Correlacion Realzante');
subplot(3,2,6); imshow(ConvolucionBorde,[]); title('Convolucion Borde de Imagen');

