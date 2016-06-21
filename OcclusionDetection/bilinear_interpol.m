function val = bilinear_interpol(a,b,p11,p12,p21,p22)
    val = ((1-a)*(1-b)*p11)+((1-a)*(b)*p21)+((a)*(1-b)*p12)+((a)*(b)*p22);
end

%      (p11)*-----------*p(12)
%           |   |       |  
%           |   b       |
%           |-a-*       |
%           |           |
%      (p21)*-----------*p(22)
