[V1,D1]=eig(g*g');
[V2,D2]=eig(g'*g);
U=V1;
V=V2;
sigma = sqrt(D1);
G= U*sigma*V';
[U0,S0,V0]=svd(g);




S1=S0;
S1(5,5)=0;
 G1=U0*S1*V0';
 ss(1)=(norm(G1-g))^2;
S1(4,4)=0;

G2=U0*S1*V0';
ss(2)=(norm(G2-g))^2;

S1(3,3)=0;

G2=U0*S1*V0';
ss(3)=(norm(G2-g))^2;


S1(2,2)=0;

G2=U0*S1*V0';
ss(4)=(norm(G2-g))^2;

S1(1,1)=0;
S1
G2=U0*S1*V0';
ss(5)=(norm(G2-g))^2;





%S1=S0;
% S1(2,2)=0;
% G=U0*S1*V0';
% ss(2)=(norm(G-g))^2;
% %S1=S0;
% S1(3,3)=0;
% G=U0*S1*V0';
% ss(3)=(norm(G-g))^2;
% %S1=S0;
% S1(4,4)=0;
% G=U0*S1*V0';
% ss(4)=(norm(G-g))^2;
% %S1=S0;
% S1(5,5)=0;
% G=U0*S1*V0';
% ss(5)=(norm(G-g))^2;
% 


