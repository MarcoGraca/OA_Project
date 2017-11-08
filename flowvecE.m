function[f,tc]= flowvec(A,s,c,p,E)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
variables f(edges,inst)
r=max(f,[],2);
%     for i = 1:edges
%         E(i)=E(i)*(r(i)>10^(-9));
%     end
tc=dot(p,r)+sum(E);
minimize(tc)
subject to
for i = 1:inst
    0<= f(:,i) <= c(i);
    A*f(:,i)== -s(:,i);
end
cvx_end
end
