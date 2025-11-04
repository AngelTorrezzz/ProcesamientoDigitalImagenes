close all
imtool close all
Img = imread("../../Imagenes/bola.bmp");

%----------------------------Paso 1----------------------------
%Matriz original
Matriz = [34 21 26 27 39 41;
     22 22 26 42 39 40;
     21 22 45 25 39 40;
     23 21 53 34 42 37;
     21 23 28 30 41 41;
     23 22 26 28 42 36;
    ];

Matriz = im2double(Matriz);
Img = im2double(Img);

%Filtro Pesado
W=[1 2 1; 2 4 2; 1 2 1]/16; %Máscara Pesada
FiltradoPesadoMatriz=imfilter(Matriz,W,'conv');

%Mostrar matriz
disp('Matriz Filtro Pesado:');
disp(FiltradoPesadoMatriz);

%Filtro Gaussiano
sigma = 3.0;
W3 = FiltroGaussEspacio(sigma);
factor = sum(sum(W3));
W3 = FiltroGaussEspacio(sigma)*1/factor;
FiltradoGaussianoImg = imfilter(Img, W3,0,'conv');

%----------------------------Paso 2----------------------------
%Máscara del filtro Laplaciano
WL=[1 1 1;
    1 -8 1;
    1 1 1];   
LaplacianoMatriz=imfilter(FiltradoPesadoMatriz,WL,'symmetric');
LaplacianoImg=imfilter(FiltradoGaussianoImg,WL,'symmetric');

%Mostrar matriz Laplaciano
disp('Matriz Laplaciano:');
disp(LaplacianoMatriz);

%----------------------------Paso 3----------------------------
[nfils, ncols] = size(LaplacianoImg); % ← Faltaba definir nfils y ncols
Ic = zeros(nfils,ncols);
for i=1:nfils
  for j=1:ncols
    indFil = i-1:1:i+1;
    indFilV = indFil((indFil > 0 & indFil < nfils+1)); % Válida si esta en un píxel de la orilla (filas)
    indCol = j-1:1:j+1;
    indColV = indCol((indCol > 0 & indCol < ncols+1)); % Válida si esta en un píxel de la orilla (columnas)
    PixV = LaplacianoImg(indFilV,indColV); % Valor de intensidad de los píxeles de la mascara en la imagen
    PixV = reshape(PixV,1,numel(PixV)); % Convierte a vector a la máscara 
    PixV = PixV*LaplacianoImg(i,j); % Se hace la multiplicación del pixel por la mascara de los 8 vecinos
    cz = sum(PixV < 0); % Suma la cantidad de valores negativos (bordes) despues de multiplicar al pixel por 8vecinos
    if(cz > 0) %Si al menos hay un cambio de signo
        Ic(i,j)=1;
    end
  end
end

% Mostrar resultado
figure;
subplot(2,3,1); imshow(Img,[]); title('Original');
subplot(2,3,2); imshow(FiltradoGaussianoImg,[]); title('Suavizante (Gaussiano)');
subplot(2,3,3); imshow(LaplacianoImg,[]); title('Laplaciano');
subplot(2,3,4); imshow(Ic,[]); title('Detección de Bordes');
       
    