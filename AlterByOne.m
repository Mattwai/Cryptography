function number = AlterByOne(number)
% Helper Function
%
% Purpose:
%       This function adds 1 to a uint8 value in the range of 0-255 inclusive
%       (subtracts 1 if vaue is 255)
% Input(s):
%       An integer value somewhere between 0and 255 inclusive
% Output:
%       A uint8 value that is one more (unless the original value was 255,
%       in which case itis one less)
%
% Example:
%       v = AlterByOne(0) % should return 1
%       v = AlterByOne(10) % should return 11
%       v = AlterByOne(128) % should return 129
%       v = AlterByOne(255) % should return 254
%
% Author: Matthew Wai

% Turns number into a Uint8 value and if the number is between 0 and 254
% inclusive add 1, else -1
number = uint8(number);
if (0 <= number) && (number < 255)
    number = number + 1;
else
    number = number - 1;
    
end