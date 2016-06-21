x=imread('peppers.pgm');
[M,N]=size(x);
x=double(x);
X=zeros(M,N);
X=double(X);
A=zeros(M,N);
A=double(A);
% for n1=1:M
%     for k2=1:N
%         A(n1,k2)= sum(x(n1,:).*exp(((-2i*pi*k2)/N)*[0:N-1]));
%     end
% end
% 
% for k1=1:M
%     for k2=1:N
%         X(k1,k2)= abs(sum(A(:,k2).*(exp(((-2i*pi*k1)/M)*[0:M-1]))'));
%     end
% end

for l=1:M
    A(l,:)=fft(x(l,:));
end
for l=1:N
    X(:,l)=(1/N)*fft(A(:,l));
end
figure(1)
imshow(uint8(abs(X)))

A(1:256,1:256)=X(257:512,257:512);
A(257:512,257:512)=X(1:256,1:256);
A(1:256,257:512)=X(257:512,1:256);
A(257:512,1:256)=X(1:256,257:512);
%mesh(abs(A))

figure(2)
imshow(uint8(abs(A)))


        






   
    
    

