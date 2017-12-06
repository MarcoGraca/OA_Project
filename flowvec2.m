function[f1,f2,tc,r]= flowvec2(A,s,c,p,E)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
variable f1(edges,inst)
variable r(edges)
variable f2(edges)
%     for i = 1:edges
%         E(i)=E(i)*(r(i)>10^(-9));
%     end
tc=dot(p,r)+dot(f2,E);
minimize(tc)
subject to
for i = 1:inst
    0<= f1(:,i) <= r;
    r <= f2.*c;
    0 <= f2 <= 1;
    A*f1(:,i) + s(:,i) <= 10^{-10};
end
cvx_end
end