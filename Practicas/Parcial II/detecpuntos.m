close all;

%Frida Ximena Martine Lorenzo
ImOrg = imread("../../IMAGENES/gel.bmp");
Img1 = double(ImOrg);

%Laplaciano
WL=[1 1 1; 1 -8 1; 1 1 1];   
ImgLap1=(imfilter(Img1,WL,'conv'));


% Imprimir valores máximo y mínimo
maxL=max(ImgLap1(:));
minL=min(ImgLap1(:));
maxf= max(abs(maxL),abs(minL));
fprintf('Valor máximo del Laplaciano: %.2f\n',maxL );
fprintf('Valor mínimo del Laplaciano: %.2f\n', minL);
fprintf('Valor maximof del Laplaciano: %.2f\n', maxf);


%Valor T es un umbral que permitirá pasar solo los puntos
T=0.1*maxf;
resultado = imgResFunc(ImgLap1, T);
T=0.5*maxf;
resultado1 = imgResFunc(ImgLap1, T);
T=0.75*maxf;
resultado2 = imgResFunc(ImgLap1, T);
T=0.85*maxf;
resultado3 = imgResFunc(ImgLap1, T);


% Mostrar resultados
figure;
subplot(2,3,1), imshow(Img1,[]), title('Original');
subplot(2,3,2), imshow(ImgLap1,[]), title('Laplaciano');
subplot(2,3,3), imshow(resultado,[]), title('Resultante umbral 0.1')
subplot(2,3,4), imshow(resultado1,[]), title('Resultante umbral 0.5');
subplot(2,3,5), imshow(resultado2,[]), title('Resultante umbral 0.75');
subplot(2,3,6), imshow(resultado3,[]), title('Resultante umbral 0.85');

function imgRes = imgResFunc(ImgLap1, T)
%   La salida imgRes es una imagen binaria:
%     - 1 donde |L(x,y)| >= T
%     - 0 en otro caso

    % Inicializamos la imagen resultado con ceros del mismo tamaño
    imgRes = zeros(size(ImgLap1));

    % Aplicamos la condición del umbral
    imgRes(abs(ImgLap1) >= T) = 1;
end
