clear all;
close all;

%Matriz que representa la imágen en escala de grises (presentada en clase)
A = [ 
    4 4 4 70 70 70 70 70 10 10;
    4 4 4 70 70 70 70 70 10 10;
    4 4 4 70 70 70 70 70 7 7;
    4 4 70 40 50 60 70 80 7 7;
    4 4 70 40 50 60 70 80 7 7;
    4 4 70 40 50 60 70 80 2 2;
    4 4 70 40 50 60 70 80 4 4;
    4 4 70 40 50 60 70 80 7 7;
    4 4 70 20 20 20 20 20 2 2;
    4 4 70 20 20 20 20 20 2 2
];

% Derivadas parciales usando
% Derivada parcial en X
Wx = [ -1 -2 -1; 0 0 0; 1 2 1 ];
% Derivada parcial en Y
Wy = [ -1 0 1; -2 0 2; -1 0 1 ];

% Se calculan las derivadas parciales
Gx = conv2(double(A), Wx, 'same');
Gxx = imfilter(A,Wx); %Otra manera
Gy = conv2(double(A), Wy, 'same');
Gyy = imfilter(A,Wy); %Otra manera

% Se calcula la magnitud del gradiente
Gmag = sqrt(Gx.^2 + Gy.^2);
Gmagg = sqrt(Gxx.^2 + Gyy.^2);

% Se muestran los resultados
figure;
subplot(2,3,1);imshow(uint8(A)); title('Imagen Original');
subplot(2,3,2);imshow(uint8(abs(Gx))); title('Derivada parcial en X');
subplot(2,3,3);imshow(uint8(abs(Gy))); title('Derivada parcial en Y');
subplot(2,3,4);imshow(uint8(Gmag)); title('Magnitud del Gradiente');

%figure;
%subplot(2,3,1);imshow(uint8(A)); title('Imagen Original');
%subplot(2,3,2);imshow(uint8(abs(Gxx))); title('Derivada parcial en X');
%subplot(2,3,3);imshow(uint8(abs(Gyy))); title('Derivada parcial en Y');
%subplot(2,3,4);imshow(uint8(Gmagg)); title('Magnitud del Gradiente');