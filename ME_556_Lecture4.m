% Roselynn Conrady M E 556
% MATLAB image from Lecture 3 and 4
clear all; close all;

I = imread('photo_sample.jpg');

I1 = rgb2gray(I);
figure, imshow(uint8(I1))

% Gaussian filtering w/o built in function
FS = 11; sigma = FS/3; H = zeros(FS, FS); 

[rows, cols] = size(I1);
I2 = I1;

for i = (FS+1)/2: rows-(FS+1)/2+1
    for j = (FS+1)/2:cols-(FS+1)/2+1
        
        window = I1(i-(FS-1)/2 : i+(FS-1)/2, j-(FS-1)/2 : j+(FS-1)/2);
        %multi = double(window).*H;
        %result = sum(sum(multi));
        result = median(window(:)); % putting array into 1-D vector
        I2(i,j) = result;
        
    end
end
figure, imshow(I2);




% Mean filtering with built in functions
% FS = 11;
% H = ones(FS,FS)*(1/(FS^2));
% I2 = imfilter(I1, H);
% figure, imshow(uint8(I2))

% Gaussian Filtering with built in function
%  FS = 11; sigma = FS/3;
% H1 = fspecial('gaussian', [FS, FS], sigma);
% I3 = imfilter(I1, H1);figure, imshow(uint8(I3))


