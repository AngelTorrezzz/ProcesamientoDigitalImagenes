function J = escalaUnMedio(I)
    [M,N] = size(I);
    MJ = 0.5*M; %Sx=Sy=0.5
    NJ = 0.5*N; %Sx=Sy=0.5
    J = zeros(MJ,NJ);
    J(1:2:MJ-1, 1:2:NJ-1) = I;
    J(2:2:MJ,   2:2:NJ) = I;
    J(1:2:MJ-1, 2:2:NJ) = I;
    J(2:2:MJ,   1:2:NJ-1) = I;