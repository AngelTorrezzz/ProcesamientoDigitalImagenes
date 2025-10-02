close all;

ImgA = imread('../../Imagenes/taza.bmp');

JSaltPepper = imnoise(ImgA, 'salt & pepper', 0.02);
%figure; imshow(J); title('salt & pepper');

JGaussiana = imnoise(ImgA, 'gaussian', 0.02, 0.01); % Media = 0.02, varianza = 0.01
%figure; imshow(JG); title('gaussian');

JPoisson = imnoise(ImgA, 'poisson');
%figure; imshow(JP); title('poisson');

% Desplegar varias imagenes
figure;
subplot(2,2,1); imshow(ImgA,[]); title('ImgA');
subplot(2,2,2); imshow(JSaltPepper,[]); title('salt & pepper');
subplot(2,2,3); imshow(JGaussiana,[]); title('gaussian');
subplot(2,2,4); imshow(JPoisson,[]); title('poisson');

% Crear la imagen resultante
[nfils, ncols] = size(ImgA);
C = zeros(nfils, ncols);
CM = zeros(nfils, ncols);
for i = 1:nfils
    for j = 1:ncols
        % 8 Vecinos
        vx = i-1:1:i+1;
        vy = j-1:1:j+1;

        % Validar 8 vecinos
        vxV = vx(vx >= 1 & vx <= nfils);
        vyV = vy(vy >= 1 & vy <= ncols);
        
        % Obtener intensidades de toda la vecindad
        vecIntensidad = ImgA(vxV, vyV);
        vecIntensidad = vecIntensidad(:); % <-- aquí la corrección
        C(i,j) = median(vecIntensidad);
        C(i,j) = max(vecIntensidad);
        C(i,j) = min(vecIntensidad);
    end
end

% Desplegar varias imagenes
figure;
subplot(2,2,1); imshow(ImgA,[]); title('ImgA');
subplot(2,2,2); imshow(C,[]); title('Mediana');
subplot(2,2,3); imshow(C,[]); title('Maximo');
subplot(2,2,4); imshow(C,[]); title('Minimo');
        





