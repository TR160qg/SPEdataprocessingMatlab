xi=input('Xinitial= ');
xf=input('Xfinal= ');
delta=xf-xi;
xfb=input('X_final_bacground= ');
xib=xfb-delta;

for i=1:k_spec
    PL1=PL_order(xi:xf,i);
    IntegratedPL(i)=sum(PL1);
end

x_excPower=[1 2.5 5 10 15 20 22.5]; % Give excitation power here
figure(5)
plot(x_excPower,IntegratedPL,'o')
xlabel("Excitation power")
ylabel("Integrated PL intenisty")
%ylim([-1 1])