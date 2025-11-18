A = [
   21,21,26,27,38,41;
   22,22,26,29,39,40;
   21,22,27,25,39,40;
   23,21,28,29,42,37;
   21,23,28,30,41,41;
   23,22,26,28,42,36;
];

% Sea To = 3, vamos a realiar otra matriz, divida en dos grupos, 1 es menor
% que To y 2 los que son mayores a To

T0=23;
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > T0) = 2;          % Cambiar a 2 donde A >= To

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < To): %d\n', N1);
fprintf('Cantidad de 2s (A >= To): %d\n', N2);

%Matriz grupo1
Matriz1=A < T0;
%Matriz grupo2
Matriz2=A > T0;

%Promedio de cada grupo
mask1 = (B == 1);
N1 = sum(mask1(:));           % Número de elementos en grupo 1
suma1 = sum(A(mask1));        % Suma de los elementos originales en grupo 1
promedio1 = suma1 / N1;       % Promedio del grupo 1

fprintf('Promedio grupo 1: %.2f\n', promedio1);

mask2 = (B == 2);
N2 = sum(mask2(:));
suma2 = sum(A(mask2));
promedio2 = suma2 / N2;

fprintf('Promedio grupo 2: %.2f\n', promedio2);

%Calculamos con el nuevo T1, ya que tenemos ambios en el umbral
T1= (promedio1 + promedio2) /2;
fprintf('\nT1 = %.2f\n', T1);
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > T1) = 2;          % Cambiar a 2 donde A >= To

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < T1): %d\n', N1);
fprintf('Cantidad de 2s (A >= T1): %d\n', N2);

%Matriz grupo1
Matriz1=A < T1;
%Matriz grupo2
Matriz2=A > T1;

%Promedio de cada grupo
mask1 = (B == 1);
N1 = sum(mask1(:));           % Número de elementos en grupo 1
suma1 = sum(A(mask1));        % Suma de los elementos originales en grupo 1
promedio1 = suma1 / N1;       % Promedio del grupo 1
fprintf('Promedio grupo 1: %.2f\n', promedio1);

mask2 = (B == 2);
N2 = sum(mask2(:));
suma2 = sum(A(mask2));
promedio2 = suma2 / N2;
fprintf('Promedio grupo 2: %.2f\n', promedio2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculamos con el nuevo T2, ya que tenemos ambios en el umbral
T2= (promedio1 + promedio2) /2;
fprintf('\nT2 = %.2f\n', T2);
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > T2) = 2;          % Cambiar a 2 donde A >= T2

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < T2): %d\n', N1);
fprintf('Cantidad de 2s (A >= T2): %d\n', N2);

%Matriz grupo1
Matriz1=A < T2;
%Matriz grupo2
Matriz2=A > T2;

%Promedio de cada grupo
mask1 = (B == 1);
N1 = sum(mask1(:));           % Número de elementos en grupo 1
suma1 = sum(A(mask1));        % Suma de los elementos originales en grupo 1
promedio1 = suma1 / N1;       % Promedio del grupo 1

fprintf('Promedio grupo 1: %.2f\n', promedio1);

mask2 = (B == 2);
N2 = sum(mask2(:));
suma2 = sum(A(mask2));
promedio2 = suma2 / N2;

fprintf('Promedio grupo 2: %.2f\n', promedio2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculamos con el nuevo T3, ya que tenemos ambios en el umbral
T3= (promedio1 + promedio2) /2;
fprintf('\nT3 = %.2f\n', T3);
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > T3) = 2;          % Cambiar a 2 donde A >= T3

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < T3): %d\n', N1);
fprintf('Cantidad de 2s (A >= T3): %d\n', N2);

%Matriz grupo1
Matriz1=A < T3;
%Matriz grupo2
Matriz2=A > T3;

%Promedio de cada grupo
mask1 = (B == 1);
N1 = sum(mask1(:));           % Número de elementos en grupo 1
suma1 = sum(A(mask1));        % Suma de los elementos originales en grupo 1
promedio1 = suma1 / N1;       % Promedio del grupo 1

fprintf('Promedio grupo 1: %.2f\n', promedio1);

mask2 = (B == 2);
N2 = sum(mask2(:));
suma2 = sum(A(mask2));
promedio2 = suma2 / N2;

fprintf('Promedio grupo 2: %.2f\n', promedio2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculamos con el nuevo T4, ya que tenemos ambios en el umbral
T4 = (promedio1+promedio2)/2;
fprintf('\nT4 = %.2f\n', T4);
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > T4) = 2;          % Cambiar a 2 donde A >= T3

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < T4): %d\n', N1);
fprintf('Cantidad de 2s (A >= T4): %d\n', N2);

%Matriz grupo1
Matriz1=A < T4;
%Matriz grupo2
Matriz2=A > T4;

%Promedio de cada grupo
mask1 = (B == 1);
N1 = sum(mask1(:));           % Número de elementos en grupo 1
suma1 = sum(A(mask1));        % Suma de los elementos originales en grupo 1
promedio1 = suma1 / N1;       % Promedio del grupo 1

fprintf('Promedio grupo 1: %.2f\n', promedio1);

mask2 = (B == 2);
N2 = sum(mask2(:));
suma2 = sum(A(mask2));
promedio2 = suma2 / N2;

fprintf('Promedio grupo 2: %.2f\n', promedio2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculamos con el nuevo T5, ya que tenemos ambios en el umbral
T5 = (promedio1+promedio2)/2;
fprintf('\nT5 = %.2f\n', T5);
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > T5) = 2;          % Cambiar a 2 donde A >= T3

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < T5): %d\n', N1);
fprintf('Cantidad de 2s (A >= T5): %d\n', N2);

%Matriz grupo1
Matriz1=A < T5;
%Matriz grupo2
Matriz2=A > T5;

%Promedio de cada grupo
mask1 = (B == 1);
N1 = sum(mask1(:));           % Número de elementos en grupo 1
suma1 = sum(A(mask1));        % Suma de los elementos originales en grupo 1
promedio1 = suma1 / N1;       % Promedio del grupo 1

fprintf('Promedio grupo 1: %.2f\n', promedio1);

mask2 = (B == 2);
N2 = sum(mask2(:));
suma2 = sum(A(mask2));
promedio2 = suma2 / N2;

fprintf('Promedio grupo 2: %.2f\n', promedio2);
T6 = (promedio1+promedio2)/2;
fprintf('\nT6 = %.2f', T6);

%Nos detenemos porque no hay cambios en las N1 y N2, podemos poner un
%criterio de paro con respecto a un margen, cuando no haya cambios mayores
%a un margen del 10% (0.1)

%Posterior a tener las regiones hacemos una descripción de esta,
%promedio de intensidades, teturas, tamaño de la región. 