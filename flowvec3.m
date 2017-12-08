load('incidmatrix');
load('overheads');
load('p1_group_31_scenarios');
load('maxflowperedge');
load('costperunitflow');
[~,edges]=size(A);

[~,g,~,~]= flowvec2(A,s,c,p,E);

for i=1:edges
        if g(i)<0.1
            g(i)=0;
        else
            g(i)=1;
        end
end

[tc_v,r_v]= flowvecitfunc(A,s,c,p,E,g);