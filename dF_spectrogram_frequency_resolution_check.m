% checking the delta Fs : frequency resolution in the spectrogram
% the check is because when using the spectrogram with window smaller than
% nfft there is a process called zero-padding that adds zeros to make the
% window larger, and of length of the nfft. so the theoretical simple
% resolution calculation differs. so i want to check the result by
% generating a signal with two adjacent frequencies to check the "real"
% resolution of the frequencies in the spectrogram

figure(99);
input_rate=500000; % input rate of the signal % sampling frequency
s_window=200;   % window to be used in the spectrogram
s_overlap=s_window-1;   %  overlap to be used in the spectrogram
s_nfft=512;   % nfft to be used in the spectrogram

delta_Fs = 1000; % Hz
signal_frequency_f1 = 10000; % Hz
signal_frequency_f2 = signal_frequency_f1 + delta_Fs; % Hz
t=0:1/input_rate:1;
generated_1 = sin(2*pi()*t*signal_frequency_f1);
generated_2 = sin(2*pi()*t*signal_frequency_f2);
sum_generated = generated_2 + generated_1 ;

[s_temp,f_temp,t_temp,p_temp_generated_sum]=spectrogram(sum_generated,s_window,s_overlap,s_nfft,input_rate,'yaxis');   
theoretical_dF = input_rate / s_window
theoretical_artificial_zpadding_dF = input_rate / s_nfft
dF_in_from_spectrogram = f_temp(2)- f_temp(1)
image(t_temp,f_temp,(10*log10(abs(p_temp_generated_sum))),'CDataMapping','scaled'); axis xy;
xlabel('Time[s]');
ylabel('(strength[dB])');
set(gca,'FontSize',15);


figure(98);
plot(t, generated_1,'b');
hold on;
plot(t, generated_2,'r');
hold on;
plot(t, sum_generated,'k');
hold off;