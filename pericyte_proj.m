function pericyte_proj()
%%
% ###########################
%   PHASE 1
% ############################
% 1.pericyte_proj uses load_input to acess an ImageStack directory, it then reads channels 1 and 3
% and loads mergedcclist and vascenhanced mask for the use of the
% segmentation alghorithm.
%
% ###########################
%   PHASE 2
% ############################
% pericyte_proj uses essential_pre_proccessing and thresholding to prepare
% data for the alghorithm
%
% ###########################
%   PHASE 3
% ############################
% Preform segmentation and saves the outputs
% //////// OUTPUTS ///////////// 
%begin_centroids and seeds cc allong with the raw chs in a .mat file called
% stack.mat for use of the gui.
%
% #######################
%   Files to include in proj
% #######################
% Matlab files Needed:
% essential_pre_processing.m
% thresholding_ch1.m
% extract_pericytes_for_gui.m
% load_input.m
% segmentation_p.m
% readTiff3D.m


%% Select output dir
output_dir=uigetdir();
%% Load input
[raw_ch1,raw_ch3,mergedcclist,vascEnhancedMask]=load_input();
%% Start pre-processing
[cleaned_seeds_mat,filtered_ch1,vasc_enh_mat]=essential_pre_processing(vascEnhancedMask,mergedcclist,raw_ch1);
%% Filter and binarize
thresholded_ch1=thresholding_ch1(raw_ch1,raw_ch3,vasc_enh_mat);
%% Segmetize
[orginized_out_cc,begin_centroids]=segmentation_p(cleaned_seeds_mat,thresholded_ch1);
%% Save outpus to stack.mat
output_filename=sprintf('%s/stack.mat',output_dir);
save(output_filename,'mergedcclist','vascEnhancedMask','raw_ch1','raw_ch3','begin_centroids','orginized_out_cc');
end