A=imread('car.ppm');
A=double(A);
s=size(A);
m1=[255 0 0];
m2=[0 0 0];
m3=[255 255 0];
i1=1; i2=1; i3=1;
iter=10;
for l=1:iter
   for i=1: s(1)
    for j=1:s(2)
        v=[A(i,j,1) A(i,j,2) A(i,j,3)];    
        [x,k]=min([norm(v-m1) norm(v-m2) norm(v-m3)]);
        if k==1
            cl1{i1}=[A(i,j,1) A(i,j,2) A(i,j,3)];
            i1=i1+1;
        end
       if k==2
            cl2{i2}=[A(i,j,1) A(i,j,2) A(i,j,3)];
            i2=i2+1;
       end
       
        if k==3
            cl3{i3}=[A(i,j,1) A(i,j,2) A(i,j,3)];
            i3=i3+1;
        end
    end
   end
   dim=ndims(cl1);
   c1=cat(dim+1,cl1{:});
   m1=mean(c1,dim+1);
   
   dim=ndims(cl2);
   c2=cat(dim+1,cl2{:});
   m2=mean(c2,dim+1);
   
   dim=ndims(cl3);
   c3=cat(dim+1,cl3{:});
   m3=mean(c3,dim+1);
   
   cl1={};
   cl2={};
   cl3={};
   
end
 

        
  