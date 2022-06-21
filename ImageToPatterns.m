function cell_array = ImageToPatterns(image)
% Encryption
%
% Purpose:
%       This function converts the key image back into a cell array of
%       2x2 uint8 patterns so that we can more easily work with the key
% Input:
%       A 2D array of uint8 values (i.e. a grayscale image) containing an
%       image made up of lots of black and white pixels
% Output:
%       A 2D cellarray of 2x2 patterns extracted from the image.  Each element
%       of the array will be a pattern stored as a 2x2 array of uint8 values
%       (i.e. a grayscale image)
%
% Example:
%       im = uint8([0 0 0 255; 255 255 255 0])
%       im will have values
%           0     0     0   255
%         255   255   255     0
%       p = ImageToPatterns(im)
%       p will be a  1×2 cell array containing 2×2 uint8 matrices
%
%       p1 = p{1} % note curly braces
%       p1 will be a 2×2 uint8 matrix with values
%           0     0
%         255   255
%
%       p2 = p{2} % note curly braces
%       p2 will be 2×2 uint8 matrix with values
%           0   255
%         255     0
%
%       image = uint8([     0   255     0   255   255   255     0   255;
%                           0   255   255     0     0     0     0   255;
%                         255   255   255     0     0   255   255     0;
%                           0     0     0   255   255     0     0   255;
%                           0   255   255     0     0     0     0   255;
%                         255     0   255     0   255   255     0   255; ]);
%       p = ImageToPatterns(image)
%       p will be a 3×4 cell array containging 2×2 uint8 values
%       p13 = p{1,3}
%       ans will be a 2×2 uint8 matrix with values
%           255   255
%             0     0

% Author: Matthew Wai

% Gets the size array of the image and uses the mat2cell function to
% convert the image array into a 2x2 cell array
[row , cols] = size(image);
cell_array = mat2cell(image, zeros((row)/2, 1) + 2, zeros((cols)/2, 1) + 2);

end