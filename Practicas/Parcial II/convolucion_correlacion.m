ImgOrg = imread ('../../Imagenes/tools3.bmp');
imtool(ImgOrg,[]);

%Recomendable convertir a double imagen
J = double(ImgOrg);

%Filtro de caja de 3x3
w1 = [1 1 1; 1 1 1; 1 1 1]; %Suaviza
w2 = [-1 -1 -1; -1 -1 -1; -1 -1 -1]; %

%Convolución
Convolucion1 = imfilter(J,w1,0,'conv')*1/9; 
%imtool(Convolucion1,[]);
Convolucion2 = imfilter(J,w2,0,'conv')*1/9; 
%imtool(Convolucion2,[]);

%Correlación
Correlacion1 = imfilter(J,w1)*1/9;
%imtool(Correlacion1,[]);
Correlacion2 = imfilter(J,w2)*1/9;
%imtool(Correlacion2,[]);

%Convolucion, copia borde de la imagen
ConvolucionR = imfilter(J,w,'replicate', 'conv')*1/9;
%imtool(ConvolucionR,[]);

% Desplegar varias imagenes
figure;
subplot(3,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(3,2,2); imshow(Convolucion1,[]); title('Convolucion suavizante');
subplot(3,2,3); imshow(Convolucion2,[]); title('Convolucion no suavizante');
subplot(3,2,4); imshow(Correlacion1,[]); title('Correlacion suavizante');
subplot(3,2,5); imshow(Correlacion2,[]); title('Correlacion no suavizante');
subplot(3,2,6); imshow(ConvolucionR,[]); title('Convolucion Borde de Imagen');

