function file_loc = file_location(L1,M1,E1,R1,B1,SIDE)
% input: experiment type 
% output: folder of the data
% comment: an addition "angle" string is needed in order to pick the actual data (wav file)

% L = 1, 2 (0, -30 deg)
% M = 1, 2 (Avisoft, GRAS)
% E = 1, 2 (with, without)
% R = 1, 2, 3, 4 (0.5, 1.0, 1.5, 2.0) [m]
% B = 1, 2, 3 (cylinder, ball, plant)
% SIDE = 1, 2 (Left, Right)

file_loc_exp='C:\Users\Z-PC\Documents\Study\Second Degree\thesis\experiments\0-0-0 25.11.17 last experiment\1experiments with GRAS mics (Friday Saturday)';

%file_loc_angle='\T0000024.WAV';

%%%%
if L1==1
    loc_levitation='\L1';
else
    loc_levitation='\L2';
end;
%%%%
  if M1==1
    loc_mic='_M1';
  else
    loc_mic='_M2';  
  end;
    %%%%
    if E1==1
    loc_ears='_E1';
else
    loc_ears='_E2';
    end;
    %%%%
       if R1==1
    loc_radius='_R1';
       elseif  R1==2
   loc_radius='_R2';
       elseif  R1==3
   loc_radius='_R3';
       elseif  R1==4
   loc_radius='_R4';
   end;
   %%%%
       if B1==1
    loc_body='_B1';
       elseif  B1==2
   loc_body='_B2';
       elseif  B1==3
   loc_body='_B3';
   end;
   %%%%
if SIDE==2
    loc_side='\RightMic';
else
    loc_side='\LeftMic';
end;
FLV=[file_loc_exp   loc_side  loc_levitation    loc_mic   loc_ears     loc_radius    loc_body]; %file location vector
file_loc=FLV;
end    