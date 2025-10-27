clc; clear; close all;

% Matriz original
Matriz = [
202 192 202 214 206 199 192 184;
200 140 102 136 184 178 180 177;
143 45 40 32 68 123 130 148;
74 19 40 69 38 107 146 116;
71 14 30 44 38 101 131 116;
116 19 25 27 38 83 101 132;
154 34 15 26 67 84 108 148;
159 110 87 102 134 155 166 171
];

% Semillas iniciales (coordenadas)
semA = [5,2]; % valor = 14
semB = [4,7]; % valor = 146

Semillas = {semA, semB};
Nombres = {'A','B'};

% Umbral
U = 20;

% Matriz de etiquetas
Etiquetas = zeros(size(Matriz));

% Direcciones de los 8 vecinos
vecinos = [
    -1 -1; -1 0; -1 1;
     0 -1;         0 1;
     1 -1;  1 0;  1 1
];

% Inicialización de las etiquetas
for k = 1:length(Semillas)
    coord = Semillas{k};
    Etiquetas(coord(1), coord(2)) = k;
end

fprintf('--- Iteración 0 (Semillas iniciales) ---\n');
disp(Etiquetas);

% Iniciar las listas de semillas activas
SemillasActivas = Semillas;

iter = 0;
cambio = true;

while cambio
    iter = iter + 1;
    cambio = false;

    fprintf('\n=== Iteración %d ===\n', iter);

    % Lista temporal para nuevas semillas
    NuevasSemillas = cell(1, length(Semillas));

    for k = 1:length(SemillasActivas)
        % Obtener coordenadas actuales de la región k
        [rows, cols] = find(Etiquetas == k);

        % Almacenamos solo las semillas actuales (sin las nuevas todavía)
        semillasActuales = [rows, cols];

        nuevas = []; % coordenadas nuevas que se agreguen en esta iteración

        % Expandir cada semilla actual
        for s = 1:size(semillasActuales,1)
            i = semillasActuales(s,1);
            j = semillasActuales(s,2);
            valorSemilla = Matriz(i,j);

            % Explorar 8 vecinos
            for v = 1:size(vecinos,1)
                ni = i + vecinos(v,1);
                nj = j + vecinos(v,2);

                % Validar límites
                if ni < 1 || nj < 1 || ni > size(Matriz,1) || nj > size(Matriz,2)
                    continue;
                end

                % Verificar condición y si no está etiquetado
                if Etiquetas(ni,nj) == 0 && abs(Matriz(ni,nj) - valorSemilla) <= U
                    Etiquetas(ni,nj) = k;
                    nuevas = [nuevas; ni nj]; %#ok<AGROW>
                    cambio = true;
                end
            end
        end

        % Guardar las nuevas semillas encontradas
        NuevasSemillas{k} = nuevas;
    end

    % Mostrar resultado parcial
    fprintf('Matriz de etiquetas después de iteración %d:\n', iter);
    disp(Etiquetas);

    % Actualizar semillas activas
    SemillasActivas = NuevasSemillas;

    % Si no se agregaron más píxeles en ninguna región, terminamos
    if ~cambio
        fprintf('No hay más crecimiento en la iteración %d.\n', iter);
    end
end

disp('--- Resultado final ---');
disp(Etiquetas);
