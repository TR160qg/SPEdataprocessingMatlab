xi=input('Xinitial= ');
xf=input('Xfinal= ');
delta=xf-xi;
xfb=input('X_final_bacground= ');
xib=xfb-delta;
step=input('degree step=');
if k_spec <19
    k_final=k_spec*2-1;
else
    k_final=k_spec;
end
for i=1:k_final
    if i<=k_spec
        t=i;
    else
        t=i-k_spec+1;
    end
    degree(i)=((i-1)*step/180)*pi;
    SP1=SP(xi:xf,t);
    SP1b=SP(xib:xfb,t);
    Intensity_S(i)=sum(SP1)-sum(SP1b);
    PP1=PP(xi:xf,t);
    PP1b=PP(xib:xfb,t);
    Intensity_P(i)=sum(PP1)-sum(PP1b);
    DLP_S(i)=Intensity_S(t)/(Intensity_S(t)+Intensity_P(t));
    DLP_P(i)=Intensity_P(t)/(Intensity_S(t)+Intensity_P(t));
    clear SP1 SP1b PP1 PP1b 
end
DLP=(DLP_S-DLP_P)./(DLP_S+DLP_P);
x=lamda_expand_spec(:,:,1);
x_eV=1240./x;
figure(7)
plot(degree*2,DLP_S,'-o')
hold on
plot(degree*2,DLP_P,'-+')
hold off
figure(8)
polarplot(degree*2,DLP_S,'-o')
hold on
polarplot(degree*2,DLP_P,'-*')
rlim([0 1])
hold off
figure(9)
polarplot(degree*2,DLP,'-o')
rlim([-1 1])

