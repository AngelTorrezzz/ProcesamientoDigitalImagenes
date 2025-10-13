clear all;
close all;

Img1=zeros(128);
Img1(:,43:86)=255; %Asigna blanco de la columna 43:86
Img2 =zeros(128);
Img2(43:86,:)=255; %Asigna blanco de la fila 43:86

%Gradiente
WX=[-1 -2 -1; 0 0 0; 1 2 1];   
ParcialX1=imfilter(Img1,WX);
ParcialX2=imfilter(Img2,WX);

WY=[-1 0 1; -2 0 2; -1 0 1];
ParcialY1=imfilter(Img1,WY);
ParcialY2=imfilter(Img2,WY);

%Magnitud del gradiente de la imagen
MagnitudGradiente1 = sqrt(ParcialX1.*ParcialX1 + ParcialY1.*ParcialY1);
MagnitudGradiente2 = sqrt(ParcialX2.*ParcialX2 + ParcialY2.*ParcialY2); 

figure;
%Primera derivada 
subplot(3,2,1); imshow(Img1,[]);title("Imagen 1")
subplot(3,2,2); imshow(ParcialX1,[]);title("ParcialX1")
subplot(3,2,3); imshow(ParcialY1,[]);title("ParcialY1")
subplot(3,2,4); imshow(MagnitudGradiente1,[]);title("Magnitud Gradiente 2")
x=1:1:128;
z=ParcialY1(43,:);
subplot(3,2,5); plot(x,z);title("Una fila parcialY1")
figure;
subplot(3,2,1); imshow(Img2,[]);title("Imagen 2")
subplot(3,2,2); imshow(ParcialX2,[]);title("ParcialX2")
subplot(4,2,3); imshow(ParcialY2,[]);title("ParcialY2")
subplot(3,2,4); imshow(MagnitudGradiente2,[]);title("Magnitud Gradiente 2")
x=1:1:128;
z=ParcialY2(:,43);
subplot(4,2,5); plot(x,z);title("Una fila parcialY2")

%Segunda derivada | Mascara Laplaciana
WL=[1 1 1; 1 -8 1; 1 1 1];   
ImgLap1=imfilter(Img1,WL);
ImgLap2=imfilter(Img2,WL);
figure;
subplot(2,2,1); imshow(Img1,[]);title("Imagen 1");
subplot(2,2,2); imshow(ImgLap1,[]);title("Laplaciano");
x=1:1:128;
z=ImgLap1(64,:);
subplot(2,2,3); plot(x,z);title("Laplaciano fila imagen 1")
figure;
subplot(2,2,1); imshow(Img2,[]);title("Imagen 2");
subplot(2,2,2); imshow(ImgLap2,[]);title("Laplaciano");
x=1:1:128;
z=ImgLap2(64,:);
subplot(2,2,3); plot(x,z);title("Laplaciano fila imagen 2");