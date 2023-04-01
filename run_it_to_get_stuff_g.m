%load(data_from_run_09_04_20.mat);

 % start of computing the match of Ae = arbitrary measurement (i choose it, "without knowing")
 delta_psi_squared_multiply_RA=zeros(94,94);
  match_value_c(24)=0; 
  DMM_ODMM(24)=0;
match_value_A_gag_c(24)=0;
 M_MATRIX=cell(24,2,2,5,2,4,3);
 u_l=cell(24,2,2,5,2,4,3);
 THETA_psi=cell(24,2,2,5,2,4,3);

        % figure(78);
        % close(78);
         Lnt=1; Mnt=2; Ent=1; Bnt=1;   %E=2
          Knt=1; Kn_oi=2;  Rnt=1; %An_oi=13;
          SNR_v=(0.00001); %should be 2.5    % 0.0000001 - > 0.0001 have 6 mistakes ; 0.001 have 4 mistakes (but many inacuracies) ; 0.01 0 mistakes, but very unaccurate ; 
          %%%%% 0.1 0 mistakes, but very unaccurate   ;   1 works best, no
          %%%%% mistakes ; 2.5,5,10 works same as auto correlation ; 1.5 is
          %%%%% a bit better than AC; 
          %R_lambda=NR_v*eye(94);
          LAMBDA_ERROR_VECTOR=rand(94,1);
          R_lambda=SNR_v*(LAMBDA_ERROR_VECTOR*transpose(LAMBDA_ERROR_VECTOR)+1*eye(94));
          for An_oi=1:1:24
         A_e=A_HRTF_ALMKERB{An_oi,Lnt,Mnt,Kn_oi,Ent,Rnt,Bnt};
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
         hold on;
         [maxv_v,maxv_l]=max(match_value_c);
         [minv_v,minv_l]=min(match_value_c);
         plot([maxv_l maxv_l],[minv_v maxv_v],'-or');
         plot([minv_l minv_l],[minv_v maxv_v],'-om');
         text(maxv_l*1.03,minv_v,num2str(An_oi),'color','red');
         text(maxv_l*0.93,minv_v,num2str(maxv_l),'color','black');
         hold off;
         
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
         plot(x_vector,match_value_A_gag_c,'b');
         hold on;
         [maxv_v,maxv_l]=max(match_value_A_gag_c);
         [minv_v,minv_l]=min(match_value_A_gag_c);
         plot([maxv_l maxv_l],[minv_v maxv_v],'-or');
         plot([minv_l minv_l],[minv_v maxv_v],'-om');
         text(maxv_l*1.03,minv_v,num2str(An_oi),'color','red');
         text(maxv_l*0.93,minv_v,num2str(maxv_l),'color','black');
         hold off;
         
         
         pause(0.2);
                  
          end;
    
% end of computing the match of Ae = arbitrary measurement (i choose it, "without knowing")
         