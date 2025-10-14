clear all
close all

ImgOrg = imread ('../../Imagenes/tools3.bmp');
%imtool(ImgOrg,[]);

%Recomendable convertir a double imagen
J = double(ImgOrg);

%Mascara laplaciano
WL = [1 1 1; 1 -8 1; 1 1 1]; %Suaviza

%Paso 1 - R(x,y) = f(x,y) + c[Laplaciano(f(x,y))]
c = -1;
R = J + c*imfilter(J,WL,0,'conv')*1/9;

%Paso 2 - Magnitud del gradiente
Wx = [-1 -2 -1; 0 0 0; 1 2 1];
Wy = [-1 0 1; -2 0 1; -1 0 1];
Gx = imfilter(J,Wx,0,'conv'); %*1/9 cuando es suavizante, quitar cuando sea realzante
Gy = imfilter(J,Wy,0,'conv'); %*1/9 cuando es suavizante, quitar cuando sea realzante
MagnitudGradiente = sqrt((Gx.*Gx) + (Gy.*Gy));

%Paso 3 - Suavizar magnitud del gradiente
Caja = [1 1 1; 1 1 1; 1 1 1];
MagnitudGradienteSuavizado = imfilter(MagnitudGradiente,Caja,0,'conv')*1/9;

%Paso 4 - Mask(x,y) = R(x,y) x MagnitudGradienteSuavizado
Mask = R .* MagnitudGradienteSuavizado;

%Paso 5 - g(x,y) = f(x,y) + Mask(x,y)
g = J + Mask;

%Paso 6 - Correccion gamma a g(x,y)
gamma = 0.5;
Resultante = (g).^gamma;

% Desplegar varias imagenes
figure;
subplot(3,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(3,2,2); imshow(R,[]); title('Paso 1');
subplot(3,2,3); imshow(MagnitudGradiente,[]); title('Paso 2');
subplot(3,2,4); imshow(MagnitudGradienteSuavizado,[]); title('Paso 3');
subplot(3,2,5); imshow(Mask,[]); title('Paso 4');
subplot(3,2,6); imshow(g,[]); title('Paso 5');

figure;
subplot(3,2,1); imshow(ImgOrg,[]); title('Orginal');
subplot(2,2,2); imshow(Resultante,[]); title('Gradiente-Laplaciano');