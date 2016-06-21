x1=imread('Image1.pgm');
x1=double(x1);
x2=imread('Image2.pgm');
x2=double(x2);
X1=fft(x1);
X2=fft(x2);
[m,n]=size(x1);

X3=zeros(m,n);
X3=double(X3);
X4=zeros(m,n);
X4=double(X4);
x3=zeros(m,n);
x3=double(x3);
x4=zeros(m,n);
x4=double(x4);


for k=1:m
    for j=1:n
        X3(k,j)=abs(X1(k,j))*exp(1i*angle(X2(k,j)));
        X4(k,j)=abs(X2(k,j))*exp(1i*angle(X1(k,j)));
    end 
end
x3=ifft(X3);
x4=ifft(X4);
figure(1);
imshow(uint8(x3));
figure(2);
imshow(uint8(x4));
        

