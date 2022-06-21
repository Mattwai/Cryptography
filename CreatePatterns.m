function patterns = CreatePatterns()
% Key Creation
%
% Purpose:
%     This function creates a 1D cell array containing 6 special 2x2 patterns
%     of uint8 values, these patterns will be used for key generation
% Input:
%     None
% Output:
%     A single 1 x6 cellarray of patterns.  It will contain the following six 2x2
%     patterns (in this order): bottom 2 black, top 2 black, left 2 black, right 2 black,
%     leading diagonal black, off diagonal blackEach pattern will be stored as a 2x2 uint8
%     value array (i.e. a greyscale image)
%
% Example:
%     p = CreatePatterns()
%     pattern1 = p{1} % note curly braces
%     pattern1 should have values
%       255   255
%       0	  0
%
%     pattern3 = p{3} % note curly braces
%     pattern3 should have values
%       0   255
%       0   25
%
% Author: Matthew Wai

% 6 patterns
pattern1 = uint8([255 255; 0 0]);
pattern2 = uint8([0 0; 255 255]);
pattern3 = uint8([0 255; 0 255]);
pattern4 = uint8([255 0; 255 0]);
pattern5 = uint8([0 255; 255 0]);
pattern6 = uint8([255 0; 0 255]);

% Cell array of patterns
patterns = {pattern1, pattern2, pattern3, pattern4, pattern5, pattern6};

end