function [cut_signal,real_t,is_successfull,dlsor] = find_t_RQ1(data1,samples_per_second, FLV1,planned_distance,planned_angle,planned_side)
%% def
theta=pi/180*planned_angle;
cf1=100000;
cf2=10000;
%500000 samples per second
chirp_time=0.002;  % 2 miliseconds
s_speed=347;       %[m/s] speed of sound as measured by Arian in the lab
tx=0:1/samples_per_second:chirp_time;                    % [seconds]
yx=chirp(tx,cf1,chirp_time,cf2); %chirp voltage vector .....     26k 2 26k  (t,26000,0.01,26000)];
yx=yx'; %the ni-6218 voltage vector queue has to be a column vector
%% first xcorr
[acor1,lag1]=xcorr(data1,yx); % xcorr the rec signal with the theoretical chirp
acor1=acor1(lag1>0);          % taking only the possitive region
lag1=lag1(lag1>0);            % taking only the possitive region
acor1=abs(acor1);             % i want to adress the positive values
m1=max(acor1);                % factoring the xcorr answer to 1 max
acor1=acor1/m1;               % factoring the xcorr answer to 1 max
  if planned_distance==0.5
   mpd_factor=0.65;              %minimum_peak_distance factor
   elseif planned_distance==1
   mpd_factor=0.7;              %minimum_peak_distance factor
   elseif planned_distance==1.5
   mpd_factor=0.7;              %minimum_peak_distance factor
   elseif planned_distance==2
   mpd_factor=0.7;              %minimum_peak_distance factor
   elseif 1==1
   w3=errordlg(['find_t_RQ1 - no discrete values of Rn at: '  FLV1],'Fuckkkk3' );
   pause(0.01);
   close(w3);
  end;  % end if with multiple elseif
  
mpd=mpd_factor*(planned_distance)*2/s_speed*samples_per_second; % min peak distance ~350   (twice 0.5 meters )
%%%%% new find peaks (only 2 needed now)
min_2nd=0.05;   % initial condition for minimal value of the second peak
max_qu=80;      % number of maximal loops
qu=1;           % initial condition

%% looking for R and D
while qu<=max_qu
[psor,lsor]=findpeaks(acor1(1:round(7000+(planned_distance)*2/s_speed*samples_per_second*1.5)),'minpeakdistance',mpd,'minpeakheight',min_2nd,'minpeakwidth',3); %,'MinPeakProminence',0.4); %'SortStr','none');
 % IMPORTANT: i dont want to see too much signal in the search % 7000 is s_back in previous function
if max(size(psor))==2
    qu=max_qu+1;
elseif max(size(psor))>2
    min_2nd=min_2nd*1.1;
    qu=qu+1;
elseif max(size(psor))<2
    min_2nd=min_2nd*0.9;
elseif 1==1
    qu=qu+1;
end;  % end if with multiple elseif
end;  % end while

%% def R and D length

x1=2*ceil(samples_per_second*chirp_time);   % i want to see once before the beginning of the chirp
x2=2*ceil(samples_per_second*chirp_time); % i want to see twice after the beginning of the chirp
show_lsor1=lsor(1)
x1
msd1=max(size(data1))
if (lsor(1)-x1)<1
    data1(1:3)
data1_new_D=vertcat(zeros(lsor(1),1) ,data1((1):(lsor(1)+x2)));        % the first signal around the peak
else
data1_new_D=data1((lsor(1)-x1):(lsor(1)+x2));        % the first signal around the peak
end; %if
if (lsor(2)-x1)<1
data1_new_R=vertcat(zeros(lsor(2),1) ,data1((1):(lsor(2)+x2)));        % the second signal around the peak
else 
data1_new_R=data1((lsor(2)-x1):(lsor(2)+x2));        % the second signal around the peak
end %if
cut_signal{1}=data1_new_D;
cut_signal{2}=data1_new_R;

%% plotting
erereeeee = 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'
figure(78); % NOTICE THAT: figure 78 is a redundant instance of figure 77 for presentation purposes
if lsor(1)-x1>0                     %in case the signal doesn't start too early
x_plot = lag1(lsor(1)-x1:lsor(2)+x2)/samples_per_second;
y_plot = acor1(lsor(1)-x1:lsor(2)+x2);
plot(x_plot,y_plot);                           % plot of xcorr result
hold on;                      
%plot(lsor,psor, 'og','markersize',12);      % plot 2 circles on the results
%text(lsor+.02,psor,num2str((1:numel(psor))')); % add number of maxima to circle 
xlabel('cross-corr lag [ms]');
hold off;
%pause(1);
else
x_plot = lag1(1:lsor(2)+x2)/samples_per_second;
y_plot = acor1(1:lsor(2)+x2);
plot(x_plot,y_plot);                           % plot of xcorr result
%hold on;                      
%plot(lsor,psor, 'og','markersize',12);      % plot 2 circles on the results
text(lsor+.02,psor,num2str((1:numel(psor))')); % add number of maxima to circle 
xlabel('cross-corr lag [ms]');
hold off;
end;

%% PLOTTING
erereeeee = 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee2222222222222222222'
figure(77);                                 % plotting the xcorr result with circles on 2 maximas
%pause(1); 
if lsor(1)-x1>0                     %in case the signal doesn't start too early
plot(lag1(lsor(1)-x1:lsor(2)+x2),acor1(lsor(1)-x1:lsor(2)+x2));                           % plot of xcorr result
hold on;                      
plot(lsor,psor, 'og','markersize',12);      % plot 2 circles on the results
text(lsor+.02,psor,num2str((1:numel(psor))')); % add number of maxima to circle 
plot([lsor(1)-x1,lsor(2)+x2], [0.4 0.4], '-.r');    % add line at 0.4 which is the original place to look for 6 maximas
plot([lsor(1)-x1,lsor(2)+x2], [min_2nd, min_2nd], '-.r');   % add line at min_2nd
plot([lsor(2)-mpd,lsor(2)], [psor(2), psor(2)], '-m+');       % add line to demonstrate mpd
plot([lsor(1),(lsor(1)+mpd)], [psor(1), psor(1)], '-c+');       % add line to demonstrate mpd
plot([lsor(1),lsor(1)], [psor(1), 1], '-c');       % add line to demonstrate lsor1
plot([lsor(2),lsor(2)], [psor(2), 1], '-m');       % add line to demonstrate lsor2
tit=[FLV1((end-34):(end-28)) '   ' FLV1((end-26):(end-13))  '   ' FLV1((end-11):(end)) ] ;   % title of the file
title(tit);
xlabel(lsor(2)-lsor(1));
d_m=(((lsor(2)-lsor(1))/samples_per_second)*s_speed);                      % distance between R & D in [m]
d_m_str=num2str(((lsor(2)-lsor(1))/samples_per_second)*s_speed);           % distance between R & D in [m]
half_d_m=d_m/2;                                                            % half distance between R & D in [m]
half_d_m_str=num2str(((lsor(2)-lsor(1))/samples_per_second)*s_speed/2);    % half distance between R & D in [m]
text(1+.3,1+.2,['d= ' d_m_str ' [m]   '  'd / 2 = ' half_d_m_str ' [m] ']);    % show the result of the distance (between R and D)
hold off;
%pause(1);

else
 plot(lag1(1:lsor(2)+x2),acor1(1:lsor(2)+x2));                           % plot of xcorr result
hold on;                      
plot(lsor,psor, 'og','markersize',12);      % plot 2 circles on the results
text(lsor+.02,psor,num2str((1:numel(psor))')); % add number of maxima to circle 
plot([1,lsor(2)+x2], [0.4 0.4], '-.r');    % add line at 0.4 which is the original place to look for 6 maximas
plot([1,lsor(2)+x2], [min_2nd, min_2nd], '-.r');   % add line at min_2nd
plot([lsor(2)-mpd,lsor(2)], [psor(2), psor(2)], '-m+');       % add line to demonstrate mpd
plot([lsor(1),(lsor(1)+mpd)], [psor(1), psor(1)], '-c+');       % add line to demonstrate mpd
plot([lsor(1),lsor(1)], [psor(1), 1], '-c');       % add line to demonstrate lsor1
plot([lsor(2),lsor(2)], [psor(2), 1], '-m');       % add line to demonstrate lsor2
tit=[FLV1((end-34):(end-28)) '   ' FLV1((end-26):(end-13))  '   ' FLV1((end-11):(end)) ] ;   % title of the file
title(tit);
d_m=(((lsor(2)-lsor(1))/samples_per_second)*s_speed);                      % distance between R & D in [m]
d_m_str=num2str(((lsor(2)-lsor(1))/samples_per_second)*s_speed);           % distance between R & D in [m]
half_d_m=d_m/2;                                                            % half distance between R & D in [m]
half_d_m_str=num2str(((lsor(2)-lsor(1))/samples_per_second)*s_speed/2);    % half distance between R & D in [m]
text(1+.3,1+.2,['d= ' d_m_str ' [m]   '  'd / 2 = ' half_d_m_str ' [m] ']);    % show the result of the distance (between R and D)
hold off;
%pause(1);
   
end;
%% return i_s
if (max(size(psor))==2)&&(half_d_m*mpd_factor<planned_distance)&&(half_d_m*(2-mpd_factor)>planned_distance)
    psor
    lsor
is_successfull=1;   
    rt_temp(1)=ceil(0.139/2*samples_per_second/s_speed);  %  139mm is the distance between 2 mics (theoretical tD)
    rt_temp(2)=lsor(2)-lsor(1)+rt_temp(1);                % time difference is all i have so i add the theoretical tD
    real_t=rt_temp;    %[samples]
elseif (max(size(psor))==2)
    is_successfull=0;
    rt_temp(1)=ceil(0.139/2*samples_per_second/s_speed);  %  139mm is the distance between 2 mics
    rt_temp(2)=lsor(2)-lsor(1)+rt_temp(1);  
    real_t=rt_temp;                                       %[samples]
    w4=errordlg(['find_t_RQ1- no 2 values of psor at: '  FLV1],'Fuckkkk4' );
    pause(0.01);
    close(w4);

elseif 1==1
    is_successfull=0;
    rt_temp(2)=1;
    rt_temp(1)=1;
    real_t=rt_temp;
end; % end if

text(1+.3,1+.2,['                                                                is successful? (is 1?) ' num2str(is_successfull)]);
pause(0.01);
hold off;
psor
size(psor)
max(size(psor))
dlsor=lsor(2)-lsor(1);

end     % end function
