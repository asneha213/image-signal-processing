[corr1, corr2] = sift_corresp('img2.pgm','img1.pgm');
[m,n]=size(corr1);

C=1;
while 1
    r = randi([1,357],1,4);

    A = single([ [ corr1(r(1),1), corr1(r(1),2), 1,0,0,0,-1*corr1(r(1),1)*corr2(r(1),1), -1*corr2(r(1),1)*corr1(r(1),2), -1*corr2(r(1),1)],
        [0,0,0,corr1(r(1),1),corr1(r(1),2), 1,-1*corr1(r(1),1)*corr2(r(1),2), -1*corr2(r(1),2)*corr1(r(1),2), -1*corr2(r(1),2)],
         [ corr1(r(2),1), corr1(r(2),2), 1,0,0,0,-1*corr1(r(2),1)*corr2(r(2),1), -1*corr2(r(2),1)*corr1(r(2),2), -1*corr2(r(2),1)],
       [0,0,0,corr1(r(2),1),corr1(r(2),2), 1,-1*corr1(r(2),1)*corr2(r(2),2), -1*corr2(r(2),2)*corr1(r(2),2), -1*corr2(r(2),2)],
       [ corr1(r(3),1), corr1(r(3),2), 1,0,0,0,-1*corr1(r(3),1)*corr2(r(3),1), -1*corr2(r(3),1)*corr1(r(3),2), -1*corr2(r(3),1)],
       [0,0,0,corr1(r(3),1),corr1(r(3),2), 1,-1*corr1(r(3),1)*corr2(r(3),2), -1*corr2(r(3),2)*corr1(r(3),2), -1*corr2(r(3),2)],
        [ corr1(r(4),1), corr1(r(4),2), 1,0,0,0,-1*corr1(r(4),1)*corr2(r(4),1), -1*corr2(r(4),1)*corr1(r(4),2), -1*corr2(r(4),1)],
       [0,0,0,corr1(r(4),1),corr1(r(4),2), 1,-1*corr1(r(4),1)*corr2(r(4),2), -1*corr2(r(4),2)*corr1(r(4),2), -1*corr2(r(4),2)] ]);
    Z=null(A);
    if size(Z,2)== 2
          nh9 = (1-Z(9,1))/Z(9,2);
        S=Z(:,1)+nh9*Z(:,2);
    else
        S=Z;
    end
    
        
  
  
    h12=single([[S(1),S(2),S(3)],
        [S(4),S(5),S(6)],
        [S(7),S(8),S(9)] ]);
    k=0;
    for i=1:m
        X=zeros(3,1);
        X(1,1)=corr1(i,1);
        X(2,1)=corr1(i,2);
        X(3,1)=1;
        Y=h12*X;
        Y=(h12*X)/Y(3,1);
     
        if ((corr2(i,1)-Y(1,1))^2 + (corr2(i,2)-Y(2,1))^2) <20
            k=k+1;
            con(1,k)=i;
        end
         
    end
    
     if size(con,2)> 0.8*m
         break;
    
     end

end

h12
[corr3, corr4] = sift_corresp('img2.pgm','img3.pgm');
[m,n]=size(corr3);

C=1;
while 1
    r = randi([1,357],1,4);

    A = single([ [ corr3(r(1),1), corr3(r(1),2), 1,0,0,0,-1*corr3(r(1),1)*corr4(r(1),1), -1*corr4(r(1),1)*corr3(r(1),2), -1*corr4(r(1),1)],
        [0,0,0,corr3(r(1),1),corr3(r(1),2), 1,-1*corr3(r(1),1)*corr4(r(1),2), -1*corr4(r(1),2)*corr3(r(1),2), -1*corr4(r(1),2)],
         [ corr3(r(2),1), corr3(r(2),2), 1,0,0,0,-1*corr3(r(2),1)*corr4(r(2),1), -1*corr4(r(2),1)*corr3(r(2),2), -1*corr4(r(2),1)],
       [0,0,0,corr3(r(2),1),corr3(r(2),2), 1,-1*corr3(r(2),1)*corr4(r(2),2), -1*corr4(r(2),2)*corr3(r(2),2), -1*corr4(r(2),2)],
       [ corr3(r(3),1), corr3(r(3),2), 1,0,0,0,-1*corr3(r(3),1)*corr4(r(3),1), -1*corr4(r(3),1)*corr3(r(3),2), -1*corr4(r(3),1)],
       [0,0,0,corr3(r(3),1),corr3(r(3),2), 1,-1*corr3(r(3),1)*corr4(r(3),2), -1*corr4(r(3),2)*corr3(r(3),2), -1*corr4(r(3),2)],
        [ corr3(r(4),1), corr3(r(4),2), 1,0,0,0,-1*corr3(r(4),1)*corr4(r(4),1), -1*corr4(r(4),1)*corr3(r(4),2), -1*corr4(r(4),1)],
       [0,0,0,corr3(r(4),1),corr3(r(4),2), 1,-1*corr3(r(4),1)*corr4(r(4),2), -1*corr4(r(4),2)*corr3(r(4),2), -1*corr4(r(4),2)] ]);
    Z=null(A);
    if size(Z,2)== 2
          nh9 = (1-Z(9,1))/Z(9,2);
        S=Z(:,1)+nh9*Z(:,2);
    else
        S=Z;
    end
    
        
  
  
    h32=single([[S(1),S(2),S(3)],
        [S(4),S(5),S(6)],
        [S(7),S(8),S(9)] ]);
    k=0;
    for i=1:m
        X=zeros(3,1);
        X(1,1)=corr3(i,1);
        X(2,1)=corr3(i,2);
        X(3,1)=1;
        Y=h32*X;
        Y=(h32*X)/Y(3,1);
     
        if ((corr4(i,1)-Y(1,1))^2 + (corr4(i,2)-Y(2,1))^2) <100
            k=k+1;
            con(1,k)=i;
        end
         
    end
    
     if size(con,2)> 0.8*m
         break;
    
     end

end

h32
I1=imread('img1.pgm');
I2=imread('img2.pgm');
I3=imread('img3.pgm');
size1=size(I1);
size2=size(I2);
size3=size(I3);
target = zeros(size1(1)*2.5,2.75*size1(2),'uint8');
x_off = size1(2);
y_off = 0;

for m=-0.75*size1(2):2*size1(2)
    for n=-size1(1):1.5*size1(1)
        xhat = n;
        yhat = m;
        temp = h12*[xhat yhat 1]';
        temp = temp/temp(3);
        x = temp(1);
        y = temp(2);
        xf = floor(x);yf=floor(y);a=x-xf;b=y-yf;
        if xf>0 && yf>0 && xf<size1(1) && yf<size1(2)
            %int1 = bilinear_interpol(a,b,I1(xf,yf),I1(xf,yf+1),I1(xf+1,yf),I1(xf+1,yf+1));
            int1=I1(xf,yf);
            flag1=1;
        else
            int1=0;
            flag1=0;
        end
        
        temp = [1 0 0;0 1 0;0 0 1]*[xhat yhat 1]'; 
        temp = temp/temp(3);
        x = temp(1);
        y = temp(2);
        xf = floor(x);yf=floor(y);a=x-xf;b=y-yf;
        if xf>0 && yf>0 && xf<size2(1) && yf<size2(2)
            %int2 = bilinear_interpol(a,b,I2(xf,yf),I2(xf,yf+1),I2(xf+1,yf),I2(xf+1,yf+1));
            int2=I2(xf,yf);
            flag2=1;
        else
            int2=0;
            flag2=0;
        end
        
        temp = h32*[xhat yhat 1]'; 
        temp = temp/temp(3);
        x = temp(1);
        y = temp(2);
        xf = floor(x);yf=floor(y);a=x-xf;b=y-yf;
        if xf>0 && yf>0 && xf<size2(1) && yf<size2(2)
            int3=I3(xf,yf);
           % int3 = bilinear_interpol(a,b,I3(xf,yf),I3(xf,yf+1),I3(xf+1,yf),I3(xf+1,yf+1));
            flag3=1;
        else
            int3=0;
            flag3=0;
        end

        if (flag1+flag2+flag3)==0
            target(n+size1(1)+1,m+0.75*size1(2)+1)=0;
        else
%             disp(((int1/(flag1+flag2+flag3))+(int2/(flag1+flag2+flag3))+(int3/(flag1+flag2+flag3))));
%             target(n+size1(1)+1,m+0.75*size1(2)+1)=((int1/(flag1+flag2+flag3))+(int2/(flag1+flag2+flag3))+(int3/(flag1+flag2+flag3)));
            target(n+size1(1)+1,m+0.75*size1(2)+1)=max([int1,int2,int3]);
        end
    end
end








