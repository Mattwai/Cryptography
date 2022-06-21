function image = ExtractImage(encrypted)
% Decryption
%
% Purpose:
%       This function is called twice, to extract the cipher image and
%       the key image from the image
% Input:
%       A 3D array of uint8 values (i.e.an RGB colour image) that contains a
%       hidden black and white image
% Output:
%       A 2D array of uint8values(i.e. a greyscale image) of the black and white
%       image that was hidden inside the colour image(each pixel will have a value of 0 or 255)
%
% Example:
%       binary = uint8([ 0 255; 0 255])
%       colour = uint8(255*rand(2,2,3)); % random values
%       hidden = EmbedImage(binary,colour)
%       original = ExtractImage(hidden)
%
%       original will be a 2×2 uint8 matrix with values
%           0   255
%           0   255
%
%       hidden(:,:,1) = [178 242; 81 10];
%       hidden(:,:,2) = [112 195; 97 203];
%       hidden(:,:,3) = [48 114; 125 165];
%       hidden = uint8(hidden) % make sure it is of type uint8
%       m = ExtractImage(hidden)
%
%       m will be of a 2×2 uint8 matrix with values
%           0   255
%           255     0
%
% Author: Matthew Wai

% Gets the 3D array of the encrypted image and iterates through to get the
% RGB values
[row, cols, colours] = size(encrypted);
for i = 1:row
    for j = 1:cols
        for k = 1:colours
            % Gets the RGB values, sums them and checks if the sum is even
            red = double(encrypted(i,j,1));
            green = double(encrypted(i,j,2));
            blue = double(encrypted(i,j,3));
            coloursum = red + green + blue;
            even = mod(coloursum, 2) == 0;
            
            % If RGB sum = even, change pixel to black in the image
            % If RGB sum = Odd, change pixel to white in the image
            if even
                image(i,j) = uint8(0);
            else
                image(i,j) = uint8(255);
            end
        end
    end
end
