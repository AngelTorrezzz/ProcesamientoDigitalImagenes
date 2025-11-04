close all;

ImOrg = imread("../../Imagenes/circuito.jpg");
Img1 = double(ImOrg);

function imgRes = imgResFunc(ImgLap1, T)
    %Salidas:
    % - 1 donde |L(x,y)| >= T
    % - 0 en otro caso

    %Imagen resultante inicializada con 0s
    imgRes = zeros(size(ImgLap1));

    %Condición del umbral
    imgRes(ImgLap1 >= T) = 1;
end

%--------------------------Laplaciano--------------------------
%Máscara del filtro Laplaciano
WL=[1 1 1;
    1 -8 1;
    1 1 1];   
ImgLap1=(imfilter(Img1,WL,'conv'));

%Calcular minimos y maximos despues de aplicar laplaciano
maxL=max(ImgLap1(:));
minL=min(ImgLap1(:));
maxf= max(abs(maxL),abs(minL));
fprintf('Valor máximo del Laplaciano: %.2f\n',maxL );
fprintf('Valor mínimo del Laplaciano: %.2f\n', minL);
fprintf('Valor maximof del Laplaciano: %.2f\n', maxf);

%Definimos el umbral T
T=0.1*maxf;
resultado = imgResFunc(ImgLap1, T);

%--------------------Gradiente (derivadas)--------------------
% Mascara para derivada parcial en X
Wx = [ -1 -2 -1; 0 0 0; 1 2 1 ];
% Mascara para derivada parcial en Y
Wy = [ -1 0 1; -2 0 2; -1 0 1 ];
Gx = imfilter(Img1,Wx,'conv');
Gy = imfilter(Img1,Wy,'conv');

%------------------------Inclinaciones------------------------
% Mascara a 45°
W45 = [ 2 -1 -1; -1 2 -1; -1 -1 2 ];
% Mascara a -45°
WMenos45 = [ -1 -1 2; -1 2 -1; 2 -1 -1 ];
G45 = imfilter(Img1,W45,'conv');
GMenos45 = imfilter(Img1,WMenos45,'conv');

%--------------------Mostrar resultados-----------------------
figure;
subplot(2,3,1), imshow(ImOrg,[]), title('Original');
subplot(2,3,2), imshow(resultado,[]), title('Laplaciano Umbral 0.1');
subplot(2,3,3);imshow(uint8(abs(Gx))); title('Gradiente-Parcial X');
subplot(2,3,4);imshow(uint8(abs(Gy))); title('Gradiente-Parcial Y');
subplot(2,3,5), imshow(G45,[]), title('Máscara de 45');
subplot(2,3,6), imshow(GMenos45,[]), title('Máscara de -45');