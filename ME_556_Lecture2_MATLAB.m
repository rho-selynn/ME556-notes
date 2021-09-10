% Roselynn Conrady M E 556
% MATLAB image from Lecture 2
clear all; close all;
% first image
I = checkerboard(6,6);
%I = (I > 0.5);
I = uint8(I)*255;
I1 = I;
I2 = I;
I3 = cat(3,I,I1,I2);
% figure, imshow(I3)
imwrite(I3, 'firstimage.png');
firstimage = imread('firstimage.png');
figure, imshow(firstimage)

% first image with bad cropping (bc)
Ibc = checkerboard(6,8,8);
%I = (I > 0.5);
Ibc = uint8(Ibc)*255;
I1bc = Ibc;
I2bc = Ibc;
I3bc = cat(3,Ibc,I1bc,I2bc);
% figure, imshow(I3)
I3bc = I3bc(25:91, 24:90)
imwrite(I3bc, 'firstimagebc.png');
firstimagebc = imread('firstimagebc.png');
figure, imshow(firstimagebc)


% second image
n = 10; % number of squares
i = 1;
j = 1;
k = 1;

% traditional checkerboard is black and white
% but you can spice up the colors if need be
whitesquare = uint8(ones(n,n,3))*255; 
colorsquare = uint8(zeros(n,n,3));

% uncomment the following code if you want the squares to be other colors
% changing whitesquare
whitesquare(:,:,1) = 255;
whitesquare(:,:,2) = 0;
whitesquare(:,:,3) = 0;
% changing colorsquare
colorsquare(:,:,1) = 72;
colorsquare(:,:,2) = 61;
colorsquare(:,:,3) = 139;

piece_odds = cat(2,colorsquare,whitesquare);

piece_evens = cat(2,whitesquare,colorsquare);

row_odds = piece_odds;
row_evens = piece_evens;

% odd roww
while i <= n/3
    row_odds = cat(2, row_odds, piece_odds);
    i = i + 1;
end
row_odds_final = row_odds;

% even row
while j <= n/3
    row_evens = cat(2, row_evens, piece_evens);
    j = j + 1;
end
row_evens_final = row_evens;

% odd row and even row combined
odd_even_row = [row_odds_final; row_evens_final];
final_checkerboard = odd_even_row;
% combining rows to make a checkerboard
while k <= n/3
    final_checkerboard = [final_checkerboard; odd_even_row];
    k = k + 1;
end

% figure, imshow(final_checkerboard);
imwrite(final_checkerboard, 'secondimage.png');
secondimage = imread('secondimage.png');
figure, imshow(secondimage)


% I0 = zeros(n,n,3, 'uint8');
% I1 = I0; % for first layer
% I2 = I0; % for second layer
% for b = 1:3 % each layer
%     for c = 2:2:6 % column
%         for d = 2:2:6 % row
%             I1(c,d,b) = 1;
%         end
%     end
% end
% I1_final = I1;
% for b = 1:3 % each layer
%     for c = 1:2:6 % column
%         for d = 1:2:6 % row
%             I2(c,d,b) = 1;
%         end
%     end
% end
% I2_final = I2; 
% I3 = I1_final + I2_final;
% the above code made a numeric checkerboard!

% I(:,:,1) = 


% 
% % second image
% I21 = checkerboard(3,3);
% %I2 = (I2 > 0.5);
% I22 = uint8(I2)*255;
% I23 = I22;
% I24 = I22;
% I25 = cat(3,I22,I23,I24);
% % I26 = I25(1:36,1:36, 3);
% 
% I25(:,:,1) = 255;
% I25(:,:,2) = 255;
% I25(:,:,3) = 255;
% figure, imshow(I25)