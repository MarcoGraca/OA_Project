f=zeros(1,1000);

for i=0:1000
    if i<300
        f(i+1)=0.5*i/1000;
    elseif i<700
        f(i+1)=i/1000-0.15;
    else
        f(i+1)=2*i/1000-0.85;
    end
end

x=0:0.001:1;

plot(x,f);
xlabel('Reserva');
ylabel('Custo');