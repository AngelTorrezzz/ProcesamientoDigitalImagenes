%Implementar en MATLAB el detector de bordes de Canny. Considerar el 
%algoritmo revisado en clase y realizar la prueba con tres imágenes diferentes.

close all
clear all
imtool close all

%Imagen (si se usa una imagen real)
Img = imread("../../Imagenes/manzana.bmp");
Img = im2double(Img);


%-----------------------------Paso 1 Gaussiano-----------------------------
% No aplicar gaussiano cuando es matriz simulada
sigma = 1.0;
W3 = FiltroGaussEspacio(sigma);
factor = sum(sum(W3));
W3 = FiltroGaussEspacio(sigma)*1/factor;
FiltradoGaussianoImg = imfilter(Img, W3,0,'conv');

%----------------Paso 2 Magnitud y Direccion del Gradiente-----------------
WX=[-1 -2 -1; 0 0 0; 1 2 1];   
ParcialX = imfilter(FiltradoGaussianoImg, WX, 'replicate');
WY=[-1 0 1; -2 0 2; -1 0 1];
ParcialY = imfilter(FiltradoGaussianoImg, WY, 'replicate');

%Magnitud del gradiente
MagnitudGradiente = sqrt(ParcialX.^2 + ParcialY.^2);

%Direccion del gradiente
DireccionGradiente = atan2(ParcialX, ParcialY);
DireccionGradiente = rad2deg(DireccionGradiente);
DireccionGradiente(DireccionGradiente < 0) = DireccionGradiente(DireccionGradiente < 0) + 180;

%---------------------Paso 3 Supresion de NO Maximos-----------------------
[filas, columnas] = size(MagnitudGradiente);
Supresion = zeros(filas, columnas);

for i = 2:filas-1
    for j = 2:columnas-1
        ang = DireccionGradiente(i,j);
        q = 255;
        r = 255;

        % Cuantización de la dirección en 4 sectores
        if ((ang >= 0 && ang < 22.5) || (ang >= 157.5 && ang <= 180))
            q = MagnitudGradiente(i, j+1);
            r = MagnitudGradiente(i, j-1);
        elseif (ang >= 22.5 && ang < 67.5)
            q = MagnitudGradiente(i+1, j-1);
            r = MagnitudGradiente(i-1, j+1);
        elseif (ang >= 67.5 && ang < 112.5)
            q = MagnitudGradiente(i+1, j);
            r = MagnitudGradiente(i-1, j);
        elseif (ang >= 112.5 && ang < 157.5)
            q = MagnitudGradiente(i-1, j-1);
            r = MagnitudGradiente(i+1, j+1);
        end

        if (MagnitudGradiente(i,j) >= q && MagnitudGradiente(i,j) >= r)
            Supresion(i,j) = MagnitudGradiente(i,j);
        else
            Supresion(i,j) = 0;
        end
    end
end

%----------------------Paso 4 Histeresis de umbral------------------------
% Umbrales (ajustables)
Tmax = max(max(Supresion)) * 0.15;
Tmin = Tmax * 0.5;

[filas, columnas] = size(Supresion);
Histeresis = zeros(filas, columnas);

for i = 2:filas-1
    for j = 2:columnas-1
        if (Supresion(i,j) >= Tmax)
            Histeresis(i,j) = 255;
        elseif (Supresion(i,j) >= Tmin)
            % Si el píxel está entre Tmin y Tmax y es vecino de un píxel fuerte
            if any(any(Supresion(i-1:i+1, j-1:j+1) >= Tmax))
                Histeresis(i,j) = 255;
            end
        end
    end
end

%--------------------------------------------------------------------------

% Mostrar Matrices
figure;
subplot(2,3,1); imshow(Img,[]); title("Matriz Original")
subplot(2,3,2); imshow(FiltradoGaussianoImg,[]); title("Gaussiano")
subplot(2,3,3); imshow(MagnitudGradiente,[]); title("Magnitud Gradiente")
subplot(2,3,4); imshow(DireccionGradiente,[]); title("Direccion Gradiente")
subplot(2,3,5); imshow(Supresion,[]); title("Supresion No Maximos")
subplot(2,3,6); imshow(Histeresis,[]); title("Resultado Final (Histeresis)")

% Mostrar valores numéricos
disp('Magnitud Gradiente:');
disp(MagnitudGradiente);
disp('Direccion Gradiente:');
disp(DireccionGradiente);

