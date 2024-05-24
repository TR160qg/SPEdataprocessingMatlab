%Extract spectrum of S,P polarization from SPE file
figure(4)
for i=1:3
subplot(3,1,i)
imagesc(Data_expand_spec(:,:,3*(i-1)+1));
colormap 'jet'
end
yi=input('Y_S-polarize= ');
yf=input('Y_P-polarize= ');
yb=input('background= ');
delta=input('width of crosssection = ');
ys1=yi-round(delta/2);
ys2=yi+round(delta/2);
yp1=yf-round(delta/2);
yp2=yf+round(delta/2);
yb1=yb-round(delta/2);
yb2=yb+round(delta/2);
% find the peak position
for i=1:k_spec
    SP_E(:,:,i)=Data_expand_spec(ys1:ys2,:,i);
    PP_E(:,:,i)=Data_expand_spec(yp1:yp2,:,i);
    BG_E(:,:,i)=Data_expand_spec(yb1:yb2,:,i);
end
figure(3)
for i=1:k_spec
  SP(:,i)=sum(SP_E(:,:,i))-sum(BG_E(:,:,i));
  PP(:,i)=sum(PP_E(:,:,i))-sum(BG_E(:,:,i));
  subplot(k_spec,1,i)
  plot(SP(:,i));
  hold on
  plot(PP(:,i));
  hold off
end
x=lamda_expand_spec(:,:,1);
x_eV=1240./x;
figure(5)
stackedplot(SP)
figure(6)
stackedplot(PP)