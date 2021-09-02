% Roselynn Conrady M E 556
% MATLAB image from Lecture 3 and 4
% had to fix the Gaussian filter :O
clear all; close all;

% Loading in an image and converting it to unsigned integer
I = imread('photo_sample.jpg');
%I = imread('InterlockPuzzle.png');
I1 = rgb2gray(I);
figure, imshow(uint8(I1))
% Setting up filter (FS = filter size)
FS = 7; sigma = FS/3;
H = ones(FS,FS)*(1/(FS^2));
[rows, cols] = size(I1);
I2 = I1;

for i = (FS+1)/2: rows-(FS+1)/2+1
    for j = (FS+1)/2:cols-(FS+1)/2+1
        
        window = I1(i-(FS-1)/2 : i+(FS-1)/2, j-(FS-1)/2 : j+(FS-1)/2);
        multi = double(window).*H;
        result = sum(sum(multi));
        I2(i,j) = result;
        
    end
end

figure, imshow(uint8(I2));




