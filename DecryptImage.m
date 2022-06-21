function decrypted = DecryptImage(image, key)
% Decryption
%
% Purpose:
%       This function will decrypt the cipher image using the key image
% Input(s):
%       1)A 2D array of uint8 values (i.e. a grayscale image) containing the
%       black and white cipher image (each pixel will have a value of 0 or 255)
%       2)A 2D array of uint8 values (i.e. a grayscale image) containing the
%       black and white key image(each pixel will have a value of 0 or 255)
% Output:
%       A 2D array of uint8 values (i.e. a grayscale image) containing the decrypted image,
%       this will be the same size as the key.
%
% Example:
%       cipherImage = uint8([  0   255   255     0     0     0     0   255;
%                              0   255     0   255   255   255     0   255;]);
%
%       keyImage = uint8([     0   255     0   255   255   255     0   255;
%                              0   255   255     0     0     0     0   255;]);
%
%       plainImage = DecryptImage(cipherImage,keyImage)
%
%       plainImage will be a 2×8 uint8 matrix with values
%           255   255     0     0     0     0   255   255
%           255   255     0     0     0     0   255   255
%
%       cipherImage = uint8([  0   255   255     0     0     0     0   255;
%                              0   255     0   255   255   255     0   255;
%                              0     0   255     0     0   255     0   255;
%                            255   255     0   255   255     0   255     0;
%                              0   255     0   255   255   255     0   255;
%                            255     0     0   255     0     0     0   255; ]);
%
%       keyImage = uint8([     0   255     0   255   255   255     0   255;
%                              0   255   255     0     0     0     0   255;
%                            255   255   255     0     0   255   255     0;
%                              0     0     0   255   255     0     0   255;
%                              0   255   255     0     0     0     0   255;
%                            255     0   255     0   255   255     0   255; ]);
%
%       plainImage = DecryptImage(cipherImage,keyImage)
%       plainImage will be a 6×8 uint8 matrix with values
%            255   255     0     0     0     0   255   255
%            255   255     0     0     0     0   255   255
%              0     0   255   255   255   255     0     0
%              0     0   255   255   255   255     0     0
%            255   255     0     0     0     0   255   255
%            255   255     0     0     0     0   255   255
%
% Author: Matthew Wai

% Gets the array for the key image and iterates through each pixel
[row, cols] = size(key);
for i = 1:row
    for j = 1:cols
        % If both the same pixel from the key and image are the same colour
        % (both black or both white), change pixel value to white
        if image(i,j) == key(i,j)
            decrypted(i,j) = uint8(255);
            % Else, if either pixel is a different colour,
            % change value to black
        else
            decrypted(i,j) = uint8(0);
        end
    end
end