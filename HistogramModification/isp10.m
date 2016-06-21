A=imread('ref_image.pgm');
bins = 256;
counts= imhist(A,bins);

B=imread('inp_image.pgm');
counts1=imhist(B,bins);

[C,hist]=imhistmatch(B,A);

figure(2)
imshow(C)

