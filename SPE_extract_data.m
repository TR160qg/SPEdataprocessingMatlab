clear all
clc
[A1,x1,parameter]=loadSPE_F('WS2 NR, narrow reag_4.3k_WF max power 48mW_150g_cw700, PL 120s_slit select-4.spe');
% plot first image
y=[42:43]';
Area=A1';
figure(1)
imagesc(x1,y,Area);
xlabel('wavelength (nm)');
ylabel('pixel');
colormap('jet');


