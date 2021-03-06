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
H = zeros(FS, FS);

% Gaussian filtering w/o built in function 
% Gaussian filtering formula more or less
xc = (FS+1)/2; yc = (FS+1)/2; % +1 because MATLAB starts at 1 not 0
for i = 1:FS
    for j = 1:FS
        H(i,j) = 1/(2*pi*sigma^2)*exp(-((i - xc)^2 + (j - yc)^2)/(2*sigma^2));
    end
end
% Leftover code
% Mean filtering w/o built in function
% FS = 7; H = ones(FS,FS)*(1/(FS^2)); %idk where this came 

% H = H./sum(sum(H)); % doing another normalization, we want total energy 
% ignore the above line of code now that we fixed Gaussian
% filter kernel must sum to 1

% we need the code below in order to actually do the image processing for
% any filter tho
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



% Using built-in MATLAB functions
% Mean filtering with built in functions
% FS = 11;
% H = ones(FS,FS)*(1/(FS^2));
% I2 = imfilter(I1, H);
% figure, imshow(uint8(I2))

% Gaussian Filtering with built in function

% FS = 11; sigma = FS/3; 
% H = fspecial('gaussian', [FS, FS], sigma);
% I3 = imfilter(I1, H1);figure, imshow(uint8(I3))


