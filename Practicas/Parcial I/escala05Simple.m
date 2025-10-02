function J = escala05Simple(I)
    [M,N] = size(I);
    MJ = 0.5*M; %Sx=Sy=0.5
    NJ = 0.5*N; %Sx=Sy=0.5
    J = zeros(MJ,NJ);
    J = I(1:2:end, 1:2:end);