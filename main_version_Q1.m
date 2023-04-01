
RQ_ALMKERBS=cell(24,2,2,5,2,4,3,2);
DQ_ALMKERBS=cell(24,2,2,5,2,4,3,2);
IsQ_ALMKERBS=cell(24,2,2,5,2,4,3,2);
LOCQ_D_ALMKERBS=cell(24,2,2,5,2,4,3,2);
LOCQ_R_ALMKERBS=cell(24,2,2,5,2,4,3,2);
DLSQ_ARBS_A12_K1=cell(24,4,3,2);


%%%%% finding the first sample value to look for R
En=1;
Ln=1;
Mn=2;
for Rn=1:1:4 % Rn=1:1:4
                     for Bn=1:1:3   
                         for Sn=1:1:2
                            file_loc=file_location(Ln,Mn,En,Rn,Bn,Sn);
                             An=12;    %An=12 -> Kn=1   or    An=13 -> Kn=2
                                ['L' num2str(Ln) ' M' num2str(Mn) ' E' num2str(En) ' R' num2str(Rn) ' B' num2str(Bn) ' S' num2str(Sn) ' A' num2str(An)]
                                [chirps,chirps_loc,i_s,dls]=chirps_and_locationQ1(file_loc,An,Rn*0.5,(-60+((An-1)*120/23)),Sn);
                                DLSQ_ARBS_A12_K1{An,Rn,Bn,Sn}=dls(1);     %%%% this is the shit (only the first cell)
                                dls(1)                              
                           pause(0.01);
                           dls(1);
                         end;
                     end;
end;
pause(0.01);



%%%%%%% the main variable recieved from above: DLSQ_A12_K1

%%%% ##################################
%%%%%%% END of initial sample value ###
%%%% ##################################

    for Ln=1:1:2    %%%%%     1:1:2
            if Ln==2  % when Ln==2, the only experiment includes ears, so En=1 only
                En_last=1;
            else
                En_last=2;
            end;
        for Mn=2:1:2 %only GRAS mics are my interest, so M=2 only.
            for En=1:1:En_last    % En=1:1:En_last
                 for Rn=1:1:4 % Rn=1:1:4
                     for Bn=1:1:3   
                         for Sn=1:1:2
                            file_loc=file_location(Ln,Mn,En,Rn,Bn,Sn);
                            for An=12:1:12
                                ['L' num2str(Ln) ' M' num2str(Mn) ' E' num2str(En) ' R' num2str(Rn) ' B' num2str(Bn) ' S' num2str(Sn) ' A' num2str(An)]
                                deltafornow=DLSQ_ARBS_A12_K1{An,Rn,Bn,Sn};
                                [chirps,chirps_loc,i_s,dfn] = chirps_and_locationQ1_drift(file_loc,An,Rn*0.5,(-60+((An-1)*120/23)),Sn,deltafornow) ;  
                                for Kn=1:1:5 
                                    D_temp=chirps(2*Kn-1,:);
                                    DQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=D_temp;
                                                                        
                                    R_temp=chirps(2*Kn,:);
                                    RQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=R_temp;
                                    
                                    IsQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=i_s;
                                    LOCQ_D_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=chirps_loc(2*Kn-1);
                                    LOCQ_R_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=chirps_loc(2*Kn);
                                end;                                
                            end;
                            
                            for An=13:1:24
                                deltafornow=DLSQ_ARBS_A12_K1{An-1,Rn,Bn,Sn};
                                ['L' num2str(Ln) ' M' num2str(Mn) ' E' num2str(En) ' R' num2str(Rn) ' B' num2str(Bn) ' S' num2str(Sn) ' A' num2str(An)]
                                [chirps,chirps_loc,i_s,delta_for_next]=chirps_and_locationQ1_drift(file_loc,An,Rn*0.5,(-60+((An-1)*120/23)),Sn,deltafornow);
                                DLSQ_ARBS_A12_K1{An,Rn,Bn,Sn}=delta_for_next;
                                for Kn=1:1:5
                                    
                                    D_temp=chirps(2*Kn-1,:);
                                    DQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=D_temp;
                                                                        
                                    R_temp=chirps(2*Kn,:);
                                    RQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=R_temp;
                                    
                                    IsQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=i_s;
                                    LOCQ_D_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=chirps_loc(2*Kn-1);
                                    LOCQ_R_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=chirps_loc(2*Kn);
                                end;                                
                            end;
                            
                            for An=11:-1:1
                                deltafornow=DLSQ_ARBS_A12_K1{An+1,Rn,Bn,Sn};
                                ['L' num2str(Ln) ' M' num2str(Mn) ' E' num2str(En) ' R' num2str(Rn) ' B' num2str(Bn) ' S' num2str(Sn) ' A' num2str(An)]
                                [chirps,chirps_loc,i_s,delta_for_next]=chirps_and_locationQ1_drift(file_loc,An,Rn*0.5,(-60+((An-1)*120/23)),Sn,deltafornow);
                                DLSQ_ARBS_A12_K1{An,Rn,Bn,Sn}=delta_for_next;
                                for Kn=1:1:5
                                    
                                    D_temp=chirps(2*Kn-1,:);
                                    DQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=D_temp;
                                                                        
                                    R_temp=chirps(2*Kn,:);
                                    RQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=R_temp;
                                    
                                    IsQ_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=i_s;
                                    LOCQ_D_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=chirps_loc(2*Kn-1);
                                    LOCQ_R_ALMKERBS{An,Ln,Mn,Kn,En,Rn,Bn,Sn}=chirps_loc(2*Kn);
                                end;                                
                            end;
                            
                         end;
                     end;
                 end;
            end;
        end;
    end;
    
    % at this point, all the data of R and Q is good and verified.
    % now there should be a rotating process.
    % first i check it manually because of the drift and the overlapping
    % and then i will put it here under this line

    