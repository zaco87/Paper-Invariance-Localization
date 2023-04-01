function go_to_and_show_ALMKERBS_after(An,Ln,Mn,Kn,En,Rn,Bn,Sn,DQ,RQ)
%%%%% new part - spectrograms

figure(98);   % showing the data as is, after retrieving it via the algorithm
subplot(1,2,1);
plot(DQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn}); %D
title('D');
xlabel('samples');
ylabel('strength[V]');
subplot(1,2,2);
plot(RQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn}); %R
title('R');
xlabel('samples');


input_rate=500000; % input rate of the signal
s_window=200;   % window to be used in the spectrogram
s_overlap=s_window-1;   %  overlap to be used in the spectrogram
s_nfft=512;   % nfft to be used in the spectrogram
cf1=100000;    % cutoff frequency 1 in the chirp (10KHz)
cf2=10000;   % cutoff frequency 2 in the chirp (100KHz)
chirp_time=2*10^-3;   % [2ms]
DQ0=DQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn};
RQ0=RQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn};
strtD=1650;
strtR=1650;
endD=strtD+1500+(2000-strtD);
endR=strtR+1500+(2000-strtR);
D=DQ0(strtD:endD);
R=RQ0(strtR:endR);


figure(97);
subplot(2,2,1)
[s_temp,f_temp,t_temp,p_temp_D]=spectrogram(D,s_window,s_overlap,s_nfft,input_rate,'yaxis');                                            
image(t_temp,f_temp,(10*log10(abs(p_temp_D))),'CDataMapping','scaled'); axis xy;
ylabel('frequency[Hz] ,strength[dB]');
xlabel('samples (from a point)');
title(['A' num2str(An),' L' num2str(Ln),' M' num2str(Mn),' K' num2str(Kn),' E' num2str(En),' R' num2str(Rn),' B' num2str(Bn),' S' num2str(Sn)]);
subplot(2,2,2)
[s_temp,f_temp,t_temp,p_temp_R]=spectrogram(R,s_window,s_overlap,s_nfft,input_rate,'yaxis');                      
image(t_temp,f_temp,(10*log10(abs(p_temp_R))),'CDataMapping','scaled'); axis xy;
xlabel('samples (from a point)');

subplot(2,2,3)
[s_temp,f_temp,t_temp,p_temp_Dr]=spectrogram(D,s_window,s_overlap,s_nfft,input_rate,'yaxis');%%%%
Drot=rotate_spectrogramQ(p_temp_Dr,f_temp,t_temp,cf1,cf2,chirp_time,input_rate); %%%%%%%
%
%[s_temp,f_temp,t_temp,p_temp_Dr]=spectrogram(Drot,s_window,s_overlap,s_nfft,input_rate,'yaxis');%%%%
dx1=0.0008;   %75 x position of 1st barrier
dx2=0.0012;    % x position of 2nd barrier
dx0=0.0002;
sdx1=ceil(dx1/( t_temp(2)-t_temp(1) ) );     % same as dx1, but in samples units
sdx2=ceil(dx2/( t_temp(2)-t_temp(1) ) );     % same as dx2, but in samples units
sdx0=ceil(dx0/( t_temp(2)-t_temp(1) ) );     % same as dx0, but in samples units

V_M_f(max(size(f_temp)))=0;
V_M_f_loc(max(size(f_temp)))=0;
for i=1:1:(max(size(f_temp)))
    z3=Drot(i,sdx1-sdx0:sdx2-sdx0);
    z4=10*log10(abs(z3));
        [V_M_f(i), V_M_f_loc(i)]=max(z4);
end;

%V_M_f
%V_M_f_loc

%
image(t_temp,f_temp,(10*log10(abs(Drot))),'CDataMapping','scaled'); axis xy;
ylabel('frequency[Hz], strength[dB]');
xlabel('Rotated samples (from a point)');
hold on;
plot([dx1 dx1],[0 1*10^5],'-r');
plot([dx2 dx2],[0 1*10^5],'-r');
xV=V_M_f_loc*( t_temp(2)-t_temp(1))+dx1;
xY=(1:max(size(f_temp)))*(f_temp(2)-f_temp(1));
xY=xY-(f_temp(2)-f_temp(1));
plot( xV, xY  ,'-r');
hold off;

subplot(2,2,4)
[s_temp,f_temp,t_temp,p_temp_Rr]=spectrogram(R,s_window,s_overlap,s_nfft,input_rate,'yaxis');%%%%
Rrot=rotate_spectrogramQ(p_temp_Rr,f_temp,t_temp,cf1,cf2,chirp_time,input_rate); %%%%%%%

dx1r=0.0008;   %75 x position of 1st barrier
dx2r=0.0012;    % x position of 2nd barrier
dx0r=0.0002;
sdx1r=ceil(dx1r/( t_temp(2)-t_temp(1) ) );     % same as dx1, but in samples units
sdx2r=ceil(dx2r/( t_temp(2)-t_temp(1) ) );     % same as dx2, but in samples units
sdx0r=ceil(dx0r/( t_temp(2)-t_temp(1) ) );     % same as dx0, but in samples units

V_M_fr(max(size(f_temp)))=0;
V_M_f_locr(max(size(f_temp)))=0;
for i=1:1:(max(size(f_temp)))
    z3r=Rrot(i,sdx1r-sdx0r:sdx2r-sdx0r);
    z4r=10*log10(abs(z3r));
        [V_M_fr(i), V_M_f_locr(i)]=max(z4r);
end;


%[s_temp,f_temp,t_temp,p_temp_Dr]=spectrogram(Drot,s_window,s_overlap,s_nfft,input_rate,'yaxis');%%%%
image(t_temp,f_temp,(10*log10(abs(Rrot))),'CDataMapping','scaled'); axis xy;
ylabel('frequency[Hz] ,strength[dB]');
xlabel('Rotated samples (from a point)');
hold on;
rx1=0.00080;%75
rx2=0.0011;
plot([rx1 rx1],[0 1*10^5],'-r');
plot([rx2 rx2],[0 1*10^5],'-r');
hold off;
hold on;
plot([dx1r dx1r],[0 1*10^5],'-r');
plot([dx2r dx2r],[0 1*10^5],'-r');
xVr=V_M_f_locr*( t_temp(2)-t_temp(1))+dx1r;
xYr=(1:max(size(f_temp)))*(f_temp(2)-f_temp(1));
xYr=xYr-(f_temp(2)-f_temp(1));
plot( xVr, xYr  ,'-r');
hold off;

end