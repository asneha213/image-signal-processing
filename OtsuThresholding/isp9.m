A=imread('palmleaf1.pgm');
bins = 256;
counts= imhist(A,bins);
p= counts/sum(counts);
omega1 = cumsum(p);
mu1 = cumsum(p .* (1:bins)');
mu_t=mu1(end);
omega2 = 1-omega1;
mu2 = mu_t - mu1;
sigma_b_square = omega1.*omega2.* (mu1-mu2).*(mu1-mu2);
[sigb,th] = max(sigma_b_square);
th=th/bins
imshow(im2bw(A,th));


A=imread('palmleaf2.pgm');
 
%th=graythresh(A);
bins = 256;
counts= imhist(A,bins);
p= counts/sum(counts);
omega1 = cumsum(p);
mu1 = cumsum(p .* (1:bins)');
mu_t=mu1(end);
omega2 = 1-omega1;
mu2 = mu_t - mu1;
sigma_b_square = omega1.*omega2.* (mu1-mu2).*(mu1-mu2);
[sigb,th] = max(sigma_b_square);
th=(th-1)/(bins-1)
figure(2)
imshow(im2bw(A,th));


