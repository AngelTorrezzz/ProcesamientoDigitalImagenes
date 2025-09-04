clear all
close all



A=imread('./imagenes/angio.bmp');
B=imread('./imagenes/franjas2.bmp');
Img = A;
[nfils,ncols]=size(Img);


imtool(A);
imtool(B);
A1 = 4*log(double(A+1));
B1 = 2*log(double(B+1));
gamma = 2;
B2 = double(B).^gamma;

imtool(A1,[]);
imtool(B1,[]);
imtool(B2,[]);


B3 = 2*log(double(B2+1));
imtool(B3,[]);

                                                    

