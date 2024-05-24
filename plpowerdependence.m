%Extract spectrum of S,P polarization from SPE file
figure(1)
for i=1:2
subplot(2,1,i)
imagesc(Data_expand_spec(:,:,4*(i-1)+1));  %change the number 4 to see maping of differernt spectrum
colormap 'jet'
end

yi=input('Y = '); % center pixel poistion
yb=input('background = ');
delta=input('width of crosssection = ');
ys1=yi-round(delta/2);
ys2=yi+round(delta/2);
yb1=yb-round(delta/2);
yb2=yb+round(delta/2);

% find the peak position
for i=1:k_spec
    PL_E(:,:,i)=Data_expand_spec(ys1:ys2,:,i);
    BG_E(:,:,i)=Data_expand_spec(yb1:yb2,:,i);
end

figure(2)
for i=1:k_spec
  PL(:,i)=sum(PL_E(:,:,i))-sum(BG_E(:,:,i));
  subplot(k_spec,1,i)
  plot(PL(:,i));
end
