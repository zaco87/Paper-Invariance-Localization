function [Dqqq Rqqq] = go_to_and_show_ALMKERBS_after_c(An,Ln,Mn,Kn,En,Rn,Bn,Sn,DQ,RQ)
%%%%% new part - spectrograms
last_freq_num=104;   % 104 corresponds to f=~100kHz   
first_freq_num=11;   % 11 corresponds to f=~10kHz   
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

if DQ0==0
DQ0=zeros(5000);
RQ0=DQ0;
    1111
end;

D=DQ0(strtD:endD);
R=RQ0(strtR:endR);


figure(97);
subplot(2,2,1)
[s_temp,f_temp,t_temp,p_temp_D]=spectrogram(D,s_window,s_overlap,s_nfft,input_rate,'yaxis');                                            
image(t_temp,f_temp,(10*log10(abs(p_temp_D))),'CDataMapping','scaled'); axis xy;
ylabel('frequency[Hz] ,strength[dB]');
xlabel('samples (from a point)');
title(['A' num2str(An),' L' num2str(Ln),' M' num2str(Mn),' K' num2str(Kn),' E' num2str(En),' R' num2str(Rn),' B' num2str(Bn),' S' num2str(Sn)]);
ylim([0, 100000]);  %%%%
subplot(2,2,2)
[s_temp,f_temp,t_temp,p_temp_R]=spectrogram(R,s_window,s_overlap,s_nfft,input_rate,'yaxis');                      
image(t_temp,f_temp,(10*log10(abs(p_temp_R))),'CDataMapping','scaled'); axis xy;
xlabel('samples (from a point)');
ylim([0, 100000]);  %%%%

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
plot([dx1 dx1],[0 1*10^5],'--r');
plot([dx2 dx2],[0 1*10^5],'--r');
xV=V_M_f_loc*( t_temp(2)-t_temp(1))+dx1;
xY=(1:max(size(f_temp)))*(f_temp(2)-f_temp(1));
xY=xY-(f_temp(2)-f_temp(1));
plot( xV, xY  ,'-r');
ylim([0, 100000]);  %%%%
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
%hold on;
%rx1=0.00080;%75
%rx2=0.0011;
%plot([rx1 rx1],[0 1*10^5],'-r');
%plot([rx2 rx2],[0 1*10^5],'-b');
%hold off;
hold on;
plot([dx1r dx1r],[0 1*10^5],'--r');
plot([dx2r dx2r],[0 1*10^5],'--r');
xVr=V_M_f_locr*( t_temp(2)-t_temp(1))+dx1r;
xYr=(1:max(size(f_temp)))*(f_temp(2)-f_temp(1));
xYr=xYr-(f_temp(2)-f_temp(1));
plot( xVr, xYr  ,'-r');
hold off;
ylim([0, 100000]);  %%%%


%saving process
figure(9);
plot( xVr, xYr  ,'-b');


figure(10);
subplot(2,1,1)
hold on;    % for multiple plots on the same graph - to return to normal delete this line
plot(f_temp,V_M_f,'b');
title(['A' num2str(An),' L' num2str(Ln),' M' num2str(Mn),' K' num2str(Kn),' E' num2str(En),' R' num2str(Rn),' B' num2str(Bn),' S' num2str(Sn)]); % if this line is a problem just delete it
hold on;
plot(f_temp,V_M_fr,'r');
hold off;
xlabel('frequency [Hz]');
ylabel('intensity [dB]');
legend('D','R','Rn');

subplot(2,1,2)
Dqqq1=V_M_f(first_freq_num:last_freq_num);
Rqqq1=V_M_fr(first_freq_num:last_freq_num);
%delta_dmr=V_M_f-V_M_fr;
plot(f_temp(first_freq_num:last_freq_num),Dqqq1,'b');
ylim([-200 50]);
hold on;
plot(f_temp(first_freq_num:last_freq_num),Rqqq1,'r');
hold off;
xlabel('frequency [Hz]');
ylabel('intensity [dB]');
legend('D','R');
Dqqq=Dqqq1;
Rqqq=Rqqq1;
pause(2);

%normalizing the R signal for classification
% normalized_V_M_fr = zeros(max(size(V_M_fr)));
% num_of_main_freq = 1;  % the frequency number to normlize relative to it
% firstValueOfR = V_M_fr(num_of_main_freq);
% Determined_V_main_freq = 0 ;  %dB
% delta_V = Determined_V_main_freq - firstValueOfR ;
% for i = 1:1:max(size(V_M_fr))
% normalized_V_M_fr(i) = V_M_fr(i)+delta_V;
% end;

%normalizing the R signal for classification - second iteration
first_time = 1 ;
for i = 1:1:max(size(V_M_fr))
    if V_M_fr(i) == -inf
    V_M_fr(i) = 0;
    end;
end;
mVFMR = min(V_M_fr);    
for i = 1:1:max(size(V_M_fr))
    if V_M_fr(i) ~= 0
    V_M_fr(i) = V_M_fr(i) + abs(mVFMR) ;
    else
        V_M_fr(i) = V_M_fr(1);
        if first_time == 1
        i = i
        first_time = 0 ;
        end;
    end;
%     if V_M_fr(i) < 0
%     V_M_fr(i) = 0;
%     end;
end;

figure(12); % this plot is relative to the min recieved signal
hold on;    % for multiple plots on the same graph - to return to normal delete this line
title(['Rn ' 'A' num2str(An),' L' num2str(Ln),' M' num2str(Mn),' K' num2str(Kn),' E' num2str(En),' R' num2str(Rn),' B' num2str(Bn),' S' num2str(Sn)]); % if this line is a problem just delete it
if Rn == 1
plot(f_temp,V_M_fr,'m');   %normalized k m
elseif Rn == 2
    plot(f_temp,V_M_fr,'--m');   %normalized
else
    plot(f_temp,V_M_fr,'--m');   %normalized
end;
hold off;
xlabel('frequency [Hz]');
ylabel('intensity [dB]');
legend('R1(E1)', 'R3(E1)', 'R1(E2)', 'R3(E2)');
xlim([10000 100000])
ylim([10 60])
%sum_of_int = mean(V_M_fr);     % i still need to stretch the R signal for comparison #############################################################################


%for i = 1:1:max(size(V_M_fr))
%        V_M_fr(i) = V_M_fr(i) + ;
%end;
NUM_OF_MAIN_FREQ = 12 ;  % the frequency number to normlize relative to it. beginning of chirp range
%NUM_OF_MAIN_FREQ = ceil((12 + 104) / 2) ;  % the frequency number to normlize relative to it. middle of chirp range
%NUM_OF_MAIN_FREQ = 104 ;  % the frequency number to normlize relative to it. end of chirp range
firstValueOfR = V_M_fr(NUM_OF_MAIN_FREQ);
normalized_V_M_fr = zeros(max(size(V_M_fr)));
Determined_V_main_freq = 0 ;  %dB
delta_V = Determined_V_main_freq - firstValueOfR ;
for i = 1:1:max(size(V_M_fr))
normalized_V_M_fr(i) = V_M_fr(i) + delta_V;
end;
f_temp(1) 
f_temp(2)
%end of normalization of R for Classification
figure(11); %normalized R plot - a plot relative to the first frequency value
hold on;    % for multiple plots on the same graph - to return to normal delete this line
title(['Rn normalized ' 'A' num2str(An),' L' num2str(Ln),' M' num2str(Mn),' K' num2str(Kn),' E' num2str(En),' R' num2str(Rn),' B' num2str(Bn),' S' num2str(Sn)]); % if this line is a problem just delete it
if Rn == 1
plot(f_temp(12:104),normalized_V_M_fr(12:104),'k');   %normalized b k
elseif Rn == 2
    plot(f_temp(12:104),normalized_V_M_fr(12:104),'--k');   %normalized
else
    plot(f_temp(12:104),normalized_V_M_fr(12:104),'--k');   %normalized
end;
hold on; 
%plot([f_temp(12) f_temp(12)],[-40 50 ],'r');
%plot([f_temp(104) f_temp(104)],[-40 50 ],'r');
if NUM_OF_MAIN_FREQ == ceil((12 + 104) / 2)
    plot([f_temp(ceil((12 + 104)))  f_temp(ceil((12 + 104)))],[-40 50 ],'--r');
end;
hold off;
xlabel('frequency [Hz]');
ylabel('Relative Intensity [dB]');
legend('R1(E1)', 'R3(E1)', 'R1(E2)', 'R3(E2)');
ylim([-20 30]);
xlim([10000 100000]);

end