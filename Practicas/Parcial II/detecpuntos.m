close all;

ImOrg = imread("../../IMAGENES/gel.bmp");
Img1 = double(ImOrg);

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

%Definimos diferentes valores T para el umbral
T=0.5*maxf;
resultado = imgResFunc(ImgLap1, T);
T=0.25*maxf;
resultado1 = imgResFunc(ImgLap1, T);
T=0.1*maxf;
resultado2 = imgResFunc(ImgLap1, T);
T=0.05*maxf;
resultado3 = imgResFunc(ImgLap1, T);

%Mostrar resultados
figure;
subplot(2,3,1), imshow(Img1,[]), title('Original');
subplot(2,3,2), imshow(ImgLap1,[]), title('Laplaciano');
subplot(2,3,3), imshow(resultado,[]), title('Umbral 0.5')
subplot(2,3,4), imshow(resultado1,[]), title('Umbral 0.25');
subplot(2,3,5), imshow(resultado2,[]), title('Umbral 0.1');
subplot(2,3,6), imshow(resultado3,[]), title('Umbral 0.05');

function imgRes = imgResFunc(ImgLap1, T)
    %Salidas:
    % - 1 donde |L(x,y)| >= T
    % - 0 en otro caso

    %Imagen resultante inicializada con 0s
    imgRes = zeros(size(ImgLap1));

    %Condición del umbral
    imgRes(abs(ImgLap1) >= T) = 1;
end