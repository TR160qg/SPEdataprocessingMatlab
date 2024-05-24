clear all
clc
List=ls('*.spe');
Listname=string(List);
ns=size(Listname,1);
k_image=0;
k_spec=0;
for i=1:ns
    filename=string(Listname(i));
    [data,wavelength,para]=loadSPE_F(filename);
    Data_expand(:,:,i)=data'; %expand all measurement to 3D array.
    lamda_expand(:,:,i)=wavelength';
    t(i)=size(find(wavelength<0),2);
    if t(i)>0
        k_image=k_image+1;
    Data_expand_image(:,:,k_image)=data'; %expand all measurement to 3D array.
    lamda_expand_image(:,:,k_image)=wavelength';
    else
        k_spec=k_spec+1;
    Data_expand_spec(:,:,k_spec)=data'; %expand all measurement to 3D array.
    lamda_expand_spec(:,:,k_spec)=wavelength';
    Spec_name(k_spec)=filename;
    end
    clear data wavelength para
end
sizedata=size(Data_expand_spec);
y=[1:sizedata(1,:,:)]';
