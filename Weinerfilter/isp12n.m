I = im2double(imread('lena.pgm'));
s=size(I);
PSF= fspecial('gaussian',[3,3],1);
blurred = imfilter(I, PSF);
noise_var=0.01;
noise = normrnd(0, sqrt(8),s(1),s(2));
blurred=imnoise(blurred,'gaussian',0, noise_var);
figure(1)
imshow(blurred)
H = psf2otf(PSF, s);
s1=size(H);
k=linspace(0.01,2,1900);
mini=100000;
for k=1:1900
    denom = abs(H).^2;
    denom=denom+k;
    G = conj(H)./denom;
    clear denom;
    J = (ifftn(G .* fftn(blurred)));
    clear G;
   difference = single(J) - single(blurred);
    squaredError = difference .^ 2;
    meanSquaredError = sum(squaredError(:)) / numel(J);
    rmsError = sqrt(meanSquaredError);
    if rmsError < mini
        mini=rmsError;
        idx=k;
    end
end
 denom = abs(H).^2;
    denom=denom+idx;
    G = conj(H)./denom;
    clear denom;
    J = ifftn(G .* fftn(blurred));
    clear G;
   
    figure(2)
    imshow(J)

