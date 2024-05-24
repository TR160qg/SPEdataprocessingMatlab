%To change order of the data from low power to high power
%do it manully
PL_order(:,1) = PL(:,3);
PL_order(:,2) = PL(:,7);
PL_order(:,3) = PL(:,1);
PL_order(:,4) = PL(:,2);
PL_order(:,5) = PL(:,4);
PL_order(:,6) = PL(:,5);
PL_order(:,7) = PL(:,6);

figure(3)
x=lamda_expand_spec(:,:,1);
x_eV=1239.842./x;
for i=1:k_spec
  subplot(k_spec,1,i)
  plot(x_eV,PL_order(:,i));
  xlim([1.65 1.85])
  %ylim([0 5000])
  xlabel("energy (eV)")
  ylabel("PL intensity (a.u.)")
end

figure(4)
stackedplot(PL_order)
