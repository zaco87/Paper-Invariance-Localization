function go_to_and_show_ALMKERBS(An,Ln,Mn,Kn,En,Rn,Bn,Sn,DQ,RQ)
                       
file_loc=file_location(Ln,Mn,En,Rn,Bn,Sn);
%r_sig1{5}=zeros(1,(ceil(0.002*500000))+1);
%d_sig1{5}=zeros(1,(ceil(0.002*500000))+1);
if (An>0)&&(An<10)
file_number_of_object=['0' num2str(An)];
elseif (An>9)&&(An<26)
    file_number_of_object=num2str(An);
end;

file_begining='\T00000';
file_end='.WAV';

FLV1=[file_loc file_begining file_number_of_object file_end]; %file location vector
[recorded_data,input_rate] = audioread(FLV1);

 s_window=10; %200  % window to be used in the spectrogram
 s_overlap=s_window-1;   %  overlap to be used in the spectrogram
 s_nfft=32; %512   % nfft to be used in the spectrogram
 cf1=10000;    % cutoff frequency 1 in the chirp (10KHz)
 cf2=100000;   % cutoff frequency 2 in the chirp (100KHz)
 chirp_time=2*10^-3;   % [2ms]
%%%% figure(17);
%%%% spectrogram(recorded_data,s_window,s_overlap,s_nfft,input_rate,'yaxis');
  figure(18);
plot(recorded_data);   
pause(0.01);
% % % % % % %   figure(19);
% % % % % % % plot(R_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn});   
% % % % % % % pause(1);

%%%%%%

%%%%%new addition to cut the signal
data1=recorded_data;
[psor_fixed,lsor_fixed]=findpeaks(data1,'minpeakdistance',60000,'minpeakheight',0.4);
if max(size(psor_fixed))==6
data1=data1((lsor_fixed-3000):(lsor_fixed+340000));
figure(99);
hold off;
plot(data1);
 title(['ALMKERBS '  num2str(An)  ' ' num2str(Ln) ' ' num2str(Mn) ' ' num2str(Kn) ' ' num2str(En) ' ' num2str(Rn) ' ' num2str(Bn) ' ' num2str(Sn)]);
 hold on;
pause(0.01);
end;
%%%%%%   end new addition

%%%%% new part - spectrograms

figure(98);
subplot(1,2,1);
plot(DQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn});
title('D');
subplot(1,2,2);
plot(RQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn});
title('R');


input_rate=500000; % input rate of the signal
s_window=200;   % window to be used in the spectrogram
s_overlap=s_window-1;   %  overlap to be used in the spectrogram
s_nfft=512;   % nfft to be used in the spectrogram
cf1=10000;    % cutoff frequency 1 in the chirp (10KHz)
cf2=100000;   % cutoff frequency 2 in the chirp (100KHz)
chirp_time=2*10^-3;   % [2ms]

figure(97);
subplot(1,2,1)
[s_temp,f_temp,t_temp,p_temp_D]=spectrogram(DQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn},s_window,s_overlap,s_nfft,input_rate,'yaxis');                      
image(t_temp,f_temp,(10*log10(abs(p_temp_D))),'CDataMapping','scaled'); axis xy;
subplot(1,2,2)
[s_temp,f_temp,t_temp,p_temp_R]=spectrogram(RQ{An,Ln,Mn,Kn,En,Rn,Bn,Sn},s_window,s_overlap,s_nfft,input_rate,'yaxis');                      
image(t_temp,f_temp,(10*log10(abs(p_temp_R))),'CDataMapping','scaled'); axis xy;

end