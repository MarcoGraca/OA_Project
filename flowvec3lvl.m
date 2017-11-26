function[tc,r]= flowvec3lvl(A,s,l)
[~,edges]=size(A);
[~,inst]=size(s);
[levels,~]=size(l);
cvx_begin
variable f1(edges,inst)
variable f2(edges,inst)
variable f3(edges,inst)
variable r(edges,levels)
tc=dot(l(:,2),sum(r,1));
minimize(tc)
subject to
for i = 1:inst
    0 <= f1(:,i) <= r(:,1);
    r(:,1) <= l(1,1);
    0 <= f2(:,i) <= r(:,2);
    r(:,2) <= l(2,1);
    0 <= f3(:,i) <= r(:,3);
    r(:,3) <= l(3,1);
    A*(f1(:,i)+f2(:,i)+f3(:,i)) == -s(:,i);
end
cvx_end
end