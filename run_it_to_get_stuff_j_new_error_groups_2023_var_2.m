%%% run this program after "run_it_to_get_stuff_i_error_bar.m"
%%% this program is about grouping the error for 3 different groups as Yossi asked in the mail from 17.02.2023:
%%% 
%%% 
%%% instructions: first get the results for the desited ALMKERB using
%%% "run_it_to_get_stuff_h_ddays_angle_dimentions.m"
%%% then use this program to plot the desired box plots
%%% or load data to matlab (a file of ~500MB)
%%% C:\Users\Z-PC\Documents\Study\Second Degree\thesis\??? ???   
%%%   or
%%% H:\My Drive\thesis backup\general backup - do not use this folder\thesis\??? ???\????? WORKSPACE 22042021 ????

%Lnt = 1 ;   Mnt=2;     Ent=1;   Bnt = 1  ; Knt = 1; Rnt = 1;  % "nt" = templates
%Ln_oi=Lnt ; Mn_oi=Mnt; En_oi=1; Bn_oi=Bnt; Kn_oi=2; Rn_oi=1;  % "oi" = test

% Yossi asked for 3 plots lines 1 line of mean or median with SE (Standard Error = sigma/sqrt(n)) for each group

anglesVector =  -60 + 0:(120/23):60; % this is the angles vector
[anglesVector(9:16)]; % [-20 20]
[anglesVector(5:8) anglesVector(17:20)]; % [-40 -20][20 40]
[anglesVector(1:4) anglesVector(21:24)]; % [-60 -40][40 60]
centerAnglesIndex = 9:16;
cAI = centerAnglesIndex;
sideAnglesIndex = [[5:8] [17:20]];
sAI = sideAnglesIndex;
farAnglesIndex = [[1:4] [21:24]];
fAI = farAnglesIndex;
 
%% shape invariance ( I ) ------ Template: Cylinder (2) --- Test: Ball (1)
figure(51);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 2,1}]; % first boxplot - no pinnae
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 2,1}]; % second boxplot - straight pinnae
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 2,1}]; % third boxplot - rotated pinnae

mean_plot(8) = 0;
SE_plot(8) = 0;

   data_set_plot = x_boxPlot1(cAI);
   mean_plot(1) = mean(data_set_plot);
   SE_plot(1) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(sAI);
   mean_plot(2) = mean(data_set_plot);
   SE_plot(2) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(fAI);
   mean_plot(3) = mean(data_set_plot);
   SE_plot(3) = std(data_set_plot)/sqrt(length(data_set_plot));

   
   data_set_plot = x_boxPlot2(cAI);
   mean_plot(4) = mean(data_set_plot);
   SE_plot(4) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(sAI);
   mean_plot(5) = mean(data_set_plot);
   SE_plot(5) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(fAI);
   mean_plot(6) = mean(data_set_plot);
   SE_plot(6) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   
   data_set_plot = x_boxPlot3(cAI);
   mean_plot(7) = mean(data_set_plot);
   SE_plot(7) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(sAI);
   mean_plot(8) = mean(data_set_plot);
   SE_plot(8) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(fAI);
   mean_plot(9) = mean(data_set_plot);
   SE_plot(9) = std(data_set_plot)/sqrt(length(data_set_plot));
   
eb1 = errorbar([1:1:3]-0.05, mean_plot(1:1:3), SE_plot(1:1:3),'-ok', 'linewidth', 1.5);  hold on;
eb2 = errorbar([1:1:3], mean_plot(4:1:6), SE_plot(4:1:6),'-ok', 'linewidth', 1.5);  hold on;
eb3 = errorbar([1:1:3]+0.05, mean_plot(7:1:9), SE_plot(7:1:9),'-ok', 'linewidth', 1.5);  hold off;
%eb1.Capsize = 15; %  not supported in matlab 2016a...

%Cell{1} = {'No Pinnae','Straight Pinnae','Rotated Pinnae'};
%set(gca, 'XTick',2:3:8, 'XTickLabel',Cell{1});
%set(gca, 'XLim',[0 10]);
set(gca, 'fontSize',20);

%text([1:1:9] , mean_plot(1:1:9)+ SE_plot(1:1:9)+0.1, {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'],...
%    '[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'], '[-20 20]', ['[-40 -20]' char(10) '[20 40]'],...
%    ['[-60 -40]' char(10) '[40 60]']},'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

hold on;   % fixing the witdth of the lines because of old Matlab version
eb4 = plot([1:1:3]-0.05, mean_plot(1:1:3),'-ob', 'linewidth', 4);  hold on;
eb5 = plot([1:1:3], mean_plot(4:1:6),'-or', 'linewidth', 4);  hold on;
eb6 = plot([1:1:3]+0.05, mean_plot(7:1:9),'-om', 'linewidth', 4);  hold off;
lgd1234 = legend( [eb4,eb5,eb6], 'No P.', 'Straight P.', 'Rotated P.');
lgd1234.FontSize = 11;
lgd1234.Orientation = 'horizontal';

ylim([-1, max(mean_plot+SE_plot+4)]); % y values limits
% ylabel('| Azimuth Error | [deg]');
% xlabel('System Configuration');
%set(gcf, 'Position',  [100, 100, 900, 300])
ylabel('Azimuth Error [deg]');

Cell{1} = {'Center', 'Side', 'Far-Side'};
title('Shape Inv I');
set(gca, 'XTick',1:1:3, 'XTickLabel',Cell{1});
set(gca, 'XLim',[0.6 3.4]);

%text([1:1:3] , [max(mean_plot(1:3:9)+ SE_plot(1:3:9)+0.1),max(mean_plot(2:3:9)+ SE_plot(2:3:9)+0.1),max(mean_plot(3:3:9)+ SE_plot(3:3:9)+0.1)], {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]']},...
%    'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

% title({'Absolute Azimuth Error by System Configuration and azimuth section'; titleStr1});%  ; titleStr2 ; titleStr3 });


%% shape invariance ( II ) ------ Template: Plant (3) --- Test: Ball (1)
figure(52);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,1}]; % first boxplot - no pinnae
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,1}]; % second boxplot - straight pinnae
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,1}]; % third boxplot - rotated pinnae

mean_plot(8) = 0;
SE_plot(8) = 0;

   data_set_plot = x_boxPlot1(cAI);
   mean_plot(1) = mean(data_set_plot);
   SE_plot(1) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(sAI);
   mean_plot(2) = mean(data_set_plot);
   SE_plot(2) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(fAI);
   mean_plot(3) = mean(data_set_plot);
   SE_plot(3) = std(data_set_plot)/sqrt(length(data_set_plot));

   
   data_set_plot = x_boxPlot2(cAI);
   mean_plot(4) = mean(data_set_plot);
   SE_plot(4) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(sAI);
   mean_plot(5) = mean(data_set_plot);
   SE_plot(5) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(fAI);
   mean_plot(6) = mean(data_set_plot);
   SE_plot(6) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   
   data_set_plot = x_boxPlot3(cAI);
   mean_plot(7) = mean(data_set_plot);
   SE_plot(7) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(sAI);
   mean_plot(8) = mean(data_set_plot);
   SE_plot(8) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(fAI);
   mean_plot(9) = mean(data_set_plot);
   SE_plot(9) = std(data_set_plot)/sqrt(length(data_set_plot));
   
eb1 = errorbar([1:1:3]-0.05, mean_plot(1:1:3), SE_plot(1:1:3),'-ok', 'linewidth', 1.5);  hold on;
eb2 = errorbar([1:1:3], mean_plot(4:1:6), SE_plot(4:1:6),'-ok', 'linewidth', 1.5);  hold on;
eb3 = errorbar([1:1:3]+0.05, mean_plot(7:1:9), SE_plot(7:1:9),'-ok', 'linewidth', 1.5);  hold off;
%eb1.Capsize = 15; %  not supported in matlab 2016a...

%Cell{1} = {'No Pinnae','Straight Pinnae','Rotated Pinnae'};
%set(gca, 'XTick',2:3:8, 'XTickLabel',Cell{1});
%set(gca, 'XLim',[0 10]);
set(gca, 'fontSize',20);

%text([1:1:9] , mean_plot(1:1:9)+ SE_plot(1:1:9)+0.1, {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'],...
%    '[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'], '[-20 20]', ['[-40 -20]' char(10) '[20 40]'],...
%    ['[-60 -40]' char(10) '[40 60]']},'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

hold on;   % fixing the witdth of the lines because of old Matlab version
eb4 = plot([1:1:3]-0.05, mean_plot(1:1:3),'-ob', 'linewidth', 4);  hold on;
eb5 = plot([1:1:3], mean_plot(4:1:6),'-or', 'linewidth', 4);  hold on;
eb6 = plot([1:1:3]+0.05, mean_plot(7:1:9),'-om', 'linewidth', 4);  hold off;
lgd1234 = legend( [eb4,eb5,eb6], 'No P.', 'Straight P.', 'Rotated P.');
lgd1234.FontSize = 11;
lgd1234.Orientation = 'horizontal';

ylim([-1, max(mean_plot+SE_plot+9)]); % y values limits
% ylabel('| Azimuth Error | [deg]');
% xlabel('System Configuration');
%set(gcf, 'Position',  [100, 100, 900, 300])
ylabel('Azimuth Error [deg]');

Cell{1} = {'Center', 'Side', 'Far-Side'};
title('Shape Inv II');
set(gca, 'XTick',1:1:3, 'XTickLabel',Cell{1});
set(gca, 'XLim',[0.6 3.4]);

%text([1:1:3] , [max(mean_plot(1:3:9)+ SE_plot(1:3:9)+0.1),max(mean_plot(2:3:9)+ SE_plot(2:3:9)+0.1),max(mean_plot(3:3:9)+ SE_plot(3:3:9)+0.1)], {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]']},...
%    'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

% title({'Absolute Azimuth Error by System Configuration and azimuth section'; titleStr1});%  ; titleStr2 ; titleStr3 });

%% shape invariance ( III ) ------ Template: Plant (3) --- Test: Cylinder (2)
figure(53);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,2}]; % first boxplot - no pinnae
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,2}]; % second boxplot - straight pinnae
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,2}]; % third boxplot - rotated pinnae

mean_plot(8) = 0;
SE_plot(8) = 0;

   data_set_plot = x_boxPlot1(cAI);
   mean_plot(1) = mean(data_set_plot);
   SE_plot(1) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(sAI);
   mean_plot(2) = mean(data_set_plot);
   SE_plot(2) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(fAI);
   mean_plot(3) = mean(data_set_plot);
   SE_plot(3) = std(data_set_plot)/sqrt(length(data_set_plot));

   
   data_set_plot = x_boxPlot2(cAI);
   mean_plot(4) = mean(data_set_plot);
   SE_plot(4) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(sAI);
   mean_plot(5) = mean(data_set_plot);
   SE_plot(5) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(fAI);
   mean_plot(6) = mean(data_set_plot);
   SE_plot(6) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   
   data_set_plot = x_boxPlot3(cAI);
   mean_plot(7) = mean(data_set_plot);
   SE_plot(7) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(sAI);
   mean_plot(8) = mean(data_set_plot);
   SE_plot(8) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(fAI);
   mean_plot(9) = mean(data_set_plot);
   SE_plot(9) = std(data_set_plot)/sqrt(length(data_set_plot));
   
eb1 = errorbar([1:1:3]-0.05, mean_plot(1:1:3), SE_plot(1:1:3),'-ok', 'linewidth', 1.5);  hold on;
eb2 = errorbar([1:1:3], mean_plot(4:1:6), SE_plot(4:1:6),'-ok', 'linewidth', 1.5);  hold on;
eb3 = errorbar([1:1:3]+0.05, mean_plot(7:1:9), SE_plot(7:1:9),'-ok', 'linewidth', 1.5);  hold off;
%eb1.Capsize = 15; %  not supported in matlab 2016a...

%Cell{1} = {'No Pinnae','Straight Pinnae','Rotated Pinnae'};
%set(gca, 'XTick',2:3:8, 'XTickLabel',Cell{1});
%set(gca, 'XLim',[0 10]);
set(gca, 'fontSize',20);

%text([1:1:9] , mean_plot(1:1:9)+ SE_plot(1:1:9)+0.1, {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'],...
%    '[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'], '[-20 20]', ['[-40 -20]' char(10) '[20 40]'],...
%    ['[-60 -40]' char(10) '[40 60]']},'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

hold on;   % fixing the witdth of the lines because of old Matlab version
eb4 = plot([1:1:3]-0.05, mean_plot(1:1:3),'-ob', 'linewidth', 4);  hold on;
eb5 = plot([1:1:3], mean_plot(4:1:6),'-or', 'linewidth', 4);  hold on;
eb6 = plot([1:1:3]+0.05, mean_plot(7:1:9),'-om', 'linewidth', 4);  hold off;
lgd1234 = legend( [eb4,eb5,eb6], 'No P.', 'Straight P.', 'Rotated P.');
lgd1234.FontSize = 11;
lgd1234.Orientation = 'horizontal';

ylim([-1, max(mean_plot+SE_plot+9)]); % y values limits
% ylabel('| Azimuth Error | [deg]');
% xlabel('System Configuration');
%set(gcf, 'Position',  [100, 100, 900, 300])
ylabel('Azimuth Error [deg]');

Cell{1} = {'Center', 'Side', 'Far-Side'};
title('Shape Inv III');
set(gca, 'XTick',1:1:3, 'XTickLabel',Cell{1});
set(gca, 'XLim',[0.6 3.4]);

%text([1:1:3] , [max(mean_plot(1:3:9)+ SE_plot(1:3:9)+0.1),max(mean_plot(2:3:9)+ SE_plot(2:3:9)+0.1),max(mean_plot(3:3:9)+ SE_plot(3:3:9)+0.1)], {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]']},...
%    'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

% title({'Absolute Azimuth Error by System Configuration and azimuth section'; titleStr1});%  ; titleStr2 ; titleStr3 });



%% Disatance invariance ( I ) ------ Template: 0.5 m (1) --- Test: 1.0 m (2)
figure(54);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 1,1}]; % first boxplot - no pinnae
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 1,1}]; % second boxplot - straight pinnae
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 1,1}]; % third boxplot - rotated pinnae

mean_plot(8) = 0;
SE_plot(8) = 0;

   data_set_plot = x_boxPlot1(cAI);
   mean_plot(1) = mean(data_set_plot);
   SE_plot(1) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(sAI);
   mean_plot(2) = mean(data_set_plot);
   SE_plot(2) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(fAI);
   mean_plot(3) = mean(data_set_plot);
   SE_plot(3) = std(data_set_plot)/sqrt(length(data_set_plot));

   
   data_set_plot = x_boxPlot2(cAI);
   mean_plot(4) = mean(data_set_plot);
   SE_plot(4) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(sAI);
   mean_plot(5) = mean(data_set_plot);
   SE_plot(5) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(fAI);
   mean_plot(6) = mean(data_set_plot);
   SE_plot(6) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   
   data_set_plot = x_boxPlot3(cAI);
   mean_plot(7) = mean(data_set_plot);
   SE_plot(7) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(sAI);
   mean_plot(8) = mean(data_set_plot);
   SE_plot(8) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(fAI);
   mean_plot(9) = mean(data_set_plot);
   SE_plot(9) = std(data_set_plot)/sqrt(length(data_set_plot));
   
eb1 = errorbar([1:1:3]-0.05, mean_plot(1:1:3), SE_plot(1:1:3),'-ok', 'linewidth', 1.5);  hold on;
eb2 = errorbar([1:1:3], mean_plot(4:1:6), SE_plot(4:1:6),'-ok', 'linewidth', 1.5);  hold on;
eb3 = errorbar([1:1:3]+0.05, mean_plot(7:1:9), SE_plot(7:1:9),'-ok', 'linewidth', 1.5);  hold off;
%eb1.Capsize = 15; %  not supported in matlab 2016a...

%Cell{1} = {'No Pinnae','Straight Pinnae','Rotated Pinnae'};
%set(gca, 'XTick',2:3:8, 'XTickLabel',Cell{1});
%set(gca, 'XLim',[0 10]);
set(gca, 'fontSize',20);

%text([1:1:9] , mean_plot(1:1:9)+ SE_plot(1:1:9)+0.1, {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'],...
%    '[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'], '[-20 20]', ['[-40 -20]' char(10) '[20 40]'],...
%    ['[-60 -40]' char(10) '[40 60]']},'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

hold on;   % fixing the witdth of the lines because of old Matlab version
eb4 = plot([1:1:3]-0.05, mean_plot(1:1:3),'-ob', 'linewidth', 4);  hold on;
eb5 = plot([1:1:3], mean_plot(4:1:6),'-or', 'linewidth', 4);  hold on;
eb6 = plot([1:1:3]+0.05, mean_plot(7:1:9),'-om', 'linewidth', 4);  hold off;
lgd1234 = legend( [eb4,eb5,eb6], 'No P.', 'Straight P.', 'Rotated P.');
lgd1234.FontSize = 11;
lgd1234.Orientation = 'horizontal';

ylim([-1, max(mean_plot+SE_plot+9)]); % y values limits
% ylabel('| Azimuth Error | [deg]');
% xlabel('System Configuration');
%set(gcf, 'Position',  [100, 100, 900, 300])
ylabel('Azimuth Error [deg]');

Cell{1} = {'Center', 'Side', 'Far-Side'};
title('Distance Inv I');
set(gca, 'XTick',1:1:3, 'XTickLabel',Cell{1});
set(gca, 'XLim',[0.6 3.4]);

%text([1:1:3] , [max(mean_plot(1:3:9)+ SE_plot(1:3:9)+0.1),max(mean_plot(2:3:9)+ SE_plot(2:3:9)+0.1),max(mean_plot(3:3:9)+ SE_plot(3:3:9)+0.1)], {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]']},...
%    'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

% title({'Absolute Azimuth Error by System Configuration and azimuth section'; titleStr1});%  ; titleStr2 ; titleStr3 });

%% Disatance invariance ( II ) ------ Template: 0.5 m (1) --- Test: 1.0 m (2)
figure(55);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 2,2}]; % first boxplot - no pinnae
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 2,2}]; % second boxplot - straight pinnae
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 2,2}]; % third boxplot - rotated pinnae

mean_plot(8) = 0;
SE_plot(8) = 0;

   data_set_plot = x_boxPlot1(cAI);
   mean_plot(1) = mean(data_set_plot);
   SE_plot(1) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(sAI);
   mean_plot(2) = mean(data_set_plot);
   SE_plot(2) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(fAI);
   mean_plot(3) = mean(data_set_plot);
   SE_plot(3) = std(data_set_plot)/sqrt(length(data_set_plot));

   
   data_set_plot = x_boxPlot2(cAI);
   mean_plot(4) = mean(data_set_plot);
   SE_plot(4) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(sAI);
   mean_plot(5) = mean(data_set_plot);
   SE_plot(5) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(fAI);
   mean_plot(6) = mean(data_set_plot);
   SE_plot(6) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   
   data_set_plot = x_boxPlot3(cAI);
   mean_plot(7) = mean(data_set_plot);
   SE_plot(7) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(sAI);
   mean_plot(8) = mean(data_set_plot);
   SE_plot(8) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(fAI);
   mean_plot(9) = mean(data_set_plot);
   SE_plot(9) = std(data_set_plot)/sqrt(length(data_set_plot));
   
eb1 = errorbar([1:1:3]-0.05, mean_plot(1:1:3), SE_plot(1:1:3),'-ok', 'linewidth', 1.5);  hold on;
eb2 = errorbar([1:1:3], mean_plot(4:1:6), SE_plot(4:1:6),'-ok', 'linewidth', 1.5);  hold on;
eb3 = errorbar([1:1:3]+0.05, mean_plot(7:1:9), SE_plot(7:1:9),'-ok', 'linewidth', 1.5);  hold off;
%eb1.Capsize = 15; %  not supported in matlab 2016a...

%Cell{1} = {'No Pinnae','Straight Pinnae','Rotated Pinnae'};
%set(gca, 'XTick',2:3:8, 'XTickLabel',Cell{1});
%set(gca, 'XLim',[0 10]);
set(gca, 'fontSize',20);

%text([1:1:9] , mean_plot(1:1:9)+ SE_plot(1:1:9)+0.1, {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'],...
%    '[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'], '[-20 20]', ['[-40 -20]' char(10) '[20 40]'],...
%    ['[-60 -40]' char(10) '[40 60]']},'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

hold on;   % fixing the witdth of the lines because of old Matlab version
eb4 = plot([1:1:3]-0.05, mean_plot(1:1:3),'-ob', 'linewidth', 4);  hold on;
eb5 = plot([1:1:3], mean_plot(4:1:6),'-or', 'linewidth', 4);  hold on;
eb6 = plot([1:1:3]+0.05, mean_plot(7:1:9),'-om', 'linewidth', 4);  hold off;
lgd1234 = legend( [eb4,eb5,eb6], 'No P.', 'Straight P.', 'Rotated P.');
lgd1234.FontSize = 11;
lgd1234.Orientation = 'horizontal';

ylim([-1, max(mean_plot+SE_plot+9)]); % y values limits
% ylabel('| Azimuth Error | [deg]');
% xlabel('System Configuration');
%set(gcf, 'Position',  [100, 100, 900, 300])
ylabel('Azimuth Error [deg]');
title('Distance Inv II');
Cell{1} = {'Center', 'Side', 'Far-Side'};
set(gca, 'XTick',1:1:3, 'XTickLabel',Cell{1});
set(gca, 'XLim',[0.6 3.4]);

%text([1:1:3] , [max(mean_plot(1:3:9)+ SE_plot(1:3:9)+0.1),max(mean_plot(2:3:9)+ SE_plot(2:3:9)+0.1),max(mean_plot(3:3:9)+ SE_plot(3:3:9)+0.1)], {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]']},...
%    'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

% title({'Absolute Azimuth Error by System Configuration and azimuth section'; titleStr1});%  ; titleStr2 ; titleStr3 });



%% Disatance invariance ( III ) ------ Template: 0.5 m (1) --- Test: 1.0 m (2)
figure(56);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 3,3}]; % first boxplot - no pinnae
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 3,3}]; % second boxplot - straight pinnae
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 3,3}]; % third boxplot - rotated pinnae

mean_plot(8) = 0;
SE_plot(8) = 0;

   data_set_plot = x_boxPlot1(cAI);
   mean_plot(1) = mean(data_set_plot);
   SE_plot(1) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(sAI);
   mean_plot(2) = mean(data_set_plot);
   SE_plot(2) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot1(fAI);
   mean_plot(3) = mean(data_set_plot);
   SE_plot(3) = std(data_set_plot)/sqrt(length(data_set_plot));

   
   data_set_plot = x_boxPlot2(cAI);
   mean_plot(4) = mean(data_set_plot);
   SE_plot(4) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(sAI);
   mean_plot(5) = mean(data_set_plot);
   SE_plot(5) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot2(fAI);
   mean_plot(6) = mean(data_set_plot);
   SE_plot(6) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   
   data_set_plot = x_boxPlot3(cAI);
   mean_plot(7) = mean(data_set_plot);
   SE_plot(7) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(sAI);
   mean_plot(8) = mean(data_set_plot);
   SE_plot(8) = std(data_set_plot)/sqrt(length(data_set_plot));
   
   data_set_plot = x_boxPlot3(fAI);
   mean_plot(9) = mean(data_set_plot);
   SE_plot(9) = std(data_set_plot)/sqrt(length(data_set_plot));
   
eb1 = errorbar([1:1:3]-0.05, mean_plot(1:1:3), SE_plot(1:1:3),'-ok', 'linewidth', 1.5);  hold on;
eb2 = errorbar([1:1:3], mean_plot(4:1:6), SE_plot(4:1:6),'-ok', 'linewidth', 1.5);  hold on;
eb3 = errorbar([1:1:3]+0.05, mean_plot(7:1:9), SE_plot(7:1:9),'-ok', 'linewidth', 1.5);  hold off;
%eb1.Capsize = 15; %  not supported in matlab 2016a...

%Cell{1} = {'No Pinnae','Straight Pinnae','Rotated Pinnae'};
%set(gca, 'XTick',2:3:8, 'XTickLabel',Cell{1});
%set(gca, 'XLim',[0 10]);
set(gca, 'fontSize',20);

%text([1:1:9] , mean_plot(1:1:9)+ SE_plot(1:1:9)+0.1, {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'],...
%    '[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]'], '[-20 20]', ['[-40 -20]' char(10) '[20 40]'],...
%    ['[-60 -40]' char(10) '[40 60]']},'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

hold on;   % fixing the witdth of the lines because of old Matlab version
eb4 = plot([1:1:3]-0.05, mean_plot(1:1:3),'-ob', 'linewidth', 4);  hold on;
eb5 = plot([1:1:3], mean_plot(4:1:6),'-or', 'linewidth', 4);  hold on;
eb6 = plot([1:1:3]+0.05, mean_plot(7:1:9),'-om', 'linewidth', 4);  hold off;
lgd1234 = legend( [eb4,eb5,eb6], 'No P.', 'Straight P.', 'Rotated P.');
lgd1234.FontSize = 11;
lgd1234.Orientation = 'horizontal';

ylim([-1, max(mean_plot+SE_plot+9)]); % y values limits
% ylabel('| Azimuth Error | [deg]');
% xlabel('System Configuration');
%set(gcf, 'Position',  [100, 100, 900, 300])
ylabel('Azimuth Error [deg]');


Cell{1} = {'Center', 'Side', 'Far-Side'};
set(gca, 'XTick',1:1:3, 'XTickLabel',Cell{1});
set(gca, 'XLim',[0.6 3.4]);
title('Distance Inv III');
%text([1:1:3] , [max(mean_plot(1:3:9)+ SE_plot(1:3:9)+0.1),max(mean_plot(2:3:9)+ SE_plot(2:3:9)+0.1),max(mean_plot(3:3:9)+ SE_plot(3:3:9)+0.1)], {'[-20 20]', ['[-40 -20]' char(10) '[20 40]' char(10)], ['[-60 -40]' char(10) '[40 60]']},...
%    'HorizontalAlignment','center','VerticalAlignment', 'bottom' ,'fontsize', 10);

% title({'Absolute Azimuth Error by System Configuration and azimuth section'; titleStr1});%  ; titleStr2 ; titleStr3 });








