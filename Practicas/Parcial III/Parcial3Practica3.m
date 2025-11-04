close all
imtool close all

%----------------------------Paso 1----------------------------
%Matriz original
I = [34 21 26 27 39 41;
     22 22 26 42 39 40;
     21 22 45 25 39 40;
     23 21 53 34 42 37;
     21 23 28 30 41 41;
     23 22 26 28 42 36;
    ];

I = im2double(I);

%Filtro Pesado
W=[1 2 1; 2 4 2; 1 2 1]/16; %Máscara Pesada
FiltradoPesado=imfilter(I,W,'conv');

%Mostrar imagen/matriz
disp('Matriz Filtro Pesado:');
disp(FiltradoPesado);

%----------------------------Paso 2----------------------------
%Máscara del filtro Laplaciano
WL=[1 1 1;
    1 -8 1;
    1 1 1];   
Laplaciano=(imfilter(FiltradoPesado,WL,'conv'));
disp('Matriz Laplaciano:');
disp(Laplaciano);

%----------------------------Paso 3----------------------------
Ic = zeros(nfils,ncols);
for i=1:nfils
  for j=1:ncols
    indFil = i-1:1:i+1;
    indFilV = indFil((indFil > 0 & indFil < nfils+1)); % Válida si esta en un píxel de la orilla (filas)
    indCol = j-1:1:j+1;
    indColV = indCol((indCol > 0 & indCol < ncols+1)); % Válida si esta en un píxel de la orilla (columnas)
    PixV = I(indFilV,indColV); % Valor de intensidad de los píxeles de la imagen original en la posicion calculada
    PixV = reshape(PixV,1,numel(PixV)); % Convierte a vector a la máscara 
    PixV = PixV*I(i,j); % Se hace la multiplicación del pixel por la mascara de los 8 vecinos
    cz = sum(PixV < 0); % Suma la cantidad de valores negativos (bordes) despues de multiplicar al pixel por 8vecinos
    if(cz > 0) %Si al menos hay un cambio de signo
        Ic(i,j)=1;
    