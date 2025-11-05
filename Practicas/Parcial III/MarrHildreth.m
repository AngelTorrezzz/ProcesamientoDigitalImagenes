%Aplicar el detector de bordes de  Marr-Hildreth a la imagen del archivo.

close all
clear all
imtool close all

%Matriz
Matriz = [34 21 26 27 39 41;
          22 22 26 42 39 40;
          21 22 45 25 39 40;
          23 21 53 34 42 37;
          21 23 28 30 41 41;
          23 22 26 28 42 36;
         ];
Matriz = im2double(Matriz);

%-----------------------------Paso 1 Gaussiano-----------------------------
%%Filtro Gaussiano
%sigma = 3.0;
%W3 = FiltroGaussEspacio(sigma);
%factor = sum(sum(W3));
%W3 = FiltroGaussEspacio(sigma)*1/factor;
%FiltradoGaussianoImg = imfilter(Matriz, W3,0,'conv');

%Filtro Pesado
W=[1 2 1; 2 4 2; 1 2 1]/16; %Máscara Pesada
FiltradoPesadoMatriz=imfilter(Matriz,W,'conv');

%----------------------------Paso 2 Laplaciano-----------------------------
%Máscara del filtro Laplaciano
WL=[1 1 1;
    1 -8 1;
    1 1 1];

LaplacianoMatriz=imfilter(FiltradoPesadoMatriz,WL,'symmetric');

%----------------------------Paso 3 Cruces por 0---------------------------
[nfilsMatriz, ncolsMatriz] = size(LaplacianoMatriz);
IcMatriz = zeros(nfilsMatriz,ncolsMatriz);
for i=1:nfilsMatriz
  for j=1:ncolsMatriz
    indFil = i-1:1:i+1;
    indFilV = indFil((indFil > 0 & indFil < nfilsMatriz+1)); % Válida si esta en un píxel de la orilla (filas)
    indCol = j-1:1:j+1;
    indColV = indCol((indCol > 0 & indCol < ncolsMatriz+1)); % Válida si esta en un píxel de la orilla (columnas)
    PixV = LaplacianoMatriz(indFilV,indColV); % Valor de intensidad de los píxeles de la mascara en la imagen
    PixV = reshape(PixV,1,numel(PixV)); % Convierte a vector a la máscara 
    PixV = PixV*LaplacianoMatriz(i,j); % Se hace la multiplicación del pixel por la mascara de los 8 vecinos
    cz = sum(PixV < 0); % Suma la cantidad de valores negativos (bordes) despues de multiplicar al pixel por 8vecinos
    if(cz > 0) %Si al menos hay un cambio de signo
        IcMatriz(i,j)=1;
    end
  end
end


%---------------------------------------------------------------------------------------
% Mostrar matriz
disp('Matriz Filtro Pesado:');
disp(FiltradoPesadoMatriz);
disp('Matriz Laplaciano:');
disp(LaplacianoMatriz);
disp('Matriz Deteccion de Bordes:');
disp(IcMatriz);