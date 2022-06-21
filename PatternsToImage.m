function image = PatternsToImage(cell_array)
% Key Creation, Encryption
%
% Purpose:
%       This function takes a cell array of 2x2 uint8 patterns (e.g. the patterns for our key
%       image) and converts it to grayscale image (a 2D uint8 array) so that it
%       can be displayed and saved
% Input:
%       A 2D m x n cell array of 2x2 patterns.  Each element of the array will be a pattern stored
%       as a 2x2 array of uint8 values (i.e. a grayscale image)
% Output:
%       A 2D array of uint8 values(i.e. a greyscale image) with the pixels assembled into a single image.
%       This array will have twice the number of rows and twice the number of columns as the input array
%       (i.e. it will be a 2m x 2n array)
%
% Example:
%       patternArrayRow = { uint8([ 0 0; 255 255]), uint8([0 255; 255 0]) }
%       im = PatternsToImage(patternArrayRow)
%       im should have values
%           0     0     0   255
%         255   255   255     0
%
%       patternArrayCol = { uint8([ 0 0; 255 255]); uint8([0 255; 255 0])}
%       im = PatternsToImage(patternArrayCol)
%       im should have values
%           0     0
%         255   255
%           0   255
%         255     0
%
%       r = [3 5 1 3; 1 6 5 6; 5 4 2 3];
%       p = CreatePatterns();
%       key = GenerateKey(r,p)
%       keyImage = PatternsToImage(key)
%       keyImage should have values
%           0   255     0   255   255   255     0   255
%           0   255   255     0     0     0     0   255
%         255   255   255     0     0   255   255     0
%           0     0     0   255   255     0     0   255
%           0   255   255     0     0     0     0   255
%         255     0   255     0   255   255     0   255
%
% Author: Matthew Wai

% Uses the cell2mat function to convert the cell array into an image array
image = cell2mat(cell_array);

end