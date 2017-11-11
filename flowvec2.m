function[f,tc]= flowvec(A,s,c,p,E)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
variable f1(edges,inst)
variable r(edges)
variable f2(edges) binary
%     for i = 1:edges
%         E(i)=E(i)*(r(i)>10^(-9));
%     end
tc=dot(p,r)+dot(f2,E);
minimize(tc)
subject to
for i = 1:inst
    0<= f1(:,i) <= r(i);
    r(i) <= f2(i)*c(i);
    A*f1(:,i)== -s(:,i);
end
cvx_end
end