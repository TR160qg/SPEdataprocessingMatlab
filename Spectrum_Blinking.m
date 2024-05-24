clear all
clc
[A1,x,parameter]=loadSPE_F('BL_LN.spe');
y=[1:100]';
% plot first image
sizeA1=size(A1);
t_final=sizeA1(3);
Area1=A1(:,:,1)';
figure(3)
imagesc(x,y,Area1);
xlabel('wavelength (nm)');
ylabel('pixel');

% select specific area to extract data
y1=input('initial pixel =');
y2=input('end pixel =');

% select background area to extract data
y3=input('initial BG pixel =');
y4=y3+(y2-y1);
% convert 3D array to 2D array with time
int_time=input('integrated time= ');
for u=1:t_final
    B=A1(:,:,u);
    Area=B';
    for i=y1:y2;
        j=i-y1+1;
        k=y3+j;
        Spec(j,:)=Area(i,:);
        BG(j,:)=Area(k,:);
    end
    Spec_Corr=Spec-BG;
    Spectrum(u,:)=sum(Spec);
    Spectrum_BG_Corr(u,:)=sum(Spec_Corr);
end
t=[1:t_final]';
time=t*int_time;
figure(4)
imagesc(x,time,Spectrum);
xlabel('Wavelength (nm)');
ylabel('Duration time (s)');
colorbar;
colormap('jet');
figure(5)
imagesc(x,time,Spectrum_BG_Corr);
xlabel('Wavelength (nm)');
ylabel('Duration time (s)');
colorbar;
colormap('jet');
figure(6)
Intensity_integration=sum(Spectrum);
Intensity_integration_BG=sum(Spectrum_BG_Corr);
plot(x,Intensity_integration)
figure(7)
plot(x,Intensity_integration_BG)