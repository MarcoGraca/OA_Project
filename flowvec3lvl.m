%% Parte 4 - Diferentes declives no custo

function[tc,f,r]= flowvec3lvl(A,s,l)
	[~,edges]=size(A);
	[~,inst]=size(s);
	[levels,~]=size(l);
	
	cvx_begin
	variable f(edges,inst,levels)
	variable r(edges,levels)
	tc=dot(l(:,2),sum(r,1));
	minimize(tc)
	subject to
	for i = 1:inst
		for j = 1:levels
			0 <= f(:,i,j) <= r(:,j);
			f(:,i,j) <= r(:,j) <= l(j,1);
		end
		A*(sum(f(:,i,:),3)) + s(:,i) <= 10^(-10);
	end
	cvx_end
	
end