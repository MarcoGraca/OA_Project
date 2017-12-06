function[f,o,tc,r]= flowvec2(A,s,c,p,E)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
variable f(edges,inst)
variable r(edges)
variable o(edges)
%     for i = 1:edges
%         E(i)=E(i)*(r(i)>10^(-9));
%     end
tc=dot(p,r)+dot(o,E);
minimize(tc)
subject to
for i = 1:inst
    0<= f(:,i) <= r;
    r <= o.*c;
    0 <= o <= 1;
    A*f(:,i) + s(:,i) <= 10^{-10};
end
cvx_end
end