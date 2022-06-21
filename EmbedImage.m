function colouredIm = EmbedImage(image, colouredIm)
% Key Creation, Encryption
%
% Purpose:
%       This function is used to embed a grayscale image (e.g. the key image)
%       inside another colour image (a 3D uint8 array representing an RGB image)
% Input(s):
%       1)A 2D array of uint8 values (i.e. a greyscale image) of the black and white
%       image to embed inside the colour image. Pixel values will either be 0 or 255.
%       2)A 3D array of uint8 values (i.e. an RGB colour image) that the black
%       and white image will be embedded into
% Output:
%       A 3D array of uint8 values (i.e. an RGB colour image) that contains a hidden
%       black and white image
%
% Example:
%       binary = uint8([ 0 255; 255 0])
%       rng(0) % use the seed just before calling rand, otherwise you will get different random values
%       colour = uint8(255*rand(2,2,3))
%       colour values will be as follows:
%           colour(:,:,1) =
%               208    32
%               231   233
%           colour(:,:,2) =
%               161    71
%               25   139
%           colour(:,:,3) =
%               244    40
%               246   248
%       hidden = EmbedImage(binary,colour)
%       hidden values will be as follows:
%           hidden(:,:,1) =
%               209    32
%               232   233
%           hidden(:,:,2) =
%               161    71
%               25   139
%           hidden(:,:,3) =
%               244    40
%               246   248
%
% Author: Matthew Wai

% Gets an array of the image to iterate through each pixel
[row, cols] = size(image);
for i = 1:row
    for j = 1:cols
        % Gets the colour values of each pixel in the coloured image and
        % uses the double function to get double precision by returning 8bytes 
        red = double(colouredIm(i,j,1));
        green = double(colouredIm(i,j,2));
        blue = double(colouredIm(i,j,3));
        
        % Sums the values of the colours in the pixel and 
        % checks if the sum is even if equal to 0
        coloursum = red + green + blue;
        even = mod(coloursum, 2) == 0;
        
        % If the pixel is black and odd, or white and even, alter the red
        % value of the coloured pixel by 1
        black = image(i,j) == 0;
        if ((black && ~even) || (~black && even))
            colouredIm(i,j,1) = AlterByOne(red);
            
        end
        
    end
end
end

