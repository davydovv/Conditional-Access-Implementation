%Lab3
%Vadim Davydov, 12.05.18
% PSNR can be calculated if in scramble.m and descranble.m the image will
% be not normalised (due to the original and the other one must have the
% same structure


%opening image
image = imread('bierstadt.png');
%scrambling
Image_new = scramble(image, 100, 0.1, 2);
%imshow(Image_new);

%descrambling
Image_desc = descramble(Image_new, 100, 0.1, 2)
psnr_new = psnr(Image_desc, image);
%subplot(1,2,1), subimage(Image_new);
%subplot(1,2,2), subimage(Image_desc);

%imshow(Image_desc);



