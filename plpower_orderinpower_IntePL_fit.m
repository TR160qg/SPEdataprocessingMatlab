a1=input('a initial= ');
b1=input('b initial= ');
Fitt_op=fitoptions('Method','NonlinearLeastSquares',...
'Lower', [0, 0],...
'Upper', [Inf, max(x_excPower)],...
'StartPoint', [a1 b1]);
%Fitt=fittype('a*x+b','dependent',{'y'},'independent',{'x'},'coefficients', {'a','b'},'options',Fitt_op)
Fitt=fittype('a*x.^b','dependent',{'y'},'independent',{'x'},'coefficients', {'a','b'},'options',Fitt_op)

IntegratedPL_Fit=fit(x_excPower',IntegratedPL',Fitt)
Coeffs=coeffvalues(IntegratedPL_Fit)
A=Coeffs(1);
B=Coeffs(2);

x=[0:25,0.001]; % change here according to practical values
%Fitt_re=A*x+B;
%Fitt_re=A*x.^B;
figure(6)
plot(x_excPower,IntegratedPL,'o')
hold on
plot(x,Fitt_re,'-*')
hold off
xlim([0 27])