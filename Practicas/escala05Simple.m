function J = escala05Simple(I)
    [M,N] = size(I);
    MJ = 0.5*M; %Sx=Sy=0.5
    NJ = 0.5*N; %Sx=Sy=0.5
    J = zeros(MJ,NJ);
    J(1:2:MJ-1, 1:2:NJ-1) = I; % Esquina superior izquierda del bloque 2x2
    J(1:2:MJ-1, 2:2:NJ)   = I; % Esquina superior derecha del bloque 2x2
    J(2:2:MJ,   1:2:NJ-1) = I; % Esquina inferior izquierda del bloque 2x2
    J(2:2:MJ,   2:2:NJ)   = I; % Esquina inferior derecha del bloque 2x2