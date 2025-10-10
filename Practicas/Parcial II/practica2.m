ImOrg = imread("../../IMAGENES/taza.bmp");
imtool(ImOrg);

%Recomendable convertir a double la imagen
J = imnoise(ImOrg, "gaussian", 0.02, 0.01);
JG = double(J);
imtool(JG,[]);

%Filtro Caja
W=[1 1 1; 1 1 1; 1 1 1];    % Máscara Pesada
ConvlCaja=imfilter(JG,W)*1/9;
ConvlMatrizCaja=imfilter(JG,W)*1/9;
imtool(ConvlMatrizCaja,[]);

%Filtro Pesado
W=[1 2 1; 2 4 2; 1 2 1];    % Máscara Pesada
ConvlPesada=imfilter(JG,W)*1/16;
ConvlMatrizPesada=imfilter(JG,W)*1/16;
imtool(ConvlMatrizPesada,[]);

%Filtro Gaussiano
sigma = 0.5;
W3 = filtroGaussEspacio(sigma);
factor = sum(sum(W3));
W3 = filtroGaussEspacio(sigma)*1/factor;
ConvlGaussiano = imfilter(JG, W3);
imtool(ConvlGaussiano, []);