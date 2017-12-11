%% Parte 2 - Arestas com Overhead (Relaxação de aresta)

function[tc,r]= flowvecitfunc(A,s,c,p,E,g)
	[~,edges]=size(A);
	[~,inst]=size(s);
	
	cvx_begin
	variable f(edges,inst)
	variable r(edges)
	tc=dot(p,r)+dot(g,E);
	minimize(tc)
	subject to
	for i = 1:inst
		0 <= f(:,i) <= r(:);
		r <= g.*c;
		A*f(:,i) + s(:,i)<=10^(-10);
	end
	cvx_end
	
end