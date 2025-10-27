matriz = [
4 4 4 7 7 7 7 7 1 1;
4 4 4 7 7 7 7 7 1 1;
4 4 4 6 7 7 7 7 7 7;
4 4 5 4 5 3 7 4 7 7;
4 4 5 4 5 3 7 4 7 7;
4 4 5 4 5 3 7 4 2 2;
4 4 5 4 5 3 7 4 4 4;
4 4 5 4 5 3 7 4 7 7;
4 4 2 2 2 2 2 2 2 2;
4 4 2 2 2 2 2 2 2 2;
];

% Niveles de gris únicos ordenados
niveles = unique(matriz);
i = (1:length(niveles))'; % índice i para cada nivel de gris

% Frecuencia de ocurrencia de cada nivel de gris
fr = histcounts(matriz, [niveles; max(niveles)+1])';

% Probabilidad de cada nivel de gris
total_pixeles = numel(matriz);
p = fr / total_pixeles;

k = i; % Índice para umbral k

% Probabilidad acumulada P(k)
P = cumsum(p);

% Media acumulada m(k)
m = cumsum(p .* k);

% Varianza interclase σ2(k)
sigma2 = zeros(length(k),1);
for idx = 1:length(k)
    if P(idx) == 0 || P(idx) == 1
        sigma2(idx) = 0;
    else
        sigma2(idx) = ((m(end)*P(idx) - m(idx))^2) / (P(idx)*(1 - P(idx)));
    end
end

% Producto p(i)*k
pik = p .* k;

% Media global
mG = sum(p .* k);

% Crear tabla con columna i vacía para la fila de sumas
tabla = table(i, fr, p, k, P, m, sigma2, pik);

% Calcular sumas de columnas numéricas para fila resumen
fila_suma = {NaN, sum(fr), sum(p), NaN, sum(P), sum(m), sum(sigma2), sum(pik)};
tabla_con_suma = [tabla; cell2table(fila_suma, 'VariableNames', tabla.Properties.VariableNames)];

disp(tabla_con_suma)
fprintf('Media global (mG) = %.4f\n', mG)
