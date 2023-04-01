%%% run this program after "run_it_to_get_stuff_h_ddays_angle_dimentions.m"
%%% this program is taking the quantity:
%%% max_in_row_spot(:,1)-1)*120/23
%%% and plots it as an error bar (boxplot)
%%% instructions: first get the results for the desited ALMKERB using
%%% "run_it_to_get_stuff_h_ddays_angle_dimentions.m"
%%% then use this program to plot the desired box plots

%Lnt = 1 ;   Mnt=2;     Ent=1;   Bnt = 1  ; Knt = 1; Rnt = 1;  % "nt" = templates
%Ln_oi=Lnt ; Mn_oi=Mnt; En_oi=1; Bn_oi=Bnt; Kn_oi=2; Rn_oi=1;  % "oi" = test

%% 1st plot: equal distance and target
figure(13);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,1}]; % third boxplot
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 2,2}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 2,2}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 2,2}]; % 6th boxplot
x_boxPlot7 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,3}]; % 7th boxplot
x_boxPlot8 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,3}]; % 8th boxplot
x_boxPlot9 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,3}]; % 9th boxplot
x_boxPlot = [x_boxPlot1 , x_boxPlot2, x_boxPlot3, x_boxPlot4, x_boxPlot5, x_boxPlot6, x_boxPlot7, x_boxPlot8, x_boxPlot9];
g1 = repmat({'Without Ears B1'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 B1'},24,1);
g3 = repmat({'With Ears L2 B1'},24,1);
g4 = repmat({'Without Ears B2'},24,1); % change only the text for different data type
g5 = repmat({'With Ears L1 B2'},24,1);
g6 = repmat({'With Ears L2 B2'},24,1);
g7 = repmat({'Without Ears B3'},24,1); % change only the text for different data type
g8 = repmat({'With Ears L1 B3'},24,1);
g9 = repmat({'With Ears L2 B3'},24,1);
g_labels = [g1; g2; g3; g4; g5; g6; g7 ; g8; g9];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Equal Distance and Target';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%% 2nd plot: equal distance different target
 figure(14);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,1}]; % third boxplot
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,2}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,2}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,2}]; % 6th boxplot
x_boxPlot7 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,3}]; % 7th boxplot
x_boxPlot8 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,3}]; % 8th boxplot
x_boxPlot9 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,3}]; % 9th boxplot
x_boxPlot = [x_boxPlot1 , x_boxPlot2, x_boxPlot3, x_boxPlot4, x_boxPlot5, x_boxPlot6, x_boxPlot7, x_boxPlot8, x_boxPlot9];
g1 = repmat({'Without Ears B1B1'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 B1B1'},24,1);
g3 = repmat({'With Ears L2 B1B1'},24,1);
g4 = repmat({'Without Ears B1B2'},24,1); % change only the text for different data type
g5 = repmat({'With Ears L1 B1B2'},24,1);
g6 = repmat({'With Ears L2 B1B2'},24,1);
g7 = repmat({'Without Ears B1B3'},24,1); % change only the text for different data type
g8 = repmat({'With Ears L1 B1B3'},24,1);
g9 = repmat({'With Ears L2 B1B3'},24,1);
g_labels = [g1; g2; g3; g4; g5; g6; g7 ; g8; g9];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Equal Distance different Target';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%% 3rd plot: equal distance different target - reverse
 figure(15);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,1}]; % third boxplot
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 2,1}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 2,1}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 2,1}]; % 6th boxplot
x_boxPlot7 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,1}]; % 7th boxplot
x_boxPlot8 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,1}]; % 8th boxplot
x_boxPlot9 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,1}]; % 9th boxplot
x_boxPlot = [x_boxPlot1 , x_boxPlot2, x_boxPlot3, x_boxPlot4, x_boxPlot5, x_boxPlot6, x_boxPlot7, x_boxPlot8, x_boxPlot9];
g1 = repmat({'Without Ears B1B1'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 B1B1'},24,1);
g3 = repmat({'With Ears L2 B1B1'},24,1);
g4 = repmat({'Without Ears B2B1'},24,1); % change only the text for different data type
g5 = repmat({'With Ears L1 B2B1'},24,1);
g6 = repmat({'With Ears L2 B2B1'},24,1);
g7 = repmat({'Without Ears B3B1'},24,1); % change only the text for different data type
g8 = repmat({'With Ears L1 B3B1'},24,1);
g9 = repmat({'With Ears L2 B3B1'},24,1);
g_labels = [g1; g2; g3; g4; g5; g6; g7 ; g8; g9];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Equal Distance different Target - reverse';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%% 4th plot: error independent of distance mid to short range, same object B1 R1R2R3
 figure(16);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,1}]; % third boxplot
x_boxPlot10 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,2, 1,1}]; % notice order
x_boxPlot20 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,2, 1,1}]; % notice order
x_boxPlot30 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,2, 1,1}]; % notice order
x_boxPlot100=[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 3,3, 1,1}]; % notice order
x_boxPlot200=[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 3,3, 1,1}]; % notice order
x_boxPlot300=[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 3,3, 1,1}]; % notice order
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 1,1}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 1,1}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 1,1}]; % 6th boxplot
x_boxPlot7 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 1,1}]; % 7th boxplot
x_boxPlot8 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 1,1}]; % 8th boxplot
x_boxPlot9 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 1,1}]; % 9th boxplot
x_boxPlot44 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,3, 1,1}]; % 4th boxplot
x_boxPlot55 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,3, 1,1}]; % 5th boxplot
x_boxPlot66 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,3, 1,1}]; % 6th boxplot
x_boxPlot77 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 3,2, 1,1}]; % 7th boxplot
x_boxPlot88 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 3,2, 1,1}]; % 8th boxplot
x_boxPlot99 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 3,2, 1,1}]; % 9th boxplot
x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3,x_boxPlot10, x_boxPlot20, x_boxPlot30,x_boxPlot100, x_boxPlot200, x_boxPlot300,...
    x_boxPlot4, x_boxPlot5, x_boxPlot6, x_boxPlot7, x_boxPlot8, x_boxPlot9,...
    x_boxPlot44, x_boxPlot55, x_boxPlot66, x_boxPlot77, x_boxPlot88, x_boxPlot99];
g1 = repmat({'Without Ears R1R1'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 R1R1'},24,1);
g3 = repmat({'With Ears L2 R1R1'},24,1);
g10 =repmat({'Without Ears R2R2'},24,1);   % notice the order
g20 =repmat({'With Ears L1 R2R2'},24,1);   % notice the order
g30 =repmat({'With Ears L2 R2R2'},24,1);   % notice the order
g100=repmat({'Without Ears R3R3'},24,1);   % notice the order 0
g200=repmat({'With Ears L1 R3R3'},24,1);   % notice the order 0
g300=repmat({'With Ears L2 R3R3'},24,1);   % notice the order 0
g4 = repmat({'Without Ears R1R2'},24,1); % change only the text for different data type
g5 = repmat({'With Ears L1 R1R2'},24,1);
g6 = repmat({'With Ears L2 R1R2'},24,1);
g7 = repmat({'Without Ears R2R1'},24,1); % change only the text for different data type
g8 = repmat({'With Ears L1 R2R1'},24,1);
g9 = repmat({'With Ears L2 R2R1'},24,1);
g44 = repmat({'Without Ears R2R3'},24,1); % notice the order
g55 = repmat({'With Ears L1 R2R3'},24,1); % notice the order
g66 = repmat({'With Ears L2 R2R3'},24,1); % notice the order
g77 = repmat({'Without Ears R3R2'},24,1); % notice the order
g88 = repmat({'With Ears L1 R3R2'},24,1); % notice the order
g99 = repmat({'With Ears L2 R3R2'},24,1); % notice the order
g_labels = [g1; g2; g3; g10; g20; g30;g100; g200; g300; g4; g5; g6; g7 ; g8; g9;g44; g55; g66; g77 ; g88; g99];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Distance Eqaul Target (B1)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%% 6th plot: error independent of distance, same object B2 R1R2R3
 figure(17);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 2,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 2,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 2,2}]; % third boxplot
x_boxPlot10 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,2, 2,2}]; % notice order
x_boxPlot20 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,2, 2,2}]; % notice order
x_boxPlot30 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,2, 2,2}]; % notice order
x_boxPlot100=[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 3,3, 2,2}]; % notice order
x_boxPlot200=[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 3,3, 2,2}]; % notice order
x_boxPlot300=[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 3,3, 2,2}]; % notice order
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 2,2}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 2,2}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 2,2}]; % 6th boxplot
x_boxPlot7 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 2,2}]; % 7th boxplot
x_boxPlot8 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 2,2}]; % 8th boxplot
x_boxPlot9 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 2,2}]; % 9th boxplot
x_boxPlot44 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,3, 2,2}]; % 4th boxplot
x_boxPlot55 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,3, 2,2}]; % 5th boxplot
x_boxPlot66 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,3, 2,2}]; % 6th boxplot
x_boxPlot77 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 3,2, 2,2}]; % 7th boxplot
x_boxPlot88 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 3,2, 2,2}]; % 8th boxplot
x_boxPlot99 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 3,2, 2,2}]; % 9th boxplot
x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3,x_boxPlot10, x_boxPlot20, x_boxPlot30,x_boxPlot100, x_boxPlot200, x_boxPlot300,...
    x_boxPlot4, x_boxPlot5, x_boxPlot6, x_boxPlot7, x_boxPlot8, x_boxPlot9,...
    x_boxPlot44, x_boxPlot55, x_boxPlot66, x_boxPlot77, x_boxPlot88, x_boxPlot99];
g1 = repmat({'Without Ears R1R1'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 R1R1'},24,1);
g3 = repmat({'With Ears L2 R1R1'},24,1);
g10 =repmat({'Without Ears R2R2'},24,1);   % notice the order
g20 =repmat({'With Ears L1 R2R2'},24,1);   % notice the order
g30 =repmat({'With Ears L2 R2R2'},24,1);   % notice the order
g100=repmat({'Without Ears R3R3'},24,1);   % notice the order 0
g200=repmat({'With Ears L1 R3R3'},24,1);   % notice the order 0
g300=repmat({'With Ears L2 R3R3'},24,1);   % notice the order 0
g4 = repmat({'Without Ears R1R2'},24,1); % change only the text for different data type
g5 = repmat({'With Ears L1 R1R2'},24,1);
g6 = repmat({'With Ears L2 R1R2'},24,1);
g7 = repmat({'Without Ears R2R1'},24,1); % change only the text for different data type
g8 = repmat({'With Ears L1 R2R1'},24,1);
g9 = repmat({'With Ears L2 R2R1'},24,1);
g44 =repmat({'Without Ears R2R3'},24,1); % notice the order
g55 =repmat({'With Ears L1 R2R3'},24,1); % notice the order
g66 =repmat({'With Ears L2 R2R3'},24,1); % notice the order
g77 =repmat({'Without Ears R3R2'},24,1); % notice the order
g88 =repmat({'With Ears L1 R3R2'},24,1); % notice the order
g99 =repmat({'With Ears L2 R3R2'},24,1); % notice the order
g_labels = [g1; g2; g3; g10; g20; g30; g100; g200; g300; g4; g5; g6; g7; g8; g9; g44; g55; g66; g77 ; g88; g99];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Distance Eqaul Target (B2)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%% 7th plot: error independent of distance, same object B3 R1R2R3 -- BAD data from R3 (and maybe R2)
 figure(18);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,3}]; % third boxplot
x_boxPlot10 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,2, 3,3}]; % notice order
x_boxPlot20 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,2, 3,3}]; % notice order
x_boxPlot30 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,2, 3,3}]; % notice order
x_boxPlot100=[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 3,3, 3,3}]; % notice order
x_boxPlot200=[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 3,3, 3,3}]; % notice order
x_boxPlot300=[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 3,3, 3,3}]; % notice order
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 3,3}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 3,3}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 3,3}]; % 6th boxplot
x_boxPlot7 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 3,3}]; % 7th boxplot
x_boxPlot8 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 3,3}]; % 8th boxplot
x_boxPlot9 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 3,3}]; % 9th boxplot
x_boxPlot44 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,3, 3,3}]; % 4th boxplot
x_boxPlot55 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,3, 3,3}]; % 5th boxplot
x_boxPlot66 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,3, 3,3}]; % 6th boxplot
x_boxPlot77 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 3,2, 3,3}]; % 7th boxplot
x_boxPlot88 =[angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 3,2, 3,3}]; % 8th boxplot
x_boxPlot99 =[angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 3,2, 3,3}]; % 9th boxplot
x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3,x_boxPlot10, x_boxPlot20, x_boxPlot30,x_boxPlot100, x_boxPlot200, x_boxPlot300,...
    x_boxPlot4, x_boxPlot5, x_boxPlot6, x_boxPlot7, x_boxPlot8, x_boxPlot9,...
    x_boxPlot44, x_boxPlot55, x_boxPlot66, x_boxPlot77, x_boxPlot88, x_boxPlot99];
g1 = repmat({'Without Ears R1R1'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 R1R1'},24,1);
g3 = repmat({'With Ears L2 R1R1'},24,1);
g10 =repmat({'Without Ears R2R2'},24,1);   % notice the order
g20 =repmat({'With Ears L1 R2R2'},24,1);   % notice the order
g30 =repmat({'With Ears L2 R2R2'},24,1);   % notice the order
g100=repmat({'Without Ears R3R3'},24,1);   % notice the order 0
g200=repmat({'With Ears L1 R3R3'},24,1);   % notice the order 0
g300=repmat({'With Ears L2 R3R3'},24,1);   % notice the order 0
g4 = repmat({'Without Ears R1R2'},24,1); % change only the text for different data type
g5 = repmat({'With Ears L1 R1R2'},24,1);
g6 = repmat({'With Ears L2 R1R2'},24,1);
g7 = repmat({'Without Ears R2R1'},24,1); % change only the text for different data type
g8 = repmat({'With Ears L1 R2R1'},24,1);
g9 = repmat({'With Ears L2 R2R1'},24,1);
g44 = repmat({'Without Ears R2R3'},24,1); % notice the order
g55 = repmat({'With Ears L1 R2R3'},24,1); % notice the order
g66 = repmat({'With Ears L2 R2R3'},24,1); % notice the order
g77 = repmat({'Without Ears R3R2'},24,1); % notice the order
g88 = repmat({'With Ears L1 R3R2'},24,1); % notice the order
g99 = repmat({'With Ears L2 R3R2'},24,1); % notice the order
g_labels = [g1; g2; g3; g10; g20; g30;g100; g200; g300; g4; g5; g6; g7 ; g8; g9;g44; g55; g66; g77 ; g88; g99];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Distance Eqaul Target (B3)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%% (A)8th plot: error independent of distance and object B12R12R21 B21R12R21 (need to load the data first)
 figure(19);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 1,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 1,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 1,2}]; % third boxplot
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 1,2}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 1,2}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 1,2}]; % 6th boxplot
x_boxPlot1r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 2,1}]; % first boxplot r
x_boxPlot2r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 2,1}]; % second boxplot r
x_boxPlot3r= [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 2,1}]; % third boxplot r
x_boxPlot4r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 2,1}]; % 4th boxplot r
x_boxPlot5r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 2,1}]; % 5th boxplot r
x_boxPlot6r= [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 2,1}]; % 6th boxplot r

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3,  x_boxPlot4,   x_boxPlot5,  x_boxPlot6,...
             x_boxPlot1r , x_boxPlot2r,x_boxPlot3r, x_boxPlot4r,  x_boxPlot5r, x_boxPlot6r];
g1 = repmat({'Without Ears B12 R1R2'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 B12 R1R2'},24,1);
g3 = repmat({'With Ears L2 B12 R1R2'},24,1);
g4 = repmat({'Without Ears B12 R2R1'},24,1);
g5 = repmat({'With Ears L1 B12 R2R1'},24,1);
g6 = repmat({'With Ears L2 B12 R2R1'},24,1);
g1r = repmat({'Without Ears B21 R1R2'},24,1); % reverse
g2r = repmat({'With Ears L1 B21 R1R2'},24,1);
g3r = repmat({'With Ears L2 B21 R1R2'},24,1);
g4r = repmat({'Without Ears B21 R2R1'},24,1);
g5r = repmat({'With Ears L1 B21 R2R1'},24,1);
g6r = repmat({'With Ears L2 B21 R2R1'},24,1);

g_labels = [g1; g2; g3; g4; g5; g6; g1r; g2r; g3r; g4r; g5r; g6r];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Distance Different Target (B12-R12)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%%%
%% (B)8th plot: error independent of distance and object B13R12R21 B31R12R21 (need to load the data first)
 figure(91);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 1,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 1,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 1,3}]; % third boxplot
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 1,3}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 1,3}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 1,3}]; % 6th boxplot
x_boxPlot1r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 3,1}]; % first boxplot r
x_boxPlot2r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 3,1}]; % second boxplot r
x_boxPlot3r= [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 3,1}]; % third boxplot r
x_boxPlot4r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 3,1}]; % 4th boxplot r
x_boxPlot5r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 3,1}]; % 5th boxplot r
x_boxPlot6r= [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 3,1}]; % 6th boxplot r

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3,  x_boxPlot4,   x_boxPlot5,  x_boxPlot6,...
             x_boxPlot1r , x_boxPlot2r,x_boxPlot3r, x_boxPlot4r,  x_boxPlot5r, x_boxPlot6r];
g1 = repmat({'Without Ears B13 R1R2'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 B13 R1R2'},24,1);
g3 = repmat({'With Ears L2 B13 R1R2'},24,1);
g4 = repmat({'Without Ears B13 R2R1'},24,1);
g5 = repmat({'With Ears L1 B13 R2R1'},24,1);
g6 = repmat({'With Ears L2 B13 R2R1'},24,1);
g1r = repmat({'Without Ears B31 R1R2'},24,1); % reverse
g2r = repmat({'With Ears L1 B31 R1R2'},24,1);
g3r = repmat({'With Ears L2 B31 R1R2'},24,1);
g4r = repmat({'Without Ears B31 R2R1'},24,1);
g5r = repmat({'With Ears L1 B31 R2R1'},24,1);
g6r = repmat({'With Ears L2 B31 R2R1'},24,1);

g_labels = [g1; g2 ; g3; g4; g5; g6; g1r; g2r; g3r; g4r; g5r; g6r];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Distance Different Target (B13-R12)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

%%%


%% 8C-Yossi #2 figure - normal matrix
 figure(32);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,1}]; % third boxplot

x_boxPlot = [x_boxPlot1 , x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
set(hboxp,{'linew'},{2})
ylim([-1, 11]); % y values limits
set(gca,'YTick',0:5:10) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);

titleStr1 = 'Same Distance Same Target (Ball 0.5m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                      title({'Absolute Azimuth Error by System Configuration'; titleStr1; ''});
%title('Absolute Azimuth Error by System Configuration');


figure(33);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 2,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 2,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 2,2}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
set(hboxp,{'linew'},{2})
ylim([-1, 11]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);

titleStr1 = 'Same Distance Same Target (Cylinder 0.5m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                             title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(34);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,3}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
set(hboxp,{'linew'},{2})
ylim([-1, 11]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
titleStr1 = 'Same Distance Same Target (Plant 0.5m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                 title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


%% 8C-Yossi #3 figure - distance invariance - try 0.5m vs 1.5 m
figure(35);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 1,1}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');

y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Different Distance Same Target (Ball 0.5m vs 1m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%     title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(36);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 2,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 2,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 2,2}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:10:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Different Distance Same Target (Cylinder 0.5m vs 1m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                     title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(37);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 3,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 3,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 3,3}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:10:70) % y values "grid"
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Different Distance Same Target (Plant 0.5m vs 1m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                  title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure(45);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,3, 1,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,3, 1,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,3, 1,1}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Different Distance Same Target (Ball 0.5m vs 1.5m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                    title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(46);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,3, 2,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,3, 2,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,3, 2,2}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:10:80) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Different Distance Same Target (Cylinder 0.5m vs 1.5m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                    title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(47);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,3, 3,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,3, 3,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,3, 3,3}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:10:80) % y values "grid"
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])
titleStr1 = 'Different Distance Same Target (Plant 0.5m vs 1.5m)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                 title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');







%% 8C-Yossi #4 figure - shape invariance
figure(51);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 2,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 2,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 2,1}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Same Distance Different Target (Cylinder vs Ball)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%               title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(52);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,1}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,1}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,1}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Same Distance Different Target (Plant vs Ball)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%               title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(53);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 3,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 3,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 3,2}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Same Distance Different Target (Plant vs Cylinder)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%         title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(54);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,2}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Same Distance Different Target (Ball vs Cylinder)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%                title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(55);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,1, 1,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,1, 1,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,1, 1,3}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:80) % y values "grid"

ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Same Distance Different Target (Ball vs Plant)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%           title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');


figure(56);
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,1, 2,2, 1,1, 2,3}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,1, 1,1, 1,1, 2,3}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,1, 1,1, 1,1, 2,3}]; % third boxplot

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3];
g1 = repmat({'Without Pinnae'},24,1); % change only the text for different data type
g2 = repmat({'Straight Pinnae'},24,1);
g3 = repmat({'Elevated Pinnae'},24,1);

g_labels = [g1; g2 ; g3];
hboxp = boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
y_lim_080 = ceil((max(quantile(x_boxPlot,0.76)))/5)*5; % round to the next 5 value of the 80% of the box plot (just above the highest blue bar)
ylim([-1, y_lim_080]); % y values limits
set(gca,'YTick',0:5:80) % y values "grid"
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])

titleStr1 = 'Same Distance Different Target (Cylinder vs Plant)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
%           title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
set(gca,'FontSize',16);
set(hboxp,{'linew'},{2})
set(gcf, 'Position',  [100, 100, 300, 400])


%%%%
%% figure for yossi - spectrum
% example:  tytyR{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt};
x_bar = 10000 + (967.739)*[0:max(size(A_HRTF_ALMKERB{12,1,2,1,2,1,1}))-1]; %(976.6 = f_temp(2)-f_temp(1))
spectrumYossiNoPinnaeBall =       tytyR{11,1,2,1,2,1,1,1};
spectrumYossiStraightPinnaeBall =  tytyR{11,1,2,1,1,1,1,1};
spectrumYossiElevatedPinnaeBall = tytyR{11,2,2,1,1,1,1,1};
spectrumYossiNoPinnaeCylinder =       tytyR{11,1,2,1,2,1,2,1};
spectrumYossiStraightPinnaeCylinder =  tytyR{11,1,2,1,1,1,2,1};
spectrumYossiElevatedPinnaeCylinder = tytyR{11,2,2,1,1,1,2,1};
spectrumYossiNoPinnaePlant =       tytyR{11,1,2,1,2,1,3,1};
spectrumYossiStraightPinnaePlant =  tytyR{11,1,2,1,1,1,3,1};
spectrumYossiElevatedPinnaePlant = tytyR{11,2,2,1,1,1,3,1};

figure(69);
set(gca,'FontSize',30);
plot(x_bar,spectrumYossiNoPinnaeBall, 'r', 'lineWidth', 4); hold on;
plot(x_bar,spectrumYossiNoPinnaeCylinder,':b', 'lineWidth', 4);
plot(x_bar,spectrumYossiNoPinnaePlant,':m', 'lineWidth', 4); hold off;
xlabel('Frequency[Hz]'); ylabel('Intensity[dB]');
xlim([10000 100000]);
legend('Ball','Cylinder','Plant');
set(gca,'FontSize',15);
title('No Pinnae Max Reflection'); 

figure(68);
plot(x_bar,spectrumYossiStraightPinnaeBall, 'r', 'lineWidth', 4); hold on;
plot(x_bar,spectrumYossiStraightPinnaeCylinder,':b', 'lineWidth', 4);
plot(x_bar,spectrumYossiStraightPinnaePlant,':m', 'lineWidth', 4); hold off;
xlabel('Frequency[Hz]'); ylabel('Intensity[dB]');
xlim([10000 100000]);
legend('Ball','Cylinder','Plant');
set(gca,'FontSize',15);
title('Straight Pinnae Max Reflection'); 

figure(67);
plot(x_bar,spectrumYossiElevatedPinnaeBall, 'r', 'lineWidth', 4); hold on;
plot(x_bar,spectrumYossiElevatedPinnaeCylinder,':b', 'lineWidth', 4);
plot(x_bar,spectrumYossiElevatedPinnaePlant,':m', 'lineWidth', 4); hold off;
xlabel('Frequency[Hz]'); ylabel('Intensity[dB]');
xlim([10000 100000]);
legend('Ball','Cylinder','Plant');
set(gca,'FontSize',15);
title('Elevated Pinnae Max Reflection'); 


figure(66);
plot(x_bar,spectrumYossiNoPinnaeBall, 'r', 'lineWidth', 4); hold on;
plot(x_bar,spectrumYossiStraightPinnaeBall,':b', 'lineWidth', 4);
plot(x_bar,spectrumYossiElevatedPinnaeBall,':m', 'lineWidth', 4); hold off;
xlabel('Frequency[Hz]'); ylabel('Intensity[dB]');
xlim([10000 100000]);
legend('No Pinnae','Straight Pinnae','Elevated Pinnae');
set(gca,'FontSize',15);
title('Ball Max Reflection'); 

figure(65);
plot(x_bar,spectrumYossiNoPinnaeCylinder, 'r', 'lineWidth', 4); hold on;
plot(x_bar,spectrumYossiStraightPinnaeCylinder,':b', 'lineWidth', 4);
plot(x_bar,spectrumYossiElevatedPinnaeCylinder,':m', 'lineWidth', 4); hold off;
xlabel('Frequency[Hz]'); ylabel('Intensity[dB]');
xlim([10000 100000]);
legend('No Pinnae','Straight Pinnae','Elevated Pinnae');
set(gca,'FontSize',15);
title('Cylinder Max Reflection'); 

figure(64);
plot(x_bar,spectrumYossiNoPinnaePlant, 'r', 'lineWidth', 4); hold on;
plot(x_bar,spectrumYossiStraightPinnaePlant,':b', 'lineWidth', 4);
plot(x_bar,spectrumYossiElevatedPinnaePlant,':m', 'lineWidth', 4); hold off;
xlabel('Frequency[Hz]'); ylabel('Intensity[dB]');
xlim([10000 100000]);
legend('No Pinnae','Straight Pinnae','Elevated Pinnae');
set(gca,'FontSize',15);
title('Plant Max Reflection'); 

figure(63);
go_to_and_show_ALMKERBS_after_xx(11,1,2,1,2,1,1,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('Ball, No Pinnae');
figure(62);
go_to_and_show_ALMKERBS_after_xx(11,1,2,1,2,1,2,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('Cylinder, No Pinnae');
figure(61);
go_to_and_show_ALMKERBS_after_xx(11,1,2,1,2,1,3,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('Plant, No Pinnae');

figure(63);
go_to_and_show_ALMKERBS_after_xx(11,1,2,1,1,1,1,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('   Ball, Straight Pinnae');
figure(62);
go_to_and_show_ALMKERBS_after_xx(11,1,2,1,1,1,2,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('       Cylinder,Straight Pinnae');
figure(61);
go_to_and_show_ALMKERBS_after_xx(11,1,2,1,1,1,3,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('   Plant, Straight Pinnae');

figure(63);
go_to_and_show_ALMKERBS_after_xx(11,2,2,1,1,1,1,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('   Ball, Elevated Pinnae');
figure(62);
go_to_and_show_ALMKERBS_after_xx(11,2,2,1,1,1,2,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('       Cylinder,Elevated Pinnae');
figure(61);
go_to_and_show_ALMKERBS_after_xx(11,2,2,1,1,1,3,1,DQ_ALMKERBS,RQ_ALMKERBS);
title('       Plant,Elevated Pinnae');


%%%%
%set(gca,'FontSize','default');
%% 11th plot - different kind: shows the ILD of ridges

figure(81); %bars
bar(A_HRTF_ALMKERB{12,1,2,1,2,1,1},'b');   hold on;
bar(A_HRTF_ALMKERB{12,1,2,1,1,1,1},'r');
bar(A_HRTF_ALMKERB{12,2,2,1,1,1,1},'k');  


figure(82); %bars
bar(A_HRTF_ALMKERB{12,2,2,1,1,1,1},'b');  
hold on;
bar(A_HRTF_ALMKERB{13,2,2,1,1,1,1},'r');  

figure(83); % opposite
bar(A_HRTF_ALMKERB{11,2,2,1,1,1,1},'b');  hold on;
bar(A_HRTF_ALMKERB{14,2,2,1,1,1,1},'r');

figure(84); % a movie :)
for i = 1:1:24
    bar(A_HRTF_ALMKERB{i,2,2,1,1,1,1}/sqrt(transpose(A_HRTF_ALMKERB{i,2,2,1,1,1,1})*A_HRTF_ALMKERB{i,2,2,1,1,1,1})) ;  
    ylim([-0.35, 0.35]); % y values limits
    pause(0.5);
end;

         %A_e=A_HRTF_ALMKERB{An_oi,Ln_oi,Mnt,Kn_oi,En_oi,Rn_oi,Bn_oi};
         %A_e_gag=A_e/sqrt(transpose(A_e)*A_e);

figure(85); % normalized comparison without, with ears L1 L2
y_bar = [A_HRTF_ALMKERB{12,1,2,1,2,1,1}/sqrt(transpose(A_HRTF_ALMKERB{12,1,2,1,2,1,1})*A_HRTF_ALMKERB{12,1,2,1,2,1,1}) A_HRTF_ALMKERB{12,1,2,1,1,1,1}/sqrt(transpose(A_HRTF_ALMKERB{12,1,2,1,1,1,1})*A_HRTF_ALMKERB{12,1,2,1,1,1,1})  A_HRTF_ALMKERB{12,2,2,1,1,1,1}/sqrt(transpose(A_HRTF_ALMKERB{12,2,2,1,1,1,1})*A_HRTF_ALMKERB{12,2,2,1,1,1,1})];
%y_bar22 = [A_HRTF_ALMKERB{12,2,2,1,1,1,1}/sqrt(transpose(A_HRTF_ALMKERB{12,2,2,1,1,1,1})*A_HRTF_ALMKERB{12,2,2,1,1,1,1}) A_HRTF_ALMKERB{12,2,2,2,1,1,1}/sqrt(transpose(A_HRTF_ALMKERB{12,2,2,2,1,1,1})*A_HRTF_ALMKERB{12,2,2,3,1,1,1})];
%y_bar12 = [A_HRTF_ALMKERB{12,2,2,1,1,1,1}/sqrt(transpose(A_HRTF_ALMKERB{12,2,2,1,1,1,1})*A_HRTF_ALMKERB{12,2,2,1,1,1,1}) A_HRTF_ALMKERB{12,2,2,2,1,1,2}/sqrt(transpose(A_HRTF_ALMKERB{12,2,2,2,1,1,2})*A_HRTF_ALMKERB{12,2,2,3,1,1,2})];

x_bar = 10000 + (967.739)*[0:max(size(A_HRTF_ALMKERB{12,1,2,1,2,1,1}))-1]; %(976.6 = f_temp(2)-f_temp(1))
plot(x_bar, y_bar, 'lineWidth', 4); %bar(x_bar, y_bar);
legend('no pinnae', 'straight pinnae', 'elevated pinnae','Location','northwest');
xlim([10000, 100000]);
title('Normalized ILD of Intensity Ridges');
xlabel('Frequency [Hz]');
ylabel('Normalized Intensity[dB/dB]');


%% 9th plot: error independent of elevation and object same distance (need to load the data first, and fit the code)
ttre= 22 - 'tt'+ g12{12};   %%% a line that stops the program on purpose :) (because it is not finished / needed)
 figure(20);
% fit_the_code---= not working for some reason
                                                     %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,2, 2,2, 1,2, 1,1, 1,1, 1,2}]; % first boxplot

x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{1,2, 2,2, 1,2, 1,1, 1,1, 2,1}]; % third boxplot

x_boxPlot1r= [angleDifAbs_template_test_LLMMKKEERRBB{2,1, 2,2, 1,2, 1,1, 1,1, 1,2}]; % first boxplot r

x_boxPlot3r= [angleDifAbs_template_test_LLMMKKEERRBB{2,1, 2,2, 1,2, 1,1, 1,1, 2,1}]; % third boxplot r

x_boxPlot = [x_boxPlot1 , x_boxPlot3, ...
             x_boxPlot1r ,x_boxPlot3r ];
g1 = repmat({'L12 B12'},24,1); % change only the text for different data type

g3 = repmat({'L12 B21'},24,1);

g1r = repmat({'L21 B12'},24,1); % reverse

g3r = repmat({'L21 B21'},24,1);


g_labels = [g1; g3;  g1r; g3r];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Target and Elevation';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');


%% 10th plot: error independent of elevation, object and distance (need to load the data first, and fit the code)
 figure(21);
%            fit_the_code---=                                         %L    M    K    E    R    B
x_boxPlot1 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 1,2}]; % first boxplot
x_boxPlot2 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 1,2}]; % second boxplot
x_boxPlot3 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 1,2}]; % third boxplot
x_boxPlot4 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 1,2}]; % 4th boxplot
x_boxPlot5 = [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 1,2}]; % 5th boxplot
x_boxPlot6 = [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 1,2}]; % 6th boxplot
x_boxPlot1r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 1,2, 2,1}]; % first boxplot r
x_boxPlot2r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 1,2, 2,1}]; % second boxplot r
x_boxPlot3r= [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 1,2, 2,1}]; % third boxplot r
x_boxPlot4r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 2,2, 2,1, 2,1}]; % 4th boxplot r
x_boxPlot5r= [angleDifAbs_template_test_LLMMKKEERRBB{1,1, 2,2, 1,2, 1,1, 2,1, 2,1}]; % 5th boxplot r
x_boxPlot6r= [angleDifAbs_template_test_LLMMKKEERRBB{2,2, 2,2, 1,2, 1,1, 2,1, 2,1}]; % 6th boxplot r

x_boxPlot = [x_boxPlot1 ,  x_boxPlot2, x_boxPlot3,  x_boxPlot4,   x_boxPlot5,  x_boxPlot6,...
             x_boxPlot1r , x_boxPlot2r,x_boxPlot3r, x_boxPlot4r,  x_boxPlot5r, x_boxPlot6r];
g1 = repmat({'Without Ears B12 R1R2'},24,1); % change only the text for different data type
g2 = repmat({'With Ears L1 B12 R1R2'},24,1);
g3 = repmat({'With Ears L2 B12 R1R2'},24,1);
g4 = repmat({'Without Ears B12 R2R1'},24,1);
g5 = repmat({'With Ears L1 B12 R2R1'},24,1);
g6 = repmat({'With Ears L2 B12 R2R1'},24,1);
g1r = repmat({'Without Ears B21 R1R2'},24,1); % reverse
g2r = repmat({'With Ears L1 B21 R1R2'},24,1);
g3r = repmat({'With Ears L2 B21 R1R2'},24,1);
g4r = repmat({'Without Ears B21 R2R1'},24,1);
g5r = repmat({'With Ears L1 B21 R2R1'},24,1);
g6r = repmat({'With Ears L2 B21 R2R1'},24,1);

g_labels = [g1; g2; g3; g4; g5; g6; g1r; g2r; g3r; g4r; g5r; g6r];
boxplot(x_boxPlot, g_labels, 'PlotStyle' , 'compact', 'BoxStyle', 'outline', 'MedianStyle', 'line','symbol', 'bo');
ylim([-1, 60]); % y values limits
set(gca,'YTick',0:5:60) % y values "grid"

titleStr1 = 'Different Distance Different Target (B12-R12)';%(['1st Template:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
%titleStr2 = '';%(['1st Tested Signal:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
%titleStr3 = '';%(['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
%'; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
%'; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
%title({'Absolute Azimuth Error by System Configuration'; titleStr1  ; titleStr2 ; titleStr3 });
title({'Absolute Azimuth Error by System Configuration'; titleStr1});
%title('Absolute Azimuth Error by System Configuration');
ylabel('| Azimuth Error | [deg]');
xlabel('System Configuration');

