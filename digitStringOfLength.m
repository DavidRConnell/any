function str = digitStringOfLength(n)
%DIGITSTRINGOFLENGTH return a string of digits
%   STR = DIGITSTRINGOFLENGTH(N) generate a string of random digits between 0
%   and 9 of length N.

    str = sprintf('%d', randi([0 9], [1 n]));
end
