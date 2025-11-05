close all
clear all
imtool close all

%Imagen
%Img = imread("../../Imagenes/bola.bmp");
%Img = im2double(Img);

%Matriz
Matriz1 = zeros(11);
Matriz1(:,5:7)=255;
Matriz2 = zeros(11);
Matriz2(5:7,:)=255;

MatrizResultante = Matriz1 + Matriz2

%No aplicar gaussiano cuando es una imagen SIMULADA (matriz)
%-----------------------------Paso 1 Gaussiano-----------------------------
%Filtro Gaussiano
%sigma = 3.0;
%W3 = FiltroGaussEspacio(sigma);
%factor = sum(sum(W3));
%W3 = FiltroGaussEspacio(sigma)*1/factor;
%FiltradoGaussianoImg = imfilter(Img, W3,0,'conv');

%----------------Paso 2 Magnitud y Direccion del Gradiente-----------------
%Gradiente
WX=[-1 -2 -1; 0 0 0; 1 2 1];   
ParcialX1=imfilter(MatrizResultante,WX);
WY=[-1 0 1; -2 0 2; -1 0 1];
ParcialY1=imfilter(MatrizResultante,WY);

%---------------------Paso 3 Supresion de NO Maximos-----------------------
%Magnitud del gradiente de la imagen
MagnitudGradiente = sqrt(ParcialX1.*ParcialX1 + ParcialY1.*ParcialY1);


%--------------------------------------------------------------------------------
% Mostrar Matriz
figure;
subplot(3,2,1); imshow(MatrizResultante,[]);title("Matriz")
subplot(3,2,2); imshow(ParcialX1,[]);title("ParcialX")
subplot(3,2,3); imshow(ParcialY1,[]);title("ParcialY")
subplot(3,2,4); imshow(MagnitudGradiente,[]);title("Magnitud Gradiente")

figure; imshow(MatrizResultante,[]);
figure; imshow(ParcialX1,[]);
figure; imshow(ParcialY1,[]);
figure; imshow(MagnitudGradiente,[]);

%--------------------------------------------------------------------------------
% Mostrar Imagen
%figure;
%subplot(2,3,1); imshow(Img,[]); title('Original');
%subplot(2,3,2); imshow(FiltradoGaussianoImg,[]); title('Suavizante (Gaussiano)');
%subplot(2,3,3); imshow(,[]); title('Magnitud y Direccion Grad');
%subplot(2,3,4); imshow(,[]); title('Supresion de no maximos');