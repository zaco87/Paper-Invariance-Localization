# Paper-Invariance-Localization
Code for the paper: Invariant echo localization using bat pinnae

TLDR:
load the file A_HRTF_variable.mat to your workspace (full workspace is too large for sharing ~3Gb)
use the final variables:

"A_HRTF_ALMKERB{i,Lnt,Mnt,Knt,Ent,Rnt,Bnt}" -> this is the ILD_max vector
i=1:24 (azimuth angle. 1-> -60deg, 24-> +60deg, linear distribution. can use the formula: i=An_angle=(-60+((An-1)*120/23)))
Lnt=1:2 (pinnae elevation. 1 -> straight microphone. 2 ->  downward rotated microphone (relevant for "with pinnae" condition only))
Mnt=1:2 (use only Mnt=2. this is the GRAS microphone)
Knt = 1:5 (chirp number. the experiment had 5 transmitted chirps in every condition. use only knt=1:2, other data (3:5) is not verified)
Ent = 1:1 (pinnae condition. 1 -> with pinnae, 2 -> no pinnae)
Rnt = 1:4 (target distance. 1 -> 0.5 m, 2 -> 1.0m, 3 -> 1.5m, 4 -> 2.0m. use only Rnt=1:3. Rnt=4 is not verified)
Bnt = 1:3 (target object type. 1 -> ball. 2 -> cylinder. 3 -> plant)

list of main functions

1. main_version_Q1.m is the first script to run. it takes all the data  and organize the signals in variables
2. chirps_and_locationsQ1.m and chirps_and_locationsQ1_drift finds the echoes positions and validates them
3. find_f1_f2Q.m is used to find the numeric values of the frequencies after the spectrogram was used
4. find_t_RQ1.m and find_t_RQ1_drift.m finds the positions of the echoes in the spectrograms. it uses the direct signal time position in order to position correctly the time position of the echo
5. go_to_and_show_ALMKERBS.m is used to store the echoes in a cell stracture
6. go_to_and_show_ALMKERBS_after.m and go_to_and_show_ALMKERBS_after_b.m go_to_and_show_ALMKERBS_after_c.m and go_to_and_show_ALMKERBS_after_xx.m visualization and manipulation of the above
7. rotate_spectrogramQ is used to totate the spectrogram of the echo for easier data manipulation. it is not really rotation but linear bias that makes the linear chirp vertical on spectrogram axes
8. run_it_to_get_stuff_f.m and run_it_to_get_stuff_g.m are the ILD calculation and normalization
9. run_it_to_get_stuff_h_ddays_angle_dimentions.m calculates the template-test cosine similarity
10. run_it_to_get_stuff_i_error_bar.m calculates and plots the error bars for the paper
11. run_it_to_get_stuff_j_new_error_groups_2023_var_2.m calculates and plots the error mean and SE for different regions of azimuth angles

the data itself  is a property of Tel Aviv University and available with permision from yossiyovel@gmail.com or zahicohen87@gmail.com
