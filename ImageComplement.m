function swapped = ImageComplement(image)
% Helper Function
%
% Purpose:
%       This function takes 2D array of an image and swaps black for white and
%       white for black pixels
% Input:
%       A 2D array of uint8values (i.e. a greyscale image) containing black and white pixels
% Output:
%       A 2D array ofuint8values (i.e. a greyscale image) of the complement of the input image
%       (i.e. black has been swapped for white and white for black)
%
% Example:
%       blackRectangle = zeros(2,3,'uint8') % should be all zeros
%       whiteRectangle = ImageComplement(blackRectangle) % should be all 255
%       blackAgain = ImageComplement(whiteRectangle) % should be all zeros
%
%       p = uint8([254 255; 0 1])
%       c = ImageComplement(p)
%
%       c should have values
%           1     0
%         255   254
%
%       rng(0) % use the seed just before calling rand, otherwise you will get different random values
%       r = uint8(255*rand(3,4))
%       c = ImageComplement(r)
%
%       c should have values
%           47    22   184     9
%           24    94   116   215
%          223   230    11     7
%
% Author: Matthew Wai

% Takes a pixel of an image and subtracts the value from 255
swapped = 255 - image;

end
