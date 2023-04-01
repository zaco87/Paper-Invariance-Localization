% not a function, just a program for now
% this program uses the function go_to_and_show_ALMKERBS_after_b and
% produces a plot of the sum2(D-R) output. as can be seen from the results
% there should be a consideration of left and right together in order to
% extract information.

% uncomment to run from scratch, comment to add measurements
 clear tytyR;
 clear tytyD;
 figure(11);
 close(11);
 tytyR{24,2,2,5,2,4,3,2}=zeros(11,104); % (nf1,nf2) in acordance with the frequencies of interest at go_to_and_show_ALMKERBS_after_c.m
 tytyD{24,2,2,5,2,4,3,2}=zeros(11,104); % % 11 corresponds to f=~10kHz % 104 corresponds to f=~100kHz     
 sum_del_func{2,2,5,2,4,3}=0;
 sum_del_funcXXX{2,2,5,2,4,3}=0;
% end of uncomment to start from scratch 
 temp_sum_del_func(24)=0;
% A_HRTF_ALMKERB=cell(24,2,2,5,2,4,3);
%  RA_AUTO_CORRELATION_MATRIX=cell(24,2,2,5,2,4,3);
%  M_MATRIX=cell(24,2,2,5,2,4,3);
%  u_l=cell(24,2,2,5,2,4,3);
%  THETA_psi=cell(24,2,2,5,2,4,3);
%  A_gag=cell(24,2,2,5,2,4,3);

% start here to run without initialization
 %start of calculating templates THETA ######################################
 Mnt=2; Ent=1; %Lnt=2; %Bnt=1;  %Lnt=1; Mnt=2; Ent=2; Bnt=1;
for Lnt=2:1:2 % 1:1:2
for Bnt=3:1:3 % 1:1:3
    for Rnt=1:1:1 % 1:1:4
        for Knt=1:1:2   %1:1:5
            for Ant=[1:11, 12:13, 14:24] %12 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CAREFUL !!!
                 %if size(A_gag{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt},1) ~= 94 % added line - if something doesnt work delete this condition !!!  %#$#$#$
                for Snt=1:1:2 %[1:1:2]
                    if (Bnt == 3 && Ant >= 21 && Snt == 1 && Rnt == 1)   % manual data correction start           %#$#$#$
  [qwert1_xx ,qwert2_xx]=go_to_and_show_ALMKERBS_after_c(20,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt,DQ_ALMKERBS,RQ_ALMKERBS); %#$#$#$
  tytyR{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt}=qwert2_xx;                                                               %#$#$#$
  tytyD{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt}=qwert1_xx;                                                               %#$#$#$
                    else % end of manual data correction end
[qwert1 ,qwert2]=go_to_and_show_ALMKERBS_after_c(Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt,DQ_ALMKERBS,RQ_ALMKERBS);
tytyR{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt}=qwert2;
tytyD{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,Snt}=qwert1;
                    end;
                end;
            
            
            A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=tytyR{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,1}-tytyR{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,2}   ;%- ( sum(tytyR{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt,1})-0);
            A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=transpose(A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            A_gag{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}/sqrt(transpose(A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt})*A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            RA_AUTO_CORRELATION_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}*transpose(A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            N_temp=24;           %N_temp=max(size(RA_AUTO_CORRELATION_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}));
            delta_psi_squared(24)=0;  %delta_psi_squared(N_temp)=0;
            for i=1:1:N_temp    %N_temp
            delta_psi_squared(i)=( mod(abs((-60+(Ant-1)*120/23)  - (-60+(i-1)*120/23)),180))^2;  % An_angle=(-60+((An-1)*120/23)) % mod 180 is not needed (never more than half revolution(180deg) but i put it there for further use)       
            end;
            M_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=(1/(N_temp-1))*sum(delta_psi_squared)*RA_AUTO_CORRELATION_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt};
            %N_temp2=max(size(RA_AUTO_CORRELATION_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}))   % check dimention N_temp2 
            u_l{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=1;
            ul=u_l{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt};
            M_inv=inv(M_MATRIX{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            A_transpose=transpose(A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt});
            A_regular=A_HRTF_ALMKERB{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt};
            THETA_psi{Ant,Lnt,Mnt,Knt,Ent,Rnt,Bnt}=(ul*M_inv*A_regular)/(A_transpose*M_inv*A_regular);
                 %else
                 %    disp('skipped because of the above condition');
                 %end;
            end;
        end;
    end;
end;
end;
     % manual data correction

        %end of calculating templates THETA ######################################
    %     return %%   RETURN ###########################################################################################################################################################
%%%%%%%%%%%%%%%%%%   after this line i started loading the data saved from running this program, and started working in run_it_to_get_stuff_g.m ######################################    




