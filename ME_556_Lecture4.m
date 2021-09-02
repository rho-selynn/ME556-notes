% Roselynn Conrady M E 556
% MATLAB image from Lecture 3 and 4
clear all; close all;

I = imread('photo_sample.jpg');

I1 = rgb2gray(I);
figure, imshow(uint8(I1))

% Gaussian filtering w/o built in function
H = zeros(FS, FS); FS = 11; sigma = FS/3;

% [rows, cols] = size(I1);
% I2 = I1;
% xc = (FS-1)/2; yc = (FS-1)/2;
% for i = 1:FS
%     for j = 1:FS
%         H(i,j) = 1/sqrt(2*pi*sigma)*exp(-((i - xc)^2 + (j - yc)^2)/(2*sigma^2));
%     end
% end
% 
% % Mean filtering w/o built in function
% % FS = 7;H = ones(FS,FS)*(1/(FS^2));
% H = H./sum(sum(H)); % doing another normalization, we want total energy
% filter kernel must sum to 1

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


