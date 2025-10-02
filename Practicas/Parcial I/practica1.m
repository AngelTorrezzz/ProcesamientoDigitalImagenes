ImgA = imread('../Imagenes/caballo.bmp');
ImgB = imread('../Imagenes/cara.bmp');
%figure; imshow(ImgA) % Desplegar imagen A (varias imagenes)
%figure; imshow(ImgB) % Desplegar imagen B (varias imagenes)
%imtool(ImgA);        % Desplegar imagen A (una sola imagen)
%imtool(ImgB);        % Desplegar imagen B (una sola imagen)

ImgC = ImgA + ImgB;
%figure; imshow(ImgC)
%imtool(ImgC, []);

[nfils,ncols] = size(ImgA);
c = zeros(nfils,ncols);
for i = 1: nfils
    for j = 1: ncols
        c(i,j) = ImgA(i,j) + ImgB(i,j);
    end
end
imtool(c,[]);

ImgD = ImgA - ImgB;
ImgE = ImgA .* ImgB; %Con el punto lo hace elemento a elemento
ImgF = ImgA ./ ImgB; %Con el punto lo hace elemento a elemento

%Desplegar varias imagenes
figure;
subplot(3,2,1); imshow(ImgA,[]); title('A')
subplot(3,2,2); imshow(ImgB,[]); title('B'); %El ';' es para no imprimir la operacion
subplot(3,2,3); imshow(ImgC,[]); title('A+B');
subplot(3,2,4); imshow(ImgD,[]); title('A-B');
subplot(3,2,5); imshow(ImgE,[]); title('A*B');
subplot(3,2,6); imshow(ImgF,[]); title('A/B');