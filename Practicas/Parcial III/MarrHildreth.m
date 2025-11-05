close all
clear all
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
FiltradoPesado=imfilter(I,W,0,'conv');

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
