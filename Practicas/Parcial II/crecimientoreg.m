clc; clear; close all;

% Matriz original
Matriz = [
   21 21 26 27 39 41;
   22 22 26 29 39 40;
   21 22 27 28 39 40;
   23 21 28 29 42 37;
   21 23 28 29 42 37;
   23 22 26 26 42 36;
];

% Semillas iniciales
A = Matriz(3,2); % 22
B = Matriz(3,4); % 28
C = Matriz(3,6); % 39

% Lista de semillas en orden
Semillas = {A, B, C};
Nombres = {'A','B','C'};  % solo para mostrar

% Parámetro de umbral
U = 3;

% Inicialización de matriz de etiquetas
Etiquetas = zeros(size(Matriz));

% Bucle para recorrer cada semilla
for k = 1:length(Semillas)
    semilla = Semillas{k};
    nombre = Nombres{k};

    fprintf('\nProcesando semilla %s = %d\n', nombre, semilla);

    % Recorrer toda la matriz
    for i = 1:size(Matriz,1)
        for j = 1:size(Matriz,2)
            valor = Matriz(i,j);

            % Verificar si el valor es adyacente a la semilla
            if abs(valor - semilla) <= U
                % Si ya no está etiquetado, asignar esta semilla
                if Etiquetas(i,j) == 0
                    Etiquetas(i,j) = k;
                end
            end
        end
    end

    % Mostrar matriz parcial después de cada paso
    fprintf('Matriz de etiquetas después de procesar %s:\n', nombre);
    disp(Etiquetas)
end

% Resultado final
disp('--- Resultado final ---');
disp(Etiquetas);
