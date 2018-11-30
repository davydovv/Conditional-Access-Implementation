%function scramble takes four parameters: 
% I - input image;
% s - seed for generating random values;
% p - probability
% n - an integer number
function x = scramble(image, seed, p, n)
%extracting components
red = double(image(:,:,1));
green = double(image(:,:,2));
blue = double(image(:,:,3));

rng(seed);

%normalizing image values
for i=1:1:560
    for j=1:1:776
        %red(i,j) = red(i,j) / 255;
        %green(i,j) = green(i,j) / 255;
        %blue(i,j) = blue(i,j) / 255;
        n1(i,j) = n;
    end
end


%creating matrixes of cells
r = mat2cell(red, [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8], [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]);
g = mat2cell(green, [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8], [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]);
b = mat2cell(blue, [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8], [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]);


%discrete cosine transformation for three components: red, green, blue 
t1 = cellfun(@dct2, r, 'UniformOutput',false)
t2 = cellfun(@dct2, g, 'UniformOutput',false)
t3 = cellfun(@dct2, b, 'UniformOutput',false)


%creating Bernulli matrixes
for i=1:1:70
    for j=1:1:97
        for o=1:1:8
            for l=1:1:8
                Z1(o,l) = binornd(1, p);
                if (Z1(o,l) == 0) Z1(o,l) = -1;
                end
                    
                Z2(o,l) = binornd(1, p);
                if (Z2(o,l) == 0) Z2(o,l) = -1;
                end
                    
                Z3(o,l) = binornd(1, p);
                if (Z3(o,l) == 0) Z3(o,l) = -1;
                end               
            end
        end
        %Z1 = ones(8,8);
        %Z2 = ones(8,8);
        %Z3 = ones(8,8);
        Bernulli_red(i,j) = mat2cell(Z1, [8], [8]);
        Bernulli_green(i,j) = mat2cell(Z2, [8], [8]);
        Bernulli_blue(i,j) = mat2cell(Z3, [8], [8]);
    end
end
n1 = mat2cell(n1, [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8], [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]);
%multiplicating bernulli with discrete coefficients
t1 = cellfun(@multiplying, t1, Bernulli_red, n1, 'UniformOutput',false)
t2 = cellfun(@multiplying, t2, Bernulli_green, n1, 'UniformOutput',false)
t3 = cellfun(@multiplying, t3, Bernulli_blue, n1, 'UniformOutput',false)
 

%inverse discrete cosine transformation
red_comp = cellfun(@idct2, t1, 'UniformOutput',false)
green_comp = cellfun(@idct2, t2, 'UniformOutput',false)
blue_comp = cellfun(@idct2, t3, 'UniformOutput',false)

%collating blocks and components 
red_comp = cell2mat(red_comp)
green_comp = cell2mat(green_comp)
blue_comp = cell2mat(blue_comp)

%this block is used only for PSNR without normalization in the beginning of
%the function
%red_comp = uint8(red_comp)
%green_comp = uint8(green_comp)
%blue_comp = uint8(blue_comp)


x = cat(3, red_comp, green_comp, blue_comp);

