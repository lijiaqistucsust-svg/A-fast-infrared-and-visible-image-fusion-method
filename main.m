clear;
close all;
addpath(genpath(pwd));
folder1='Input_IMG/';
filepath=dir(folder1);   
filepath1=filepath(3:end); 
totalTic = tic;  
for i = 1:2:length(filepath1)-1
    a=im2double(imread(fullfile(folder1,filepath1(i).name)));
    b=im2double(imread(fullfile(folder1,filepath1(i+1).name)));
    if size(a,3)==3
        a=rgb2gray(a);
    end
    if size(b,3)==3
        b=rgb2gray(b);
    end
    imgSeqColor=zeros(size(a,1),size(a,2),2);
    imgSeqColor(:,:,1)=a;
    imgSeqColor(:,:,2)=b;
    [C_out,D1,D21] = multi_sta(imgSeqColor);
    folderName =['Output', filepath1(i).name;];
    targetFolder= 'output_IMG/'; 
    savePath = fullfile(targetFolder, folderName);
    imwrite(C_out,savePath);
end
totalTime = toc(totalTic);
