function key = GenerateKey(array, patterns)
% Key Creation
%
% Purpose:
%       This function assembles a 2D cell array of 2x2 uint8 patterns to act as a key, with
%       patters randomly assigned to the cell array based on the values in a 2D
%       array of random numbers between 1 and 6
% Input:
%       1) A 2D m x n array of random integer values between 1 and 6 inclusive
%       2) A 1x6 1D cell array containing 6 patterns (where each pattern
%          is stored as a 2x2 uint8 array)
% Output:
%       A 2D m x n cell array containing patterns to act as a key. Each element
%       of the array will be a pattern stored as a 2x2 array of uint8 values
%       (i.e. a grayscale image), with the pattern selected from the list of
%       patterns based on the corresponding random values contained in the 2D
%       array of random integer values.
%
% Example:
%       r = [3 5 1 3; 1 6 5 6; 5 4 2 3];
%       p = CreatePatterns();
%       key = GenerateKey(r,p)
%       key{1,1} % note curly braces
%       should have values
%           0   255
%           0	255
%
%       key{2,3} % note curly braces
%       should have values
%           0   255
%         255     0
%
% Author: Matthew Wai

% Sets the size of the key cell array to the same size as array of values
[row, cols] = size(array);
key = cell(row, cols);

% Iterates through each pixel of array and uses patterns to assemble the
% key
for i = 1: row
    for j = 1: cols
        key{i, j} = patterns{array(i,j)};
    end
end
end
