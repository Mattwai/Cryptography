function encrypted = EncryptImage(image, key)
% Encryption
%
% Purpose:
%       This function encrypts the plain image using the key cell array of
%       2x2 uint8 patterns, to obtain an encrytped cell array of
%       2x2 uint8 patterns (the patterns for our cipher image)
% Inputs:
%       1)A 2D array of uint8 values (i.e. a grayscale image) containing the black
%       and white plain image to encrypt.
%       2)A 2D cell array of 2x2 patterns to act as a key array of patterns.
%       Each element of the cell array will be a pattern stored as a 2x2 array of
%       uint8 values (i.e. agrayscale image)
% Output:
%        A 2D cellarray of 2x2 patterns which is our cipher arrayof patterns
%       (i.e. it was created by encrypting our plain image).  Each element of the array
%       will be a pattern stored as a 2x2 array of uint8 values (i.e. a grayscale image)
%
% Example:
%       tinyO = uint8([255 0 0 255; 0 255 255 0; 255 0 0 255])
%
%       tinyO will be a 3×4 uint8 matrix with values
%           255     0     0   255
%             0   255   255     0
%           255     0     0   255
%
%       keyImage = uint8([     0   255     0   255   255   255     0   255;
%                              0   255   255     0     0     0     0   255;
%                            255   255   255     0     0   255   255     0;
%                              0     0     0   255   255     0     0   255;
%                              0   255   255     0     0     0     0   255;
%                            255     0   255     0   255   255     0   255; ]);
%
%       keyArray = ImageToPatterns(keyImage)
%       keyArray will be a 3×4 cell array containging 2×2 uint8
%
%       cipherArray = EncryptImage(tinyO,keyArray)
%       cipherArray will be a 3×4 cell array containging 2×2 uint8
%
%       c11 = cipherArray{1,1}
%
%       cl1 will be a 2×2 uint8 matrix with values
%           0   255
%           0	255
%
%       c12 = cipherArray{1,2}
%       c12 will be a 2×2 uint8 matrix with values
%         255     0
%           0   255
%
% Author: Matthew Wai

% Use the size function to get the array for key
[row, cols] = size(key);

% Iterate through each pixel
for i = 1:row
    for j = 1:cols
        
        % If the image is dark, has a pixel value less than 128 use
        % complement pattern
        if image(i,j)  < 128
            
            % Assign to the cipher array of patterns, the complement of the
            % pattern from the corresponding position in the key array of
            % patterns by using the ImageComplment function
            encrypted{i,j} = ImageComplement(key{i,j});
            
        else
            % Assign to the cipher array of patterns, the original pattern
            % from the corresponding position in the key array of patterns
            encrypted{i,j} = key{i,j};
            
        end
    end
end