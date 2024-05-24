deg_final=degree*2;
a1=input('a initial= ');
b1=input('b initial= ');
c1=input('c initial= ');
Fitt_op=fitoptions('Method','NonlinearLeastSquares',...
'Lower', [0.001 0.001 0]',...
'Upper', [0.5 0.9 3.14159],...
'StartPoint', [a1 b1 c1]);
Fitt=fittype('a+b*(sin(x-c))^2',...
             'dependent',{'y'},'independent',{'x'},...
             'coefficients', {'a','b','c'},'options',Fitt_op)
DLP_Fit=fit(deg_final',DLP_S',Fitt)
Coeffs=coeffvalues(DLP_Fit)
y0=Coeffs(1);
A=Coeffs(2);
xc=Coeffs(3);
Axis_degree=xc/pi*180
x_deg=[1:360,5];
x_rad=x_deg/180*pi;
Fitt_re=y0+A*(sin(x_rad-xc)).^2;
figure(10)
polarplot(degree*2,DLP_S,'o')
hold on
polarplot(x_rad,Fitt_re,'-')
hold off
rlim([0 1])