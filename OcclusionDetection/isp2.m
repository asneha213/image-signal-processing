I1 = imread('IMG1.pgm');
I2 = imread('IMG2.pgm');

x1=125;x2=373;y1=30;y2=158;
x1hat=249;x2hat=400;y1hat=94;y2hat=329;



im_size1 = size(I1);
im_size2 = size(I2);

J= zeros(im_size1(1),im_size1(2),'uint8');


xhat=[x1hat y1hat x2hat y2hat]';

x = [x1 y1 1 0;y1 -x1 0 1;x2 y2 1 0;y2 -x2 0 1];

h = x^-1*xhat;
disp(h);

h1=h(1);h2=h(2);tx=h(3);ty=h(4);

h=[h1 -h2 ty;h2 h1 tx;0 0 1];

for i=1:im_size1(1)
    for j=1:im_size1(2)
        ihat=[i j 1]';
        i2 = h*ihat;
        x = i2(1);
        y = i2(2);
        xf = floor(x);
        yf = floor(y);
        a = x - xf;
        b = y - yf;
        if xf >=1 && yf >=1 && xf < im_size2(1) && yf < im_size2(2)
            %target(row,col) = bilinear_interpol(a,b,image2(xf,yf),image2(xf,yf+1),image2(xf+1,yf),image2(xf+1,yf+1));
           J(i,j) =I2(xf,yf);
        end
    end
end

figure(1);
imshow(J);

image_final = J - I1;

figure(2);
imshow(image_final);