




A = [
    4 4 4 7 7 7 7 7 1 1;
    4 4 4 7 7 7 7 7 1 1;
    4 4 4 6 7 7 7 7 7 7;
    4 4 5 4 5 3 7 4 7 7;
    4 4 5 4 5 3 7 4 7 7;
    4 4 5 4 5 3 7 4 2 2;
    4 4 5 4 5 3 7 4 4 4;
    4 4 5 4 5 3 7 4 7 7;
    4 4 2 2 2 2 2 2 2 2;
    4 4 2 2 2 2 2 2 2 2
];

%Sea To = 3, vamos a realiar otra matriz, divida en dos grupos, 1 es menor
%que To y 2 los que son mayores a To

To=3;
% Crear matriz binaria B basada en To
B = ones(size(A));      % Iniciar con todos como 1
B(A > To) = 2;          % Cambiar a 2 donde A >= To

% Contar cuántos 1s y 2s hay en B
N1 = sum(B(:) == 1);
N2 = sum(B(:) == 2);

fprintf('Cantidad de 1s (A < To): %d\n', N1);
fprintf('Cantidad de 2s (A >= To): %d\n', N2);

%Matriz grupo1
Matriz1=A < To;
%Matriz grupo2
Matriz2=A > To;

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

