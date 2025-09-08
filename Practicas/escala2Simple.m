function J = escala2Simple(I)
    [M,N] = size(I);
    MJ = 2*M; %Sx=Sy=2
    NJ = 2*N; %Sx=Sy=2
    J = zeros(MJ,NJ);
    J(1:2:MJ-1, 1:2:NJ-1) = I; % Esquina superior izquierda del bloque 2x2
    J(1:2:MJ-1, 2:2:NJ)   = I; % Esquina superior derecha del bloque 2x2
    J(2:2:MJ,   1:2:NJ-1) = I; % Esquina inferior izquierda del bloque 2x2
    J(2:2:MJ,   2:2:NJ)   = I; % Esquina inferior derecha del bloque 2x2