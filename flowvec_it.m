tc_v=zeros(1,8);
r_v=zeros(10,8);
for i= 1:8

[tc_v(i),r_v(:,i)]= flowvecit(A,s,c,p,E,f2(:,i));

end

function[tc,r]= flowvecit(A,s,c,p,E,f2)
[~,edges]=size(A);
[~,inst]=size(s);
cvx_begin
variable f1(edges,inst)
variable r(edges)
%     for i = 1:edges
%         E(i)=E(i)*(r(i)>10^(-9));
%     end
tc=dot(p,r)+dot(f2,E);
minimize(tc)
subject to
for i = 1:inst
    0<= f1(:,i) <= r(:);
    r(:) <= f2(:).*c(:);
    0 <= f2(:) <= 1;
    A*f1(:,i) == -s(:,i);
end
cvx_end
end