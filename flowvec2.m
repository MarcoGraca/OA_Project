%% Parte 2 - Arestas com Overhead

function[f,g,tc,r]= flowvec2(A,s,c,p,E)
	[~,edges]=size(A);
	[~,inst]=size(s);
	
	cvx_begin
	variable f(edges,inst)
	variable r(edges)
	variable g(edges)
	tc=dot(p,r)+dot(g,E);
	minimize(tc)
	subject to
	for i = 1:inst
		0 <= f(:,i) <= r;
		r <= g.*c;
		0 <= g <= 1;
		A*f(:,i) + s(:,i) <= 10^(-10);
	end
	cvx_end
	
end