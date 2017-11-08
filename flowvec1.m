function[f]= flowvec1(A,s,i)
[~,edges]=size(A);
si=s(:,i);
cvx_begin
    variable f(edges)
    minimize( norm(A*f+si,2) )
    subject to
    0 <= f <= 1    
cvx_end
end