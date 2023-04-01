function [chirps,chirps_loc,is_successfull,delta_for_next] = chirps_and_locationQ1_drift(file_location,angle_n_of_object,planned_distance,planned_angle,planned_side,delta_for_now)
%n=angle_n_of_object;                         % visual purposes only
%true_angle=(-60+n*5.2174 );                  % info
r_sig1{5}=zeros(1,(ceil(0.002*500000))+1);    % define variable
r_sig1{4}=zeros(1,(ceil(0.002*500000))+1);    % define variable
r_sig1{3}=zeros(1,(ceil(0.002*500000))+1);    % define variable
r_sig1{2}=zeros(1,(ceil(0.002*500000))+1);    % define variable
r_sig1{1}=zeros(1,(ceil(0.002*500000))+1);    % define variable
d_sig1{5}=zeros(1,(ceil(0.002*500000))+1);    % define variable
d_sig1{4}=zeros(1,(ceil(0.002*500000))+1);    % define variable
d_sig1{3}=zeros(1,(ceil(0.002*500000))+1);    % define variable
d_sig1{2}=zeros(1,(ceil(0.002*500000))+1);    % define variable
d_sig1{1}=zeros(1,(ceil(0.002*500000))+1);    % define variable

recorded_data_k{5}=zeros(1,(ceil(0.002*500000))+1);% define variable
recorded_data_k{4}=zeros(1,(ceil(0.002*500000))+1);% define variable
recorded_data_k{3}=zeros(1,(ceil(0.002*500000))+1);% define variable
recorded_data_k{2}=zeros(1,(ceil(0.002*500000))+1);% define variable
recorded_data_k{1}=zeros(1,(ceil(0.002*500000))+1);% define variable


if (angle_n_of_object>0)&&(angle_n_of_object<10)
file_number_of_object=['0' num2str(angle_n_of_object)];
elseif (angle_n_of_object>9)&&(angle_n_of_object<26)
    file_number_of_object=num2str(angle_n_of_object);
end;

file_begining='\T00000';
file_end='.WAV';

FLV1=[file_location file_begining file_number_of_object file_end]; %file location vector
[recorded_data,input_rate] = audioread(FLV1);
chirp_time=0.002;  % 2 miliseconds
c_l=ceil(2*input_rate*chirp_time);
%%%% 11111 new addition to cut the signal                                              ((((((((((((  2+3   ))))))))))))))
% figure(11);            % bugs detection - showing the signal
% plot(recorded_data);   % bug detection - showing the signal
% pause(60);             % bug detection - showing the signal
[psor_fixed,lsor_fixed]=findpeaks(recorded_data,'minpeakdistance',50000,'minpeakheight',0.2); %it is 50K and not 60K because of bad data at some point (second chirp came too early)
if max(size(psor_fixed))==6
    s_back=7000;       % how nuch to see backward        %%% ###### very IMPORTANT ###### %%%%
    s_foreword=50000;  % how much to see forward         %%% ############################ %%%%
    for i=1:1:5        % cutting the signal to 5 pieces
    recorded_data_k{i}=recorded_data((lsor_fixed(i)-s_back):(lsor_fixed(i)+s_foreword));    % THE NEW SIGNALS :)
    end; %for
recorded_data=recorded_data((lsor_fixed(1)-s_back):(lsor_fixed(5)+s_foreword));  %everything is relative to the first peak
figure(6);   % 6 because i need 1:5 for the cut signals
plot(recorded_data);
title(['recorded data after cut ' FLV1]); xlabel('samples'); ylabel('strength [v]');
pause(0.01);

for i=1:1:5
figure(i);
rdki=recorded_data_k{i};
plot(rdki);
title(['recorded data after cut k=' num2str(i)]); xlabel('samples'); ylabel('strength [v]');
hold on;
plot([0,c_l],[0.5 0.5], '-mo');
hold off;
pause(0.01);
end; %for
else %if
w1=errordlg(['(p) chirps_and_locationQ1 dont have 6 peaks at: '  FLV1],'Fuckkkk1' );
pause(0.01);
close(w1);
end; %if
pause(0.01); %20
%%%% END OF 11111

[cut_signal1,rt1,i_s1,dls1]=find_t_RQ1_drift(recorded_data_k{1},input_rate, FLV1,planned_distance,planned_angle,planned_side,delta_for_now);  % if there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
[cut_signal2,rt2,i_s2,dls2]=find_t_RQ1_drift(recorded_data_k{2},input_rate, FLV1,planned_distance,planned_angle,planned_side,delta_for_now);  % if there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
[cut_signal3,rt3,i_s3,dls3]=find_t_RQ1_drift(recorded_data_k{3},input_rate, FLV1,planned_distance,planned_angle,planned_side,delta_for_now);  % if there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
[cut_signal4,rt4,i_s4,dls4]=find_t_RQ1_drift(recorded_data_k{4},input_rate, FLV1,planned_distance,planned_angle,planned_side,delta_for_now);  % if there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
[cut_signal5,rt5,i_s5,dls5]=find_t_RQ1_drift(recorded_data_k{5},input_rate, FLV1,planned_distance,planned_angle,planned_side,delta_for_now);  % if there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
delta_for_next=ceil((dls1+dls2+dls3+dls4+dls5)/5);
how_many_successful=i_s1+i_s2+i_s3+i_s4+i_s5;
%%%%%%%%%%%%%%% untill here i got %%%%%%%%%%%%%%%%%%%%%###############
%%%%%%%%%%%%%%% ######################################################
%%%%%%%%%%%%%%%#######################################################
%%%%%%%%%%%%%%% do 'ctrl + t' to the rest of the lines

if how_many_successful==5
   d_sig1{1}=cut_signal1{1};
   d_sig1{2}=cut_signal2{1};
   d_sig1{3}=cut_signal3{1};
   d_sig1{4}=cut_signal4{1};
   d_sig1{5}=cut_signal5{1};
   r_sig1{1}=cut_signal1{2};
   r_sig1{2}=cut_signal2{2};
   r_sig1{3}=cut_signal3{2};
   r_sig1{4}=cut_signal4{2};
   r_sig1{5}=cut_signal5{2};
else
    w2=errordlg(['chirps_and_locationQ1 dont have 5 successes at: '  FLV1],'Fuckkkk2' );    
    pause(0.01);
    close(w2);
    ['w2']
for i=1:1:5
   d_sig1{i}=zeros(1,(ceil(0.002*500000))+1);
   r_sig1{i}=zeros(1,(ceil(0.002*500000))+1);
end; % end for
end; %end if

chirps_loc=[c_l c_l c_l c_l c_l c_l c_l c_l c_l c_l]; % if there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
size(d_sig1{1}') %4001
size(r_sig1{1}') %4001
size(d_sig1{2}') 
size(r_sig1{2}') 
size(d_sig1{3}')
size(r_sig1{3}')
size(d_sig1{4}') %4280
size(r_sig1{4}') 
size(d_sig1{5}')
size(r_sig1{5}')
chirps=[d_sig1{1}' ;r_sig1{1}' ;d_sig1{2}' ;r_sig1{2}' ;d_sig1{3}'; r_sig1{3}'; d_sig1{4}' ;r_sig1{4}' ;d_sig1{5}' ;r_sig1{5}']; % if 
% there are 10 values=1,3,5,7,9 are D, and 2,4,6,8,10 are R
is_successfull=how_many_successful;
figure(91);
plot(1:5, [dls1 dls2 dls3 dls4 dls5],'-bo');
dls=[dls1 dls2 dls3 dls4 dls5];
ylabel(max(dls)-min(dls));
text(2,mean(dls)+0.5,['mean:' num2str(mean(dls)) ' std:' num2str(std(dls))]);
text(3,mean(dls)+0.5,[' std/mean:' num2str(std(dls)/mean(dls)*100) '%']);
text(4,mean(dls)+0.5,['R:' num2str(planned_distance*2) '  S:' num2str(planned_side)]);
pause(0.01);
end % end function
