%% Functionallity
% 1. receives imagestack directory from user
% 2. receives imagestack name from user
% 3. searches for all relevant files for the alghorithm and loads them
function [raw_ch1,raw_ch3,mergedcclist,vascEnhancedMask]=load_input()
imStackDir=uigetdir();
filename=input('enter name of Image Stack');
vasc_enh_name=sprintf('%s/ProcessedData/%s-VascEnhancedMask.mat',imStackDir, filename);
centroids_name=sprintf('%s/ProcessedData/CellCentroidFiles/MergedCellCentroids.mat',imStackDir);
mergedcclist=load(vasc_enh_name);
vascEnhancedMask=load(centroids_name);
raw_ch1_filename=sprintf('%s/%s-Ch1.tif',imStackDir, filename);
raw_ch3_filename=sprintf('%s/%s-Ch3.tif',imStackDir, filename);
raw_ch1=readTiff3D(raw_ch1_filename);
raw_ch3=readTiff3D(raw_ch3_filename);
% outDir=uigetdir();
% input_filename=sprintf('%s/input.mat',outDir);
% save(input_filename,'mergedcclist','vascEnhancedMask','raw_ch1','raw_ch3');
