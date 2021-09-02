% Roselynn Conrady M E 556
% MATLAB image from Lecture 3 and 4
% had to fix the Gaussian filter :O
clear all; close all;

% Loading in an image and converting it to unsigned integer
I = imread('photo_sample.jpg');
I1 = rgb2gray(I);
figure, imshow(I1)
% Setting up filter (FS = filter size)
FS = 7; sigma = FS/3;
H = zeros(FS, FS);

xc = (FS+1)/2; yc = (FS+1)/2; % +1 because MATLAB starts at 1 not 0
for i = 1:FS
    for j = 1:FS
        H(i,j) = 1/(2*pi*sigma^2)*exp(-((i - xc)^2 + (j - yc)^2)/(2*sigma^2));
    end
end

[rows, cols] = size(I1);
I2 = I1; 
% I2 = zeros(rows,cols); % leaves black pixels

for i = (FS+1)/2: rows-(FS+1)/2+1
    for j = (FS+1)/2:cols-(FS+1)/2+1
        
        window = I1(i-(FS-1)/2 : i+(FS-1)/2, j-(FS-1)/2 : j+(FS-1)/2);
        multi = double(window).*H;
        result = sum(sum(multi));
        I2(i,j) = result;
        
    end
end
figure, imshow(uint8(I2));


