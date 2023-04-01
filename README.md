# Paper-Invariance-Localization
Code for the paper: Invariant echo localization using bat pinnae

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
