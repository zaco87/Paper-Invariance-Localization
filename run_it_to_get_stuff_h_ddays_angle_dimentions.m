%load(data_from_run_09_04_20.mat);
%run program run_it_to_get_stuff_f.m with different values of LMEBR in
%order for this program to work
% or you can load the data directly:
% for all ALMKERBS only K=1,2, and only E = 1,  load('data_from_run_27_10_20_E1all(k12).mat')
% for all ALMKERBS only K=1,2, and only E = 2,  load('data_from_run_29_10_20_E2all(k12).mat')
% the files are located at 'C:\Users\Z-PC\Documents\Study\Second
% Degree\thesis\experiments\0-0-0 25.11.17 last experiment\matlab programs\matlab programs set 5 - new 21.10.19'

 % start of computing the match of Ae = arbitrary measurement (i choose it, "without knowing")
 figure(73);
 close(73);
 delta_psi_squared_multiply_RA=zeros(94,94);
  match_value_c(24)=0; 
  DMM_ODMM(24)=0;
match_value_A_gag_c(24)=0;
 M_MATRIX=cell(24,2,2,5,2,4,3);
 u_l=cell(24,2,2,5,2,4,3);
 THETA_psi=cell(24,2,2,5,2,4,3);
 plane_AC2=zeros(24,24);
 plane_max_AC=zeros(24,24);
 max_in_row_spot=zeros(24);
% start of initialization: uncomment for initialization (do not do it unless you start over !!!)
% angleDif_template_test_LLMMKKEERRBB = cell(2, 2, 2, 2, 5, 5, 2, 2, 4, 4, 3, 3);
% angleDifAbs_template_test_LLMMKKEERRBB = cell(2, 2, 2, 2, 5, 5, 2, 2, 4, 4, 3, 3);
% end of initialization

        % figure(78);
        % close(78);
         Lnt = 2 ; Mnt=2;     Ent = 1; Bnt = 1  ; Knt = 1;  % 1 2 2 1 1 "nt" = templates
         Ln_oi=2 ; Mn_oi=Mnt; En_oi=1; Bn_oi=1;   Kn_oi=2;   % "oi" = test
         Rnt = 1; %An_oi=13;    % 1/3 2 1
         Rn_oi=2;%3;
          %if size(angleDifAbs_template_test_LLMMKKEERRBB{Lnt,Ln_oi, Mnt,Mn_oi, Knt,Kn_oi, Ent,En_oi, Rnt,Rn_oi, Bnt,Bn_oi},1) ~= 24 % added line - if something doesnt work delete this condition !!!
          
                           
          SNR_v=(0.1); %0.1 %should be 2.5    % 0.0000001 - > 0.0001 have 6 mistakes ; 0.001 have 4 mistakes (but many inacuracies) ; 0.01 0 mistakes, but very unaccurate ; 
          %%%%% 0.1 0 mistakes, but very unaccurate   ;   1 works best, no
          %%%%% mistakes ; 2.5,5,10 works same as auto correlation ; 1.5 is
          %%%%% a bit better than AC; 
          %R_lambda=NR_v*eye(94);
          LAMBDA_ERROR_VECTOR=rand(94,1);
          R_lambda=SNR_v*(LAMBDA_ERROR_VECTOR*transpose(LAMBDA_ERROR_VECTOR)+1*eye(94));
          for An_oi=1:1:24
              if (An_oi == 13)% || (An_oi == 14)
                  pause(0.1);
                  %stop;
              end;
         A_e=A_HRTF_ALMKERB{An_oi,Ln_oi,Mnt,Kn_oi,En_oi,Rn_oi,Bn_oi};
         A_e_gag=A_e/sqrt(transpose(A_e)*A_e);
             for Ant=[1:11, 12:13, 14:24]    % second run ################################################################
  
            N_temp=24;           %N_temp=max(size(RA_AUTO_CORRELATION_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}));
            %delta_psi_squared_nultiply_RA(24)=0;  %delta_psi_squared(N_temp)=0;
            total_sum_squared_multiple_RA=zeros(94,94);
            for i=1:1:N_temp    %N_temp
            A_i=A_HRTF_ALMKERB{i,Lnt,Mnt,Knt,Ent,Rnt,Bnt};    
            A_i_gag=A_i/sqrt(transpose(A_i)*A_i);
            delta_psi_squared_multiply_RA=(( mod(abs((-60+(Ant-1)*120/23)  - (-60+(i-1)*120/23)),180))^2)* ...
            (A_i_gag*transpose(A_i_gag)+R_lambda);   % +SNR_v*eye(94) );%eye(94));   %  ()*(A_e_gag*transpose(A_e_gag));
            %+(10^2*eye(94)));  % An_angle=(-60+((An-1)*120/23)) % mod 180 is not needed (never more than half revolution(180deg) but i put it there for further use)       % sqrt(x)^2 =x
            total_sum_squared_multiple_RA=total_sum_squared_multiple_RA+(1/(N_temp-1))*delta_psi_squared_multiply_RA;
            end;
            M_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=total_sum_squared_multiple_RA;
            %N_temp2=max(size(RA_AUTO_CORRELATION_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}))   % check dimention N_temp2 
            u_l{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=1;
            ul=u_l{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt};
            M_inv=inv(M_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            A_regular_gag=A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}/sqrt(transpose(A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt})*A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            %A_regular_transpose_gag=transpose(A_regular_gag);
            THETA_psi{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=(ul*M_inv*A_regular_gag)/(transpose(A_regular_gag)*M_inv*A_regular_gag);
             
            end;
         
         
         for Ant=1:1:24
         match_value_c(Ant)=transpose(THETA_psi{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt})*(A_e_gag);
         match_value_A_gag_c(Ant)=(transpose(A_gag{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}))*(A_e_gag);
         N_temp=24;
          %delta_psi_squared_mc2(24)=0;
           % for i=1:1:N_temp    %N_temp
           % delta_psi_squared_mc2(i)=(( mod(abs((-60+(Ant-1)*120/23)  - (-60+(i-1)*120/23)),180))^2)*(A_HRTF_ALMKERB{i,Lnt,Mnt,Knt,Ent,Rnt,Bnt}*(transpose(A_HRTF_ALMKERB{i,Lnt,Mnt,Knt,Ent,Rnt,Bnt})));  % An_angle=(-60+((An-1)*120/23)) % mod 180 is not needed (never more than half revolution(180deg) but i put it there for further use)       
           % end;
           %DMM_ODMM(Ant)=(match_value_c(Ant))^2/((1/(N_temp-1))*sum(delta_psi_squared_mc2));
                 
         end;
         
         figure(78);
         x_vector=1:24;
         plot(x_vector,match_value_c,'b');
%%%% uncomment the next 11 lines to get the regular graph %%%%%%%%%
         plane_AC(An_oi,:)=match_value_c;
         [stam, max_in_row_spot(An_oi)]=max(match_value_c);
         plane_max_AC(An_oi,max_in_row_spot(An_oi))=stam;
         hold on;
         [maxv_v,maxv_l]=max(match_value_c);
         [minv_v,minv_l]=min(match_value_c);
         plot([maxv_l maxv_l],[minv_v maxv_v],'-or');
         plot([minv_l minv_l],[minv_v maxv_v],'-om');
         text(maxv_l*1.03,minv_v,num2str(An_oi),'color','red');
         text(maxv_l*0.93,minv_v,num2str(maxv_l),'color','black');
         hold off;
%%%% end of regular graph  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         
                  figure(76);
         x_vector=1:24;
         plot(x_vector,DMM_ODMM,'b');
         hold on;
         [maxv_v,maxv_l]=max(DMM_ODMM);
         [minv_v,minv_l]=min(DMM_ODMM);
         plot([maxv_l maxv_l],[minv_v maxv_v],'-or');
         plot([minv_l minv_l],[minv_v maxv_v],'-om');
         text(maxv_l*1.03,minv_v,num2str(An_oi),'color','red');
         text(maxv_l*0.93,minv_v,num2str(maxv_l),'color','black');
         hold off;
         
                           figure(74);
         x_vector=1:24;
         plot(-60 + (x_vector-1)*120/23,match_value_A_gag_c,'b', 'lineWidth', 4);
         
         hold on;
         [maxv_v,maxv_l]=max(match_value_A_gag_c);
         [minv_v,minv_l]=min(match_value_A_gag_c);
         plot(-60+([maxv_l maxv_l]-1)*120/23,[-1 maxv_v],':or'); % dashed red in the max cosine similarity
        %plot(-60+([maxv_l maxv_l]-1)*120/23,[minv_v maxv_v],':or'); % dashed red in the max cosine similarity
         %plot(-60+([An_oi An_oi]-1)*120/23,[minv_v maxv_v],'--vk'); % dashed black in the real azimuth
         %plot(-60+ ([minv_l minv_l]-1)*120/23,[minv_v maxv_v],'-om');
         set(gca,'FontSize',20)
         %text((-60+(maxv_l-1)*120/23)*1.1,minv_v*1.1,[num2str(round(-60+(An_oi-1)*120/23,2)) '\circ'],'color','black');  
         text((-60+(maxv_l-1)*120/23)*0.9+2,-0.8,[num2str(round(-60+(maxv_l-1)*120/23 ,2)) '\circ'],'color','red', 'FontSize', 15);
        %text((-60+(maxv_l-1)*120/23)*0.9+2,minv_v*0.9-0.2,[num2str(round(-60+(maxv_l-1)*120/23 ,2)) '\circ'],'color','red', 'FontSize', 15);
         %set(gca,'FontSize',20)
         xlabel('Azimuth[\circ]', 'FontSize', 20);
         ylabel('Normalized Cross Correlation', 'FontSize', 20);
         titleStr1 = (['Referance:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
         titleStr2 = (['Test:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
         titleStr3 = ' ';
         title({ 'ILD AC Value [dB]'; titleStr1  ; titleStr2 ; titleStr3});
         ylim([-1 1]);
         xlim([-60 60]);
         h111 = gca;
         set(h111, 'XTick', [-60 -40 -20 0 20 40 60]);
         
         %set(gca,'FontSize','default')
         hold off;
             
         pause(0.2);
                
         plane_AC2(An_oi,:)=match_value_A_gag_c;
         [stam, max_in_row_spot(An_oi)]=max(match_value_A_gag_c);
         plane_max_AC(An_oi,max_in_row_spot(An_oi))=stam;
         hold on;
         [maxv_v,maxv_l]=max(match_value_A_gag_c);
         [minv_v,minv_l]=min(match_value_A_gag_c);
         %%%plot((-60+([maxv_l maxv_l]-1)*120/23),[minv_v maxv_v],'-or');
         %%%plot((-60+([minv_l minv_l]-1)*120/23),[minv_v maxv_v],'-om');
         %text((-60+(maxv_l-1)*120/23)*1.1,minv_v,num2str(An_oi),'color','red');
         %text((-60+(maxv_l-1)*120/23)*0.9,minv_v,num2str(maxv_l),'color','black');
         hold off;
         
         
          end;
%%%% this is the part i plot the binary graph. uncomment to create again
          figure(73);  %72
          h = surface(plane_AC2);
          %surface(plane_AC - plane_AC2);
          colormap(gray);
          colorbar;
%           hold on;
%           surface(plane_max_AC);
          
          hold on;
          minus1 = -1 * ones(1,24);
          plot3(-60:120/23:60 ,-60+ (max_in_row_spot(:,1)-1)*120/23,minus1,'r','LineWidth',4);
          %plot(1:1:24,max_in_row_spot,'r','LineWidth',4);
          hold on;
          plot(-60:120/23:60,-60:120/23:60,'--b');

          hold off;
          h.XData = -60 + (h.XData-1)*120/23; % angles dimentions in degrees
          h.YData = -60 + (h.YData-1)*120/23; % angles dimentions in degrees
          set(gca,'XTick',-60:20:60) % x values "grid"
          set(gca,'YTick',-60:20:60) % y values "grid"
          xlabel('Real Azimuth [deg]');
          ylabel('Estimated Azimuth [deg]');
          
          angleDif = (max_in_row_spot(:,1)-(1:1:24)') * 120/23; %deg
          angleDif_template_test_LLMMKKEERRBB{Lnt,Ln_oi,Mnt,Mn_oi,Knt, Kn_oi,Ent, En_oi,Rnt, Rn_oi,Bnt, Bn_oi} = angleDif ; %saving the result for future program
          angleDifAbs_template_test_LLMMKKEERRBB{Lnt,Ln_oi,Mnt,Mn_oi,Knt, Kn_oi,Ent, En_oi,Rnt, Rn_oi,Bnt, Bn_oi} = abs(angleDif) ; %saving the result for future program
          stdAngleDifDeg = std(angleDif);
          meanAngleDifDeg = mean(angleDif);
          meanAngleAbsDifDeg = (mean(abs(angleDif)));
          titleStr1 = (['Referance:' ,' L' num2str(Lnt),' K' num2str(Knt),' E' num2str(Ent),' R' num2str(Rnt),' B' num2str(Bnt)]);
          titleStr2 = (['Test:       ', '    L' num2str(Ln_oi),' K' num2str(Kn_oi),' E' num2str(En_oi),' R' num2str(Rn_oi),' B' num2str(Bn_oi) ]);
          titleStr3 = (['\mu_{\delta}=' ,num2str(round(meanAngleDifDeg,2)),'\circ ',...
              '; \mu_{|\delta|}=', num2str(round(meanAngleAbsDifDeg,2)),'\circ ', ...
              '; \sigma_{\delta}=' , num2str(round(stdAngleDifDeg,2)),'\circ']);
          axis image;
          caxis([-1,1]);
          set(gca,'FontSize',20);
          view([0 -90]);
          %title({'ILD AC Value [dB]'; titleStr1  ; titleStr2 ; titleStr3 ;' ' });%add title here by uncomment
          %else
          %      disp('skipping the graphs because of above condition. size of A_gag is:');
          %     size(A_gag{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt},1)
          %     figure(1);
          %     pause(0.5);
          %     close 1;
          %end; % endif

%           h = surface(plane_AC);
% hold on;
%    z_max = max(max(get(h,'Zdata')));
% line(1:24,1:24,z_max*ones(1,24),'--b');
% hold on;
% line(1:24,max_in_row_spot,z_max*ones(1,24),'r','LineWidth',4);
% hold off;
          
% end of computing the match of Ae = arbitrary measurement (i choose it, "without knowing")
%%%% end of computing the binary graph          